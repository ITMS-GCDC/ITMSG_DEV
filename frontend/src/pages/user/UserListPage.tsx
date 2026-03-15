import React, { useEffect, useState } from 'react';
import {
  Box, Typography, Button, Paper, Table, TableBody, TableCell, TableContainer,
  TableHead, TableRow, TablePagination, Chip, Card, CardContent, useMediaQuery,
  useTheme, Alert, CircularProgress, IconButton, Dialog, DialogTitle, DialogContent,
  DialogContentText, DialogActions, TextField, MenuItem, Select, FormControl,
  InputLabel, Checkbox, FormGroup, FormControlLabel, FormLabel,
} from '@mui/material';
import { Add, Edit, Delete, Lock, LockOpen, VpnKey, Search } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useForm, Controller } from 'react-hook-form';
import {
  getUsers, deleteUser, toggleUserStatus, updateUser,
  type User, type UserUpdateRequest,
} from '../../api/user';

const AVAILABLE_ROLES = [
  { name: 'ROLE_USER', label: '일반 사용자', description: '기본 사용자 권한' },
  { name: 'ROLE_SYSTEM_ADMIN', label: '시스템 관리자', description: '사용자 관리 가능' },
];

const UserListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [users, setUsers] = useState<User[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // 검색 조건 (순서: 회사, ID, 이름, 상태)
  const [searchCompany, setSearchCompany] = useState('');
  const [searchEmail, setSearchEmail] = useState('');
  const [searchName, setSearchName] = useState('');
  const [searchStatus, setSearchStatus] = useState<'' | 'true' | 'false'>('');

  // 실제 적용된 검색 조건 (검색 버튼 클릭 시 반영)
  const [appliedCompany, setAppliedCompany] = useState('');
  const [appliedEmail, setAppliedEmail] = useState('');
  const [appliedName, setAppliedName] = useState('');
  const [appliedStatus, setAppliedStatus] = useState<'' | 'true' | 'false'>('');

  // 체크박스 선택
  const [selectedUserId, setSelectedUserId] = useState<number | null>(null);

  // 삭제 확인 Dialog
  const [deleteDialogOpen, setDeleteDialogOpen] = useState(false);

  // 수정 팝업 Dialog
  const [editDialogOpen, setEditDialogOpen] = useState(false);
  const [editUser, setEditUser] = useState<User | null>(null);
  const [editLoading, setEditLoading] = useState(false);
  const [editError, setEditError] = useState('');
  const [editRoles, setEditRoles] = useState<string[]>(['ROLE_USER']);

  const { control, handleSubmit, setValue, reset, formState: { errors } } = useForm<UserUpdateRequest>();

  useEffect(() => {
    fetchUsers();
  }, [page, rowsPerPage, appliedCompany, appliedEmail, appliedName, appliedStatus]);

  const fetchUsers = async () => {
    setLoading(true);
    setError('');
    try {
      const params: {
        page: number; size: number;
        companyName?: string; email?: string; name?: string; isActive?: boolean;
      } = { page, size: rowsPerPage };
      if (appliedCompany) params.companyName = appliedCompany;
      if (appliedEmail) params.email = appliedEmail;
      if (appliedName) params.name = appliedName;
      if (appliedStatus !== '') params.isActive = appliedStatus === 'true';

      const response = await getUsers(params);
      setUsers(response.content);
      setTotalElements(response.totalElements);
    } catch (err: any) {
      setError(err.message || '사용자 목록을 불러오는데 실패했습니다.');
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = () => {
    setPage(0);
    setSelectedUserId(null);
    setAppliedCompany(searchCompany);
    setAppliedEmail(searchEmail);
    setAppliedName(searchName);
    setAppliedStatus(searchStatus);
  };

  const handleSearchKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') handleSearch();
  };

  const handleChangePage = (_event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  const handleCheckboxChange = (userId: number) => {
    setSelectedUserId(prev => (prev === userId ? null : userId));
  };

  // 수정 팝업 열기
  const handleEditClick = () => {
    if (!selectedUserId) return;
    const user = users.find(u => u.id === selectedUserId);
    if (!user) return;
    setEditUser(user);
    setEditRoles(user.roles && user.roles.length > 0 ? user.roles : ['ROLE_USER']);
    setValue('name', user.name);
    setValue('phoneNumber', user.phoneNumber || '');
    setValue('position', user.position || '');
    setValue('employeeNumber', user.employeeNumber || '');
    setEditError('');
    setEditDialogOpen(true);
  };

  const handleEditRoleChange = (roleName: string, checked: boolean) => {
    if (checked) {
      setEditRoles(prev => [...prev, roleName]);
    } else {
      if (editRoles.length > 1) {
        setEditRoles(prev => prev.filter(r => r !== roleName));
      }
    }
  };

  const onEditSubmit = async (data: UserUpdateRequest) => {
    if (!selectedUserId) return;
    setEditLoading(true);
    setEditError('');
    try {
      await updateUser(selectedUserId, { ...data, roleNames: editRoles });
      setEditDialogOpen(false);
      setSelectedUserId(null);
      reset();
      fetchUsers();
    } catch (err: any) {
      setEditError(err.response?.data?.message || err.message || '사용자 정보 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  // 삭제 처리
  const handleDeleteClick = () => {
    if (!selectedUserId) return;
    setDeleteDialogOpen(true);
  };

  const handleDeleteConfirm = async () => {
    if (!selectedUserId) return;
    try {
      await deleteUser(selectedUserId);
      setDeleteDialogOpen(false);
      setSelectedUserId(null);
      fetchUsers();
    } catch (err: any) {
      setError(err.message || '사용자 삭제에 실패했습니다.');
      setDeleteDialogOpen(false);
    }
  };

  const handleToggleStatus = async (userId: number) => {
    try {
      await toggleUserStatus(userId);
      fetchUsers();
    } catch (err: any) {
      setError(err.message || '사용자 상태 변경에 실패했습니다.');
    }
  };

  const getStatusChip = (user: User) => {
    if (user.isLocked) return <Chip label="잠김" color="error" size="small" icon={<Lock />} />;
    if (!user.isActive) return <Chip label="비활성" color="default" size="small" />;
    if (!user.isApproved) return <Chip label="미승인" color="warning" size="small" />;
    return <Chip label="활성" color="success" size="small" />;
  };

  const hasSelection = selectedUserId !== null;

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
      {/* 헤더 */}
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 2, flexWrap: 'wrap', gap: 1 }}>
        <Typography variant={isMobile ? 'h5' : 'h4'}>사용자 관리</Typography>
      </Box>

      {error && (
        <Alert severity="error" sx={{ mb: 2 }} onClose={() => setError('')}>{error}</Alert>
      )}

      {/* 검색 조건 영역 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 2, alignItems: 'flex-end' }}>
          {/* 1. 회사 */}
          <TextField
            label="회사"
            size="small"
            value={searchCompany}
            onChange={e => setSearchCompany(e.target.value)}
            onKeyDown={handleSearchKeyDown}
            sx={{ minWidth: 160 }}
          />
          {/* 2. ID (이메일) */}
          <TextField
            label="ID"
            size="small"
            value={searchEmail}
            onChange={e => setSearchEmail(e.target.value)}
            onKeyDown={handleSearchKeyDown}
            sx={{ minWidth: 200 }}
          />
          {/* 3. 이름 */}
          <TextField
            label="이름"
            size="small"
            value={searchName}
            onChange={e => setSearchName(e.target.value)}
            onKeyDown={handleSearchKeyDown}
            sx={{ minWidth: 160 }}
          />
          {/* 4. 상태 */}
          <FormControl size="small" sx={{ minWidth: 130 }}>
            <InputLabel>상태</InputLabel>
            <Select
              label="상태"
              value={searchStatus}
              onChange={e => setSearchStatus(e.target.value as '' | 'true' | 'false')}
            >
              <MenuItem value="">전체</MenuItem>
              <MenuItem value="true">활성</MenuItem>
              <MenuItem value="false">비활성</MenuItem>
            </Select>
          </FormControl>
          <Button
            variant="contained"
            startIcon={<Search />}
            onClick={handleSearch}
            size="small"
          >
            검색
          </Button>
        </Box>
      </Paper>

      {/* 버튼 영역 */}
      <Box sx={{ display: 'flex', gap: 1, mb: 1, justifyContent: 'flex-end' }}>
        <Button
          variant="contained"
          startIcon={<Add />}
          onClick={() => navigate('/users/new')}
          size={isMobile ? 'small' : 'medium'}
        >
          신규
        </Button>
        <Button
          variant="outlined"
          startIcon={<Edit />}
          onClick={handleEditClick}
          disabled={!hasSelection}
          size={isMobile ? 'small' : 'medium'}
        >
          수정
        </Button>
        <Button
          variant="outlined"
          color="error"
          startIcon={<Delete />}
          onClick={handleDeleteClick}
          disabled={!hasSelection}
          size={isMobile ? 'small' : 'medium'}
        >
          삭제
        </Button>
      </Box>

      {/* 모바일: 카드 뷰 */}
      {isMobile ? (
        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, width: '100%' }}>
          {loading ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <CircularProgress size={24} />
              <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
            </Paper>
          ) : users.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">데이터가 없습니다.</Typography>
            </Paper>
          ) : (
            users.map((user) => (
              <Card key={user.id} sx={{ width: '100%' }}>
                <CardContent>
                  <Box sx={{ display: 'flex', alignItems: 'center', gap: 1, mb: 1 }}>
                    <Checkbox
                      checked={selectedUserId === user.id}
                      onChange={() => handleCheckboxChange(user.id)}
                      size="small"
                    />
                    <Typography variant="h6">{user.name}</Typography>
                    {getStatusChip(user)}
                  </Box>
                  <Typography variant="body2" color="text.secondary">{user.email}</Typography>
                  <Typography variant="body2" color="text.secondary">
                    {user.companyName}{user.departmentName ? ` - ${user.departmentName}` : ''}
                  </Typography>
                  <Box sx={{ display: 'flex', gap: 1, mt: 2 }}>
                    <IconButton size="small" color="secondary" onClick={() => navigate(`/users/${user.id}/password`)}>
                      <VpnKey />
                    </IconButton>
                    <IconButton
                      size="small"
                      color={user.isActive ? 'warning' : 'success'}
                      onClick={() => handleToggleStatus(user.id)}
                    >
                      {user.isActive ? <Lock /> : <LockOpen />}
                    </IconButton>
                  </Box>
                </CardContent>
              </Card>
            ))
          )}
        </Box>
      ) : (
        <Paper sx={{ width: '100%', overflow: 'hidden' }}>
          <TableContainer sx={{ maxHeight: 'calc(100vh - 400px)' }}>
            <Table stickyHeader aria-label="user table" size="small">
              <TableHead>
                <TableRow>
                  <TableCell padding="checkbox" />
                  <TableCell>ID</TableCell>
                  <TableCell>이름</TableCell>
                  <TableCell>이메일</TableCell>
                  <TableCell>회사</TableCell>
                  <TableCell>부서</TableCell>
                  <TableCell>직급</TableCell>
                  <TableCell>권한</TableCell>
                  <TableCell>상태</TableCell>
                  <TableCell>마지막 로그인</TableCell>
                  <TableCell align="center">기타</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {loading ? (
                  <TableRow>
                    <TableCell colSpan={11} align="center">
                      <CircularProgress size={24} />
                    </TableCell>
                  </TableRow>
                ) : users.length === 0 ? (
                  <TableRow>
                    <TableCell colSpan={11} align="center">데이터가 없습니다.</TableCell>
                  </TableRow>
                ) : (
                  users.map((user) => (
                    <TableRow
                      key={user.id}
                      hover
                      selected={selectedUserId === user.id}
                      onClick={() => handleCheckboxChange(user.id)}
                      sx={{ cursor: 'pointer' }}
                    >
                      <TableCell padding="checkbox" onClick={e => e.stopPropagation()}>
                        <Checkbox
                          checked={selectedUserId === user.id}
                          onChange={() => handleCheckboxChange(user.id)}
                          size="small"
                        />
                      </TableCell>
                      <TableCell>{user.id}</TableCell>
                      <TableCell>{user.name}</TableCell>
                      <TableCell>{user.email}</TableCell>
                      <TableCell>{user.companyName || '-'}</TableCell>
                      <TableCell>{user.departmentName || '-'}</TableCell>
                      <TableCell>{user.position || '-'}</TableCell>
                      <TableCell>{user.roles?.join(', ') || '-'}</TableCell>
                      <TableCell>{getStatusChip(user)}</TableCell>
                      <TableCell>
                        {user.lastLoginAt ? new Date(user.lastLoginAt).toLocaleString() : '-'}
                      </TableCell>
                      <TableCell align="center" onClick={e => e.stopPropagation()}>
                        <IconButton size="small" color="secondary" onClick={() => navigate(`/users/${user.id}/password`)}>
                          <VpnKey />
                        </IconButton>
                        <IconButton
                          size="small"
                          color={user.isActive ? 'warning' : 'success'}
                          onClick={() => handleToggleStatus(user.id)}
                          title={user.isActive ? '비활성화' : '활성화'}
                        >
                          {user.isActive ? <Lock /> : <LockOpen />}
                        </IconButton>
                      </TableCell>
                    </TableRow>
                  ))
                )}
              </TableBody>
            </Table>
          </TableContainer>
          <TablePagination
            rowsPerPageOptions={[5, 10, 25]}
            component="div"
            count={totalElements}
            rowsPerPage={rowsPerPage}
            page={page}
            onPageChange={handleChangePage}
            onRowsPerPageChange={handleChangeRowsPerPage}
          />
        </Paper>
      )}

      {/* 수정 팝업 Dialog */}
      <Dialog open={editDialogOpen} onClose={() => setEditDialogOpen(false)} maxWidth="sm" fullWidth>
        <DialogTitle>사용자 정보 수정</DialogTitle>
        <DialogContent>
          {editUser && (
            <Box sx={{ mb: 2, p: 1.5, bgcolor: 'rgba(0,0,0,0.03)', borderRadius: 1, mt: 1 }}>
              <Typography variant="body2" color="text.secondary">
                이메일: <strong>{editUser.email}</strong>
              </Typography>
              <Typography variant="body2" color="text.secondary">
                회사: <strong>{editUser.companyName || '-'}</strong>
              </Typography>
            </Box>
          )}
          {editError && <Alert severity="error" sx={{ mb: 1 }}>{editError}</Alert>}
          <Box component="form" id="edit-user-form" onSubmit={handleSubmit(onEditSubmit)}>
            <Controller
              name="name"
              control={control}
              rules={{ required: '이름은 필수입니다.', maxLength: { value: 50, message: '최대 50자' } }}
              render={({ field }) => (
                <TextField
                  {...field}
                  label="이름"
                  fullWidth
                  margin="dense"
                  size="small"
                  error={!!errors.name}
                  helperText={errors.name?.message}
                  required
                />
              )}
            />
            <Controller
              name="phoneNumber"
              control={control}
              rules={{ maxLength: { value: 20, message: '최대 20자' } }}
              render={({ field }) => (
                <TextField
                  {...field}
                  label="전화번호"
                  fullWidth
                  margin="dense"
                  size="small"
                  error={!!errors.phoneNumber}
                  helperText={errors.phoneNumber?.message}
                />
              )}
            />
            <Controller
              name="employeeNumber"
              control={control}
              rules={{ maxLength: { value: 20, message: '최대 20자' } }}
              render={({ field }) => (
                <TextField
                  {...field}
                  label="사번"
                  fullWidth
                  margin="dense"
                  size="small"
                  error={!!errors.employeeNumber}
                  helperText={errors.employeeNumber?.message}
                />
              )}
            />
            <Controller
              name="position"
              control={control}
              rules={{ maxLength: { value: 50, message: '최대 50자' } }}
              render={({ field }) => (
                <TextField
                  {...field}
                  label="직급"
                  fullWidth
                  margin="dense"
                  size="small"
                  error={!!errors.position}
                  helperText={errors.position?.message}
                />
              )}
            />
            <FormControl component="fieldset" sx={{ mt: 2, width: '100%' }}>
              <FormLabel component="legend" sx={{ mb: 0.5, fontWeight: 600, fontSize: '0.875rem' }}>
                권한 설정
              </FormLabel>
              <Paper variant="outlined" sx={{ p: 1.5 }}>
                <FormGroup>
                  {AVAILABLE_ROLES.map((role) => (
                    <FormControlLabel
                      key={role.name}
                      control={
                        <Checkbox
                          checked={editRoles.includes(role.name)}
                          onChange={(e) => handleEditRoleChange(role.name, e.target.checked)}
                          disabled={editRoles.length === 1 && editRoles.includes(role.name)}
                          size="small"
                        />
                      }
                      label={
                        <Box>
                          <Typography variant="body2">{role.label}</Typography>
                          <Typography variant="caption" color="text.secondary">{role.description}</Typography>
                        </Box>
                      }
                      sx={{ mb: 0.5, alignItems: 'flex-start' }}
                    />
                  ))}
                </FormGroup>
              </Paper>
            </FormControl>
          </Box>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => { setEditDialogOpen(false); reset(); }} disabled={editLoading}>취소</Button>
          <Button type="submit" form="edit-user-form" variant="contained" disabled={editLoading}>
            {editLoading ? <CircularProgress size={20} color="inherit" /> : '수정'}
          </Button>
        </DialogActions>
      </Dialog>

      {/* 삭제 확인 Dialog */}
      <Dialog open={deleteDialogOpen} onClose={() => setDeleteDialogOpen(false)}>
        <DialogTitle>사용자 삭제</DialogTitle>
        <DialogContent>
          <DialogContentText>
            정말로 이 사용자를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setDeleteDialogOpen(false)}>취소</Button>
          <Button onClick={handleDeleteConfirm} color="error" autoFocus>삭제</Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default UserListPage;
