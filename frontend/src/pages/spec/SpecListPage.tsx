import React, { useEffect, useState } from 'react';
import {
  Box, Typography, Button, Paper, Table, TableBody, TableCell, TableContainer,
  TableHead, TableRow, TablePagination, Chip, CircularProgress, Alert,
  Card, CardContent, useMediaQuery, useTheme,
  TextField, Select, MenuItem, FormControl, InputLabel,
  Grid, Checkbox, Dialog, DialogTitle, DialogContent, DialogActions, Stack,
} from '@mui/material';
import { Add, Search, Refresh, Edit, Delete } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { getSpecs, updateSpec } from '../../api/spec';
import { getCompanies } from '../../api/project';
import type { Specification, SpecListParams, SpecUpdateRequest } from '../../types/spec.types';
import type { Company } from '../../types/project.types';

interface SpecSearchForm {
  companyId: string;
  projectName: string;
  srNumber: string;
  specType: string;
  specCategory: string;
  status: string;
}

const EMPTY_SEARCH_FORM: SpecSearchForm = {
  companyId: '',
  projectName: '',
  srNumber: '',
  specType: '',
  specCategory: '',
  status: '',
};

const SpecListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [specs, setSpecs] = useState<Specification[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const [companies, setCompanies] = useState<Company[]>([]);

  // 검색 폼 입력 상태 (회사, 프로젝트명, SR ID, 유형, 분류, 상태)
  const [searchForm, setSearchForm] = useState<SpecSearchForm>(EMPTY_SEARCH_FORM);

  // 실제 API 호출에 사용되는 검색 파라미터 (검색 버튼 클릭 시에만 업데이트)
  const [activeParams, setActiveParams] = useState<SpecListParams>({});

  // 검색 버튼을 눌렀는지 여부 (자동조회 방지)
  const [hasSearched, setHasSearched] = useState(false);

  // 선택된 SPEC 관리
  const [selectedSpecs, setSelectedSpecs] = useState<number[]>([]);

  // 수정 팝업
  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedSpecData, setSelectedSpecData] = useState<Specification | null>(null);
  const [editForm, setEditForm] = useState<Partial<SpecUpdateRequest>>({});
  const [editLoading, setEditLoading] = useState(false);

  useEffect(() => {
    getCompanies()
      .then(setCompanies)
      .catch((err) => console.error('Failed to load companies:', err));
  }, []);

  // activeParams 또는 페이지 변경 시에만 조회 (검색 버튼 클릭 or 페이지 이동)
  useEffect(() => {
    if (!hasSearched) return;
    const doFetch = async () => {
      setLoading(true);
      setError('');
      try {
        const params: SpecListParams = { page, size: rowsPerPage, ...activeParams };
        const response = await getSpecs(params);
        setSpecs(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        console.error('Failed to fetch specs:', err);
        setError(err.message || 'SPEC 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams, hasSearched]);

  // 검색 버튼 클릭: 폼 값을 activeParams로 반영 후 첫 페이지로
  const handleSearch = () => {
    const params: SpecListParams = {};
    if (searchForm.companyId) params.companyId = Number(searchForm.companyId);
    if (searchForm.projectName) params.projectName = searchForm.projectName;
    if (searchForm.srNumber) params.srNumber = searchForm.srNumber;
    if (searchForm.specType) params.specType = searchForm.specType;
    if (searchForm.specCategory) params.specCategory = searchForm.specCategory;
    if (searchForm.status) params.status = searchForm.status;

    setHasSearched(true);
    setSelectedSpecs([]);
    setPage(0);
    setActiveParams(params);
  };

  // 초기화 버튼 클릭
  const handleClearSearch = () => {
    setHasSearched(false);
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedSpecs([]);
    setPage(0);
    setActiveParams({});
    setSpecs([]);
    setTotalElements(0);
  };

  // 수정 버튼 클릭: 선택된 SPEC 데이터로 편집 폼 초기화 후 다이얼로그 오픈
  const handleOpenEdit = () => {
    if (selectedSpecs.length !== 1) return;
    const spec = specs.find((s) => s.id === selectedSpecs[0]);
    if (!spec) return;
    setSelectedSpecData(spec);
    setEditForm({
      srId: spec.srId,
      specType: spec.specType,
      specCategory: spec.specCategory,
      functionPoint: spec.functionPoint,
      manDay: spec.manDay,
    });
    setOpenEditDialog(true);
  };

  // 수정 저장
  const handleEditSubmit = async () => {
    if (!selectedSpecData) return;
    setEditLoading(true);
    try {
      await updateSpec(selectedSpecData.id, editForm as SpecUpdateRequest);
      setOpenEditDialog(false);
      setSelectedSpecs([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to update spec:', err);
      setError(err.message || 'SPEC 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  // 삭제 버튼 클릭
  const handleDelete = async () => {
    if (selectedSpecs.length === 0) return;
    if (!window.confirm(`${selectedSpecs.length}개의 SPEC을 삭제하시겠습니까?`)) return;
    try {
      const { deleteSpec } = await import('../../api/spec');
      for (const specId of selectedSpecs) {
        await deleteSpec(specId);
      }
      alert(`${selectedSpecs.length}개의 SPEC이 삭제되었습니다.`);
      setSelectedSpecs([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to delete specs:', err);
      setError(err.message || 'SPEC 삭제에 실패했습니다.');
    }
  };

  const getStatusColor = (status: string): 'default' | 'primary' | 'success' | 'error' | 'warning' => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error' | 'warning'> = {
      PENDING: 'default',
      IN_PROGRESS: 'warning',
      APPROVAL_PENDING: 'primary',
      APPROVED: 'success',
      REJECTED: 'error',
      COMPLETED: 'success',
    };
    return colors[status] || 'default';
  };

  const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
      PENDING: '대기',
      IN_PROGRESS: '진행중',
      APPROVAL_PENDING: '승인대기',
      APPROVED: '승인',
      REJECTED: '반려',
      COMPLETED: '완료',
    };
    return labels[status] || status;
  };

  const isAnySelected = selectedSpecs.length > 0;
  const isExactlyOneSelected = selectedSpecs.length === 1;

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
      {/* 상단 제목 + 버튼 영역 */}
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 3, flexWrap: 'wrap', gap: 2, width: '100%' }}>
        <Typography variant={isMobile ? 'h5' : 'h4'}>SPEC 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => navigate('/specs/new')}
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

      {error && <Alert severity="error" sx={{ mb: 2 }}>{error}</Alert>}

      {/* 검색 영역: 회사 → 프로젝트명 → SR ID → 유형 → 분류 → 상태 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>회사</InputLabel>
              <Select
                value={searchForm.companyId}
                label="회사"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, companyId: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                {companies.map((c) => (
                  <MenuItem key={c.id} value={String(c.id)}>{c.name}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1.5 } }}>
            <TextField
              fullWidth
              label="프로젝트명"
              value={searchForm.projectName}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, projectName: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <TextField
              fullWidth
              label="SR ID"
              value={searchForm.srNumber}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, srNumber: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select
                value={searchForm.specType}
                label="유형"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, specType: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="DEVELOPMENT">개발</MenuItem>
                <MenuItem value="OPERATION">운영</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>분류</InputLabel>
              <Select
                value={searchForm.specCategory}
                label="분류"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, specCategory: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="ACCEPTED">접수</MenuItem>
                <MenuItem value="CANCELLED">취소</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.status}
                label="상태"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, status: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="PENDING">대기</MenuItem>
                <MenuItem value="IN_PROGRESS">진행중</MenuItem>
                <MenuItem value="APPROVAL_PENDING">승인대기</MenuItem>
                <MenuItem value="APPROVED">승인</MenuItem>
                <MenuItem value="REJECTED">반려</MenuItem>
                <MenuItem value="COMPLETED">완료</MenuItem>
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
            <Paper sx={{ p: 3, textAlign: 'center' }}><CircularProgress size={24} /><Typography sx={{ mt: 1 }}>로딩 중...</Typography></Paper>
          ) : !hasSearched ? (
            <Paper sx={{ p: 4, textAlign: 'center' }}>
              <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
            </Paper>
          ) : specs.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}><Typography color="text.secondary">검색 결과가 없습니다.</Typography></Paper>
          ) : (
            specs.map((spec) => (
              <Card
                key={spec.id}
                sx={{ cursor: 'pointer', width: '100%', border: selectedSpecs.includes(spec.id) ? 2 : undefined, borderColor: 'primary.main' }}
                onClick={() => navigate(`/specs/${spec.id}`)}
              >
                <CardContent>
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                    <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                      <Checkbox
                        checked={selectedSpecs.includes(spec.id)}
                        onChange={(e) => {
                          if (e.target.checked) setSelectedSpecs((prev) => [...prev, spec.id]);
                          else setSelectedSpecs((prev) => prev.filter((id) => id !== spec.id));
                        }}
                        onClick={(e) => e.stopPropagation()}
                        size="small"
                      />
                      <Typography variant="h6" component="div">{spec.specNumber}</Typography>
                    </Box>
                    <Chip label={getStatusLabel(spec.status)} color={getStatusColor(spec.status)} size="small" />
                  </Box>
                  <Typography variant="body2" color="text.secondary" gutterBottom>회사: {spec.companyName || '-'}</Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>프로젝트: {spec.projectName || '-'}</Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>유형: {spec.specType === 'DEVELOPMENT' ? '개발' : '운영'}</Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>SR: {spec.srNumber || '-'}</Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>FP: {spec.functionPoint || '-'} / M/D: {spec.manDay || '-'}</Typography>
                  <Typography variant="body2" color="text.secondary">작성일: {new Date(spec.createdAt).toLocaleDateString()}</Typography>
                </CardContent>
              </Card>
            ))
          )}
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 2 }}>
            <TablePagination component="div" count={totalElements} page={page} onPageChange={(_, newPage) => setPage(newPage)} rowsPerPage={rowsPerPage} onRowsPerPageChange={(e) => { setRowsPerPage(parseInt(e.target.value, 10)); setPage(0); }} labelRowsPerPage="페이지당:" />
          </Box>
        </Box>
      ) : (
        /* 데스크탑: 테이블 뷰 */
        <TableContainer component={Paper} sx={{ width: '100%' }}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={selectedSpecs.length > 0 && selectedSpecs.length < specs.length}
                    checked={specs.length > 0 && selectedSpecs.length === specs.length}
                    onChange={(e) => {
                      if (e.target.checked) setSelectedSpecs(specs.map((s) => s.id));
                      else setSelectedSpecs([]);
                    }}
                  />
                </TableCell>
                <TableCell align="center">SPEC 번호</TableCell>
                <TableCell align="center">회사</TableCell>
                <TableCell align="center">프로젝트</TableCell>
                <TableCell align="center">SR</TableCell>
                <TableCell align="center">유형</TableCell>
                <TableCell align="center">분류</TableCell>
                <TableCell align="center">FP</TableCell>
                <TableCell align="center">M/D</TableCell>
                <TableCell align="center">상태</TableCell>
                <TableCell align="center">작성일</TableCell>
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
              ) : specs.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={11} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                specs.map((spec) => (
                  <TableRow
                    key={spec.id}
                    hover
                    selected={selectedSpecs.includes(spec.id)}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/specs/${spec.id}`)}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedSpecs.includes(spec.id)}
                        onChange={(e) => {
                          if (e.target.checked) setSelectedSpecs((prev) => [...prev, spec.id]);
                          else setSelectedSpecs((prev) => prev.filter((id) => id !== spec.id));
                        }}
                        onClick={(e) => e.stopPropagation()}
                      />
                    </TableCell>
                    <TableCell align="center">{spec.specNumber}</TableCell>
                    <TableCell align="center">{spec.companyName || '-'}</TableCell>
                    <TableCell align="center">{spec.projectName || '-'}</TableCell>
                    <TableCell align="center">{spec.srNumber || '-'}</TableCell>
                    <TableCell align="center">
                      <Chip label={spec.specType === 'DEVELOPMENT' ? '개발' : '운영'} size="small" color={spec.specType === 'DEVELOPMENT' ? 'primary' : 'secondary'} />
                    </TableCell>
                    <TableCell align="center">{spec.specCategory === 'ACCEPTED' ? '접수' : '취소'}</TableCell>
                    <TableCell align="center">{spec.functionPoint ?? '-'}</TableCell>
                    <TableCell align="center">{spec.manDay ?? '-'}</TableCell>
                    <TableCell align="center">
                      <Chip label={getStatusLabel(spec.status)} color={getStatusColor(spec.status)} size="small" />
                    </TableCell>
                    <TableCell align="center">{new Date(spec.createdAt).toLocaleDateString()}</TableCell>
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
            onRowsPerPageChange={(e) => { setRowsPerPage(parseInt(e.target.value, 10)); setPage(0); }}
            labelRowsPerPage="페이지당 행 수:"
          />
        </TableContainer>
      )}

      {/* SPEC 수정 팝업 */}
      <Dialog open={openEditDialog} onClose={() => setOpenEditDialog(false)} maxWidth="md" fullWidth>
        <DialogTitle>SPEC 수정</DialogTitle>
        <DialogContent>
          {selectedSpecData && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              {/* 읽기 전용 정보 */}
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 1 }}>
                <Box>
                  <Typography variant="caption" color="text.secondary">SPEC 번호</Typography>
                  <Typography variant="body2" fontWeight="bold">{selectedSpecData.specNumber}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">SR 번호</Typography>
                  <Typography variant="body2">{selectedSpecData.srNumber || '-'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">회사</Typography>
                  <Typography variant="body2">{selectedSpecData.companyName || '-'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">프로젝트</Typography>
                  <Typography variant="body2">{selectedSpecData.projectName || '-'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">유형</Typography>
                  <Typography variant="body2">{selectedSpecData.specType === 'DEVELOPMENT' ? '개발' : '운영'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">분류</Typography>
                  <Typography variant="body2">{selectedSpecData.specCategory === 'ACCEPTED' ? '접수' : '취소'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">상태</Typography>
                  <Typography variant="body2">
                    <Chip label={getStatusLabel(selectedSpecData.status)} color={getStatusColor(selectedSpecData.status)} size="small" />
                  </Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">작성일</Typography>
                  <Typography variant="body2">{new Date(selectedSpecData.createdAt).toLocaleDateString()}</Typography>
                </Box>
              </Box>

              {/* 편집 가능 필드 */}
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 2 }}>
                <TextField
                  fullWidth
                  label="FP (Function Point)"
                  type="number"
                  value={editForm.functionPoint ?? ''}
                  onChange={(e) => setEditForm((prev) => ({ ...prev, functionPoint: e.target.value ? Number(e.target.value) : undefined }))}
                  size="small"
                  inputProps={{ min: 0, step: 0.01 }}
                />
                <TextField
                  fullWidth
                  label="M/D (Man Day)"
                  type="number"
                  value={editForm.manDay ?? ''}
                  onChange={(e) => setEditForm((prev) => ({ ...prev, manDay: e.target.value ? Number(e.target.value) : undefined }))}
                  size="small"
                  inputProps={{ min: 0, step: 0.01 }}
                />
              </Box>
            </Box>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setOpenEditDialog(false)} disabled={editLoading}>취소</Button>
          <Button variant="contained" onClick={handleEditSubmit} disabled={editLoading}>
            {editLoading ? <CircularProgress size={20} /> : '저장'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default SpecListPage;
