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
  DialogActions,
  Stack,
} from '@mui/material';
import { Add, Search, Refresh, Edit, Delete } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { getSrs, deleteSr, updateSr } from '../../api/sr';
import type { ServiceRequest, SrListParams, SrUpdateRequest } from '../../types/sr.types';

// 검색 폼 전용 타입 (5개 조건만 사용)
interface SrSearchForm {
  companyName: string;
  projectName: string;
  srType: string;
  status: string;
  priority: string;
}

const EMPTY_SEARCH_FORM: SrSearchForm = {
  companyName: '',
  projectName: '',
  srType: '',
  status: '',
  priority: '',
};

const SRListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));
  const [srs, setSrs] = useState<ServiceRequest[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // 검색 폼 입력 상태 (회사명, 프로젝트명, 유형, 상태, 우선순위)
  const [searchForm, setSearchForm] = useState<SrSearchForm>(EMPTY_SEARCH_FORM);

  // 실제 API 호출에 사용되는 검색 파라미터 (검색 버튼 클릭 시에만 업데이트)
  const [activeParams, setActiveParams] = useState<SrListParams>({});

  // 선택된 SR 관리
  const [selectedSrs, setSelectedSrs] = useState<number[]>([]);

  // 수정 팝업
  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedSrData, setSelectedSrData] = useState<ServiceRequest | null>(null);
  const [editForm, setEditForm] = useState<SrUpdateRequest>({
    title: '',
    businessRequirement: '',
    dueDate: undefined,
    priority: undefined,
  });
  const [editLoading, setEditLoading] = useState(false);

  // activeParams 또는 페이지 변경 시에만 조회 (검색 버튼 클릭 or 페이지 이동)
  useEffect(() => {
    const doFetch = async () => {
      setLoading(true);
      setError('');
      try {
        const params: SrListParams = {
          page,
          size: rowsPerPage,
          ...activeParams,
        };
        const response = await getSrs(params);
        setSrs(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        console.error('Failed to fetch SRs:', err);
        setError(err.message || 'SR 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams]);

  // 검색 버튼 클릭: 폼 값을 activeParams로 반영 후 첫 페이지로
  const handleSearch = () => {
    const params: SrListParams = {};
    if (searchForm.companyName) params.companyName = searchForm.companyName;
    if (searchForm.projectName) params.projectName = searchForm.projectName;
    if (searchForm.srType) params.srType = searchForm.srType as any;
    if (searchForm.status) params.status = searchForm.status as any;
    if (searchForm.priority) params.priority = searchForm.priority as any;

    setSelectedSrs([]);
    setPage(0);
    setActiveParams(params);
  };

  // 초기화 버튼 클릭
  const handleClearSearch = () => {
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedSrs([]);
    setPage(0);
    setActiveParams({});
  };

  // 수정 버튼 클릭: 선택된 SR 데이터로 편집 폼 초기화 후 다이얼로그 오픈
  const handleOpenEdit = () => {
    if (selectedSrs.length !== 1) return;
    const sr = srs.find((s) => s.id === selectedSrs[0]);
    if (!sr) return;
    setSelectedSrData(sr);
    setEditForm({
      title: sr.title,
      businessRequirement: sr.businessRequirement,
      dueDate: sr.dueDate,
      priority: sr.priority,
    });
    setOpenEditDialog(true);
  };

  // 수정 저장
  const handleEditSubmit = async () => {
    if (!selectedSrData) return;
    setEditLoading(true);
    try {
      await updateSr(selectedSrData.id, editForm);
      setOpenEditDialog(false);
      setSelectedSrs([]);
      // 수정 후 현재 페이지 재조회 (activeParams 객체 재생성으로 useEffect 트리거)
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to update SR:', err);
      setError(err.message || 'SR 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  // 삭제 버튼 클릭
  const handleDelete = async () => {
    if (selectedSrs.length === 0) return;
    if (!window.confirm(`${selectedSrs.length}개의 SR을 삭제하시겠습니까?`)) return;
    try {
      for (const srId of selectedSrs) {
        await deleteSr(srId);
      }
      alert(`${selectedSrs.length}개의 SR이 삭제되었습니다.`);
      setSelectedSrs([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to delete SRs:', err);
      setError(err.message || 'SR 삭제에 실패했습니다.');
    }
  };

  const getStatusColor = (status: string) => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error' | 'warning'> = {
      REQUESTED: 'primary',
      APPROVAL_REQUESTED: 'warning',
      APPROVED: 'primary',
      IN_PROGRESS: 'warning',
      COMPLETED: 'success',
      CANCELLED: 'error',
      REJECTED: 'error',
    };
    return colors[status] || 'default';
  };

  const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
      REQUESTED: '요청됨',
      APPROVAL_REQUESTED: '승인요청',
      APPROVED: '승인됨',
      IN_PROGRESS: '진행중',
      COMPLETED: '완료',
      CANCELLED: '취소됨',
      REJECTED: '반려됨',
    };
    return labels[status] || status;
  };

  const getPriorityColor = (priority: string) => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error' | 'warning'> = {
      LOW: 'default',
      MEDIUM: 'primary',
      HIGH: 'warning',
      URGENT: 'error',
    };
    return colors[priority] || 'default';
  };

  const getPriorityLabel = (priority: string) => {
    const labels: Record<string, string> = {
      LOW: '낮음',
      MEDIUM: '보통',
      HIGH: '높음',
      URGENT: '긴급',
    };
    return labels[priority] || priority;
  };

  const isAnySelected = selectedSrs.length > 0;
  const isExactlyOneSelected = selectedSrs.length === 1;

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
      {/* 상단 제목 + 버튼 영역 */}
      <Box sx={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        mb: 3,
        flexWrap: 'wrap',
        gap: 2,
        width: '100%',
      }}>
        <Typography variant={isMobile ? 'h5' : 'h4'}>SR 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => navigate('/srs/new')}
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
            onClick={handleDelete}
            disabled={!isAnySelected}
            size={isMobile ? 'small' : 'medium'}
          >
            삭제
          </Button>
        </Stack>
      </Box>

      {error && (
        <Alert severity="error" sx={{ mb: 2 }}>
          {error}
        </Alert>
      )}

      {/* 검색 영역: 회사명 → 프로젝트명 → 유형 → 상태 → 우선순위 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <TextField
              fullWidth
              label="회사명"
              value={searchForm.companyName}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, companyName: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 180 }, flexGrow: { md: 1.5 } }}>
            <TextField
              fullWidth
              label="프로젝트명"
              value={searchForm.projectName}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, projectName: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select
                value={searchForm.srType}
                label="유형"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, srType: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="DEVELOPMENT">개발</MenuItem>
                <MenuItem value="OPERATION">운영</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.status}
                label="상태"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, status: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="REQUESTED">요청됨</MenuItem>
                <MenuItem value="APPROVAL_REQUESTED">승인요청</MenuItem>
                <MenuItem value="APPROVED">승인됨</MenuItem>
                <MenuItem value="IN_PROGRESS">진행중</MenuItem>
                <MenuItem value="COMPLETED">완료</MenuItem>
                <MenuItem value="CANCELLED">취소됨</MenuItem>
                <MenuItem value="REJECTED">반려됨</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>우선순위</InputLabel>
              <Select
                value={searchForm.priority}
                label="우선순위"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, priority: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="LOW">낮음</MenuItem>
                <MenuItem value="MEDIUM">보통</MenuItem>
                <MenuItem value="HIGH">높음</MenuItem>
                <MenuItem value="URGENT">긴급</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ display: 'flex', gap: 1, flexShrink: 0 }}>
            <Button variant="contained" onClick={handleSearch} startIcon={<Search />} size="medium" sx={{ whiteSpace: 'nowrap' }}>검색</Button>
            <Button variant="outlined" onClick={handleClearSearch} startIcon={<Refresh />} size="medium" sx={{ whiteSpace: 'nowrap' }}>초기화</Button>
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
          ) : srs.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography>데이터가 없습니다.</Typography>
            </Paper>
          ) : (
            srs.map((sr) => (
              <Card
                key={sr.id}
                sx={{ cursor: 'pointer', width: '100%' }}
                onClick={() => navigate(`/srs/${sr.id}`)}
              >
                <CardContent>
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                    <Typography variant="h6" component="div" sx={{ flex: 1, mr: 1 }}>
                      {sr.title}
                    </Typography>
                    <Chip
                      label={getStatusLabel(sr.status)}
                      color={getStatusColor(sr.status)}
                      size="small"
                    />
                  </Box>
                  <Box sx={{ display: 'flex', gap: 1, mb: 1 }}>
                    <Chip
                      label={sr.srType === 'DEVELOPMENT' ? '개발' : '운영'}
                      size="small"
                      color={sr.srType === 'DEVELOPMENT' ? 'primary' : 'secondary'}
                    />
                    <Chip
                      label={getPriorityLabel(sr.priority)}
                      color={getPriorityColor(sr.priority)}
                      size="small"
                    />
                  </Box>
                  <Typography variant="body2" color="text.secondary" gutterBottom>
                    프로젝트: {sr.projectName}
                  </Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>
                    요청자: {sr.requesterName}
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    요청일: {sr.requestDate || new Date(sr.createdAt).toLocaleDateString()}
                  </Typography>
                </CardContent>
              </Card>
            ))
          )}
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 2 }}>
            <TablePagination
              component="div"
              count={totalElements}
              page={page}
              onPageChange={(_, newPage) => setPage(newPage)}
              rowsPerPage={rowsPerPage}
              onRowsPerPageChange={(e) => {
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
                {/* 체크박스 먼저, SR번호 다음 */}
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={selectedSrs.length > 0 && selectedSrs.length < srs.length}
                    checked={srs.length > 0 && selectedSrs.length === srs.length}
                    onChange={(e) => {
                      if (e.target.checked) {
                        setSelectedSrs(srs.map((sr) => sr.id));
                      } else {
                        setSelectedSrs([]);
                      }
                    }}
                  />
                </TableCell>
                <TableCell align="center">SR번호</TableCell>
                <TableCell align="center">제목</TableCell>
                <TableCell align="center">유형</TableCell>
                <TableCell align="center">프로젝트</TableCell>
                <TableCell align="center">요청자</TableCell>
                <TableCell align="center">상태</TableCell>
                <TableCell align="center">우선순위</TableCell>
                <TableCell align="center">요청일</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {loading ? (
                <TableRow>
                  <TableCell colSpan={9} align="center">
                    <CircularProgress size={24} />
                    <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
                  </TableCell>
                </TableRow>
              ) : srs.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={9} align="center">
                    <Typography>데이터가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                srs.map((sr) => (
                  <TableRow
                    key={sr.id}
                    hover
                    selected={selectedSrs.includes(sr.id)}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/srs/${sr.id}`)}
                  >
                    {/* 체크박스 먼저, SR번호 다음 */}
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedSrs.includes(sr.id)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedSrs((prev) => [...prev, sr.id]);
                          } else {
                            setSelectedSrs((prev) => prev.filter((id) => id !== sr.id));
                          }
                        }}
                        onClick={(e) => e.stopPropagation()}
                      />
                    </TableCell>
                    <TableCell align="center">{sr.srNumber}</TableCell>
                    <TableCell align="center">{sr.title}</TableCell>
                    <TableCell align="center">
                      <Chip
                        label={sr.srType === 'DEVELOPMENT' ? '개발' : '운영'}
                        size="small"
                        color={sr.srType === 'DEVELOPMENT' ? 'primary' : 'secondary'}
                      />
                    </TableCell>
                    <TableCell align="center">{sr.projectName}</TableCell>
                    <TableCell align="center">{sr.requesterName}</TableCell>
                    <TableCell align="center">
                      <Chip
                        label={getStatusLabel(sr.status)}
                        color={getStatusColor(sr.status)}
                        size="small"
                      />
                    </TableCell>
                    <TableCell align="center">
                      <Chip
                        label={getPriorityLabel(sr.priority)}
                        color={getPriorityColor(sr.priority)}
                        size="small"
                      />
                    </TableCell>
                    <TableCell align="center">
                      {sr.requestDate || new Date(sr.createdAt).toLocaleDateString()}
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
            onPageChange={(_, newPage) => setPage(newPage)}
            rowsPerPage={rowsPerPage}
            onRowsPerPageChange={(e) => {
              setRowsPerPage(parseInt(e.target.value, 10));
              setPage(0);
            }}
            labelRowsPerPage="페이지당 행 수:"
          />
        </TableContainer>
      )}

      {/* SR 수정 팝업 (편집 폼) */}
      <Dialog
        open={openEditDialog}
        onClose={() => setOpenEditDialog(false)}
        maxWidth="md"
        fullWidth
      >
        <DialogTitle>SR 수정</DialogTitle>
        <DialogContent>
          {selectedSrData && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              {/* 읽기 전용 정보 */}
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 1 }}>
                <Box>
                  <Typography variant="caption" color="text.secondary">SR 번호</Typography>
                  <Typography variant="body2" fontWeight="bold">{selectedSrData.srNumber}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">프로젝트</Typography>
                  <Typography variant="body2">{selectedSrData.projectName}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">요청자</Typography>
                  <Typography variant="body2">{selectedSrData.requesterName}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">유형</Typography>
                  <Typography variant="body2">
                    {selectedSrData.srType === 'DEVELOPMENT' ? '개발' : '운영'}
                  </Typography>
                </Box>
              </Box>

              {/* 편집 가능 필드 */}
              <TextField
                fullWidth
                label="제목"
                value={editForm.title}
                onChange={(e) => setEditForm((prev) => ({ ...prev, title: e.target.value }))}
                size="small"
                required
              />
              <TextField
                fullWidth
                label="비즈니스 요구사항"
                value={editForm.businessRequirement}
                onChange={(e) =>
                  setEditForm((prev) => ({ ...prev, businessRequirement: e.target.value }))
                }
                multiline
                rows={4}
                size="small"
                required
              />
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 2 }}>
                <FormControl fullWidth size="small">
                  <InputLabel>우선순위</InputLabel>
                  <Select
                    value={editForm.priority || ''}
                    label="우선순위"
                    onChange={(e) =>
                      setEditForm((prev) => ({ ...prev, priority: e.target.value as any }))
                    }
                  >
                    <MenuItem value="LOW">낮음</MenuItem>
                    <MenuItem value="MEDIUM">보통</MenuItem>
                    <MenuItem value="HIGH">높음</MenuItem>
                    <MenuItem value="URGENT">긴급</MenuItem>
                  </Select>
                </FormControl>
                <TextField
                  fullWidth
                  label="마감일"
                  type="date"
                  value={editForm.dueDate || ''}
                  onChange={(e) =>
                    setEditForm((prev) => ({ ...prev, dueDate: e.target.value || undefined }))
                  }
                  size="small"
                  InputLabelProps={{ shrink: true }}
                />
              </Box>
            </Box>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setOpenEditDialog(false)} disabled={editLoading}>
            취소
          </Button>
          <Button
            variant="contained"
            onClick={handleEditSubmit}
            disabled={editLoading || !editForm.title || !editForm.businessRequirement}
          >
            {editLoading ? <CircularProgress size={20} /> : '저장'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default SRListPage;
