import React, { useEffect, useState } from 'react';
import {
  Box,
  Typography,
  Button,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  TablePagination,
  Chip,
  CircularProgress,
  Alert,
  Card,
  CardContent,
  useMediaQuery,
  useTheme,
  TextField,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Grid,
  Checkbox,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  Stack,
  FormGroup,
  FormControlLabel,
  FormLabel,
  type SelectChangeEvent,
} from '@mui/material';
import { Add, Search, Refresh, Edit, Delete, Lock, LockOpen, VpnKey } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useForm, Controller } from 'react-hook-form';
import {
  getUsers, deleteUser, toggleUserStatus, updateUser,
  type User, type UserUpdateRequest,
} from '../../api/user';
import { getCompanies } from '../../api/project';
import type { Company } from '../../types/project.types';

interface UserSearchForm {
  companyId: string;
  email: string;
  name: string;
  isActive: string;
}

const EMPTY_SEARCH_FORM: UserSearchForm = {
  companyId: '',
  email: '',
  name: '',
  isActive: '',
};

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

  const [companies, setCompanies] = useState<Company[]>([]);

  const [searchForm, setSearchForm] = useState<UserSearchForm>(EMPTY_SEARCH_FORM);
  const [activeParams, setActiveParams] = useState<{
    companyId?: number; email?: string; name?: string; isActive?: boolean;
  }>({});
  const [hasSearched, setHasSearched] = useState(false);

  // 체크박스 (단일 선택)
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
    getCompanies()
      .then(setCompanies)
      .catch((err) => console.error('Failed to load companies:', err));
  }, []);

  useEffect(() => {
    if (!hasSearched) return;
    const doFetch = async () => {
      setLoading(true);
      setError('');
      try {
        const params: {
          page: number; size: number;
          companyId?: number; email?: string; name?: string; isActive?: boolean;
        } = { page, size: rowsPerPage, ...activeParams };
        const response = await getUsers(params);
        setUsers(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        setError(err.message || '사용자 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams, hasSearched]);

  const handleSearch = () => {
    const params: { companyId?: number; email?: string; name?: string; isActive?: boolean } = {};
    if (searchForm.companyId) params.companyId = Number(searchForm.companyId);
    if (searchForm.email) params.email = searchForm.email;
    if (searchForm.name) params.name = searchForm.name;
    if (searchForm.isActive !== '') params.isActive = searchForm.isActive === 'true';

    setHasSearched(true);
    setSelectedUserId(null);
    setPage(0);
    setActiveParams(params);
  };

  const handleClearSearch = () => {
    setHasSearched(false);
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedUserId(null);
    setPage(0);
    setActiveParams({});
    setUsers([]);
    setTotalElements(0);
  };

  const handleCheckboxChange = (userId: number) => {
    setSelectedUserId(prev => (prev === userId ? null : userId));
  };

  // 수정 팝업 열기
  const handleOpenEdit = () => {
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
      setActiveParams(prev => ({ ...prev }));
    } catch (err: any) {
      setEditError(err.response?.data?.message || err.message || '사용자 정보 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

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
      setActiveParams(prev => ({ ...prev }));
    } catch (err: any) {
      setError(err.message || '사용자 삭제에 실패했습니다.');
      setDeleteDialogOpen(false);
    }
  };

  const handleToggleStatus = async (userId: number) => {
    try {
      await toggleUserStatus(userId);
      setActiveParams(prev => ({ ...prev }));
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

  const isExactlyOneSelected = selectedUserId !== null;

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
      {/* 상단 제목 + 버튼 */}
      <Box sx={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        mb: 3,
        flexWrap: 'wrap',
        gap: 2,
        width: '100%',
      }}>
        <Typography variant={isMobile ? 'h5' : 'h4'}>사용자 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
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
            onClick={handleOpenEdit}
            disabled={!isExactlyOneSelected}
            size={isMobile ? 'small' : 'medium'}
          >
            수정
          </Button>
          <Button
            variant="outlined"
            color="error"
            startIcon={<Delete />}
            onClick={handleDeleteClick}
            disabled={!isExactlyOneSelected}
            size={isMobile ? 'small' : 'medium'}
          >
            삭제
          </Button>
        </Stack>
      </Box>

      {error && (
        <Alert severity="error" sx={{ mb: 2 }} onClose={() => setError('')}>{error}</Alert>
      )}

      {/* 검색 영역: 회사 → ID → 이름 → 상태 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>회사</InputLabel>
              <Select
                value={searchForm.companyId}
                label="회사"
                onChange={(e: SelectChangeEvent<string>) =>
                  setSearchForm(prev => ({ ...prev, companyId: e.target.value }))
                }
              >
                <MenuItem value="">전체</MenuItem>
                {companies.map((c) => (
                  <MenuItem key={c.id} value={String(c.id)}>{c.name}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 180 }, flexGrow: { md: 1.2 } }}>
            <TextField
              fullWidth
              label="ID"
              value={searchForm.email}
              onChange={(e) => setSearchForm(prev => ({ ...prev, email: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
            <TextField
              fullWidth
              label="이름"
              value={searchForm.name}
              onChange={(e) => setSearchForm(prev => ({ ...prev, name: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 130 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.isActive}
                label="상태"
                onChange={(e: SelectChangeEvent<string>) =>
                  setSearchForm(prev => ({ ...prev, isActive: e.target.value }))
                }
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="true">활성</MenuItem>
                <MenuItem value="false">비활성</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ display: 'flex', gap: 1, flexShrink: 0 }}>
            <Button
              variant="contained"
              onClick={handleSearch}
              startIcon={<Search />}
              size="medium"
              sx={{ whiteSpace: 'nowrap' }}
            >
              검색
            </Button>
            <Button
              variant="outlined"
              onClick={handleClearSearch}
              startIcon={<Refresh />}
              size="medium"
              sx={{ whiteSpace: 'nowrap' }}
            >
              초기화
            </Button>
          </Grid>
        </Grid>
      </Paper>

      {/* 모바일: 카드 뷰 */}
      {isMobile ? (
        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, width: '100%' }}>
          {loading ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <CircularProgress size={24} />
              <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
            </Paper>
          ) : !hasSearched ? (
            <Paper sx={{ p: 4, textAlign: 'center' }}>
              <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
            </Paper>
          ) : users.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
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
                    <Button size="small" color="secondary" startIcon={<VpnKey />}
                      onClick={() => navigate(`/users/${user.id}/password`)}>
                      비밀번호
                    </Button>
                    <Button
                      size="small"
                      color={user.isActive ? 'warning' : 'success'}
                      startIcon={user.isActive ? <Lock /> : <LockOpen />}
                      onClick={() => handleToggleStatus(user.id)}
                    >
                      {user.isActive ? '비활성화' : '활성화'}
                    </Button>
                  </Box>
                </CardContent>
              </Card>
            ))
          )}
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 2 }}>
            <TablePagination
              component="div"
              count={totalElements}
              page={page}
              onPageChange={(_: React.MouseEvent<HTMLButtonElement> | null, newPage: number) => setPage(newPage)}
              rowsPerPage={rowsPerPage}
              onRowsPerPageChange={(e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
                setRowsPerPage(parseInt(e.target.value, 10));
                setPage(0);
              }}
              labelRowsPerPage="페이지당:"
            />
          </Box>
        </Box>
      ) : (
        /* 데스크탑: 테이블 뷰 */
        <TableContainer component={Paper} sx={{ width: '100%' }}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell padding="checkbox" />
                <TableCell align="center">ID</TableCell>
                <TableCell align="center">이름</TableCell>
                <TableCell align="center">이메일</TableCell>
                <TableCell align="center">회사</TableCell>
                <TableCell align="center">부서</TableCell>
                <TableCell align="center">직급</TableCell>
                <TableCell align="center">권한</TableCell>
                <TableCell align="center">상태</TableCell>
                <TableCell align="center">마지막 로그인</TableCell>
                <TableCell align="center">기타</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {loading ? (
                <TableRow>
                  <TableCell colSpan={11} align="center">
                    <CircularProgress size={24} />
                    <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
                  </TableCell>
                </TableRow>
              ) : !hasSearched ? (
                <TableRow>
                  <TableCell colSpan={11} align="center">
                    <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
                  </TableCell>
                </TableRow>
              ) : users.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={11} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                users.map((user) => (
                  <TableRow
                    key={user.id}
                    hover
                    selected={selectedUserId === user.id}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => handleCheckboxChange(user.id)}
                  >
                    <TableCell padding="checkbox" onClick={e => e.stopPropagation()}>
                      <Checkbox
                        checked={selectedUserId === user.id}
                        onChange={() => handleCheckboxChange(user.id)}
                        size="small"
                      />
                    </TableCell>
                    <TableCell align="center">{user.id}</TableCell>
                    <TableCell align="center">{user.name}</TableCell>
                    <TableCell align="center">{user.email}</TableCell>
                    <TableCell align="center">{user.companyName || '-'}</TableCell>
                    <TableCell align="center">{user.departmentName || '-'}</TableCell>
                    <TableCell align="center">{user.position || '-'}</TableCell>
                    <TableCell align="center">{user.roles?.join(', ') || '-'}</TableCell>
                    <TableCell align="center">{getStatusChip(user)}</TableCell>
                    <TableCell align="center">
                      {user.lastLoginAt ? new Date(user.lastLoginAt).toLocaleString() : '-'}
                    </TableCell>
                    <TableCell align="center" onClick={e => e.stopPropagation()}>
                      <Button
                        size="small"
                        color="secondary"
                        startIcon={<VpnKey />}
                        onClick={() => navigate(`/users/${user.id}/password`)}
                        sx={{ mr: 0.5 }}
                      >
                        비밀번호
                      </Button>
                      <Button
                        size="small"
                        color={user.isActive ? 'warning' : 'success'}
                        startIcon={user.isActive ? <Lock /> : <LockOpen />}
                        onClick={() => handleToggleStatus(user.id)}
                      >
                        {user.isActive ? '비활성화' : '활성화'}
                      </Button>
                    </TableCell>
                  </TableRow>
                ))
              )}
            </TableBody>
          </Table>
          <TablePagination
            component="div"
            count={totalElements}
            page={page}
            onPageChange={(_: React.MouseEvent<HTMLButtonElement> | null, newPage: number) => setPage(newPage)}
            rowsPerPage={rowsPerPage}
            onRowsPerPageChange={(e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
              setRowsPerPage(parseInt(e.target.value, 10));
              setPage(0);
            }}
            labelRowsPerPage="페이지당 행 수:"
          />
        </TableContainer>
      )}

      {/* 수정 팝업 Dialog */}
      <Dialog open={editDialogOpen} onClose={() => setEditDialogOpen(false)} maxWidth="sm" fullWidth>
        <DialogTitle>사용자 정보 수정</DialogTitle>
        <DialogContent>
          {editUser && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              {editError && <Alert severity="error">{editError}</Alert>}

              {/* 읽기 전용 정보 */}
              <Box sx={{
                display: 'grid',
                gridTemplateColumns: 'repeat(2, 1fr)',
                gap: 1,
                p: 1.5,
                bgcolor: 'grey.50',
                borderRadius: 1,
              }}>
                <Box>
                  <Typography variant="caption" color="text.secondary">이메일(ID)</Typography>
                  <Typography variant="body2" fontWeight="bold">{editUser.email}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">회사</Typography>
                  <Typography variant="body2">{editUser.companyName || '-'}</Typography>
                </Box>
              </Box>

              {/* 편집 가능 필드 */}
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
            </Box>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => { setEditDialogOpen(false); reset(); }} disabled={editLoading}>
            취소
          </Button>
          <Button type="submit" form="edit-user-form" variant="contained" disabled={editLoading}>
            {editLoading ? <CircularProgress size={20} color="inherit" /> : '저장'}
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
