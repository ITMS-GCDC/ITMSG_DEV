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
  Autocomplete,
} from '@mui/material';
import { Add, Search, Refresh, Edit, Delete, Block, CheckCircle } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { getPartners, updatePartner, deletePartner, closePartner, reopenPartner } from '../../api/partner';
import apiClient from '../../utils/api';
import type { Partner, PartnerListParams, PartnerUpdateRequest } from '../../types/partner.types';

interface User {
  id: number;
  name: string;
  email: string;
}

interface PartnerSearchForm {
  name: string;
  ceoName: string;
  isClosed: string;
}

const EMPTY_SEARCH_FORM: PartnerSearchForm = {
  name: '',
  ceoName: '',
  isClosed: '',
};

const PartnerListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [partners, setPartners] = useState<Partner[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const [searchForm, setSearchForm] = useState<PartnerSearchForm>(EMPTY_SEARCH_FORM);
  const [activeParams, setActiveParams] = useState<PartnerListParams>({});
  const [hasSearched, setHasSearched] = useState(false);

  const [selectedPartners, setSelectedPartners] = useState<number[]>([]);

  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedPartnerData, setSelectedPartnerData] = useState<Partner | null>(null);
  const [editForm, setEditForm] = useState<PartnerUpdateRequest>({
    name: '',
    businessNumber: '',
    ceoName: '',
    managerId: undefined,
  });
  const [editLoading, setEditLoading] = useState(false);
  const [closeLoading, setCloseLoading] = useState(false);
  const [users, setUsers] = useState<User[]>([]);
  const [selectedManager, setSelectedManager] = useState<User | null>(null);

  useEffect(() => {
    apiClient.get('/projects/pm-candidates')
      .then((res) => setUsers(res.data?.content || []))
      .catch((err) => console.error('Failed to load users:', err));
  }, []);

  useEffect(() => {
    if (!hasSearched) return;
    const doFetch = async () => {
      setLoading(true);
      setError('');
      try {
        const params: PartnerListParams = {
          page,
          size: rowsPerPage,
          ...activeParams,
        };
        const response = await getPartners(params);
        setPartners(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        console.error('Failed to fetch partners:', err);
        setError(err.message || '파트너 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams, hasSearched]);

  const handleSearch = () => {
    const params: PartnerListParams = {};
    if (searchForm.name) params.name = searchForm.name;
    if (searchForm.ceoName) params.ceoName = searchForm.ceoName;
    if (searchForm.isClosed !== '') params.isClosed = searchForm.isClosed === 'true';

    setHasSearched(true);
    setSelectedPartners([]);
    setPage(0);
    setActiveParams(params);
  };

  const handleClearSearch = () => {
    setHasSearched(false);
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedPartners([]);
    setPage(0);
    setActiveParams({});
    setPartners([]);
    setTotalElements(0);
  };

  const handleOpenEdit = () => {
    if (selectedPartners.length !== 1) return;
    const partner = partners.find((p) => p.id === selectedPartners[0]);
    if (!partner) return;
    setSelectedPartnerData(partner);
    setEditForm({
      name: partner.name,
      businessNumber: partner.businessNumber,
      ceoName: partner.ceoName || '',
      managerId: partner.managerId,
    });
    const manager = users.find((u) => u.id === partner.managerId) || null;
    setSelectedManager(manager);
    setOpenEditDialog(true);
  };

  const handleEditSubmit = async () => {
    if (!selectedPartnerData) return;
    setEditLoading(true);
    try {
      const cleanedData: PartnerUpdateRequest = {
        ...editForm,
        ceoName: editForm.ceoName || undefined,
        managerId: selectedManager?.id || undefined,
      };
      await updatePartner(selectedPartnerData.id, cleanedData);
      setOpenEditDialog(false);
      setSelectedPartners([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to update partner:', err);
      setError(err.message || '파트너 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  const handleClosePartner = async () => {
    if (!selectedPartnerData) return;
    if (!window.confirm('이 파트너를 폐업 처리하시겠습니까?')) return;
    setCloseLoading(true);
    try {
      const updated = await closePartner(selectedPartnerData.id);
      setSelectedPartnerData(updated);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      setError(err.message || '폐업 처리에 실패했습니다.');
    } finally {
      setCloseLoading(false);
    }
  };

  const handleReopenPartner = async () => {
    if (!selectedPartnerData) return;
    if (!window.confirm('이 파트너를 재개업 처리하시겠습니까?')) return;
    setCloseLoading(true);
    try {
      const updated = await reopenPartner(selectedPartnerData.id);
      setSelectedPartnerData(updated);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      setError(err.message || '재개업 처리에 실패했습니다.');
    } finally {
      setCloseLoading(false);
    }
  };

  const handleDelete = async () => {
    if (selectedPartners.length === 0) return;
    if (!window.confirm(`${selectedPartners.length}개의 파트너를 삭제하시겠습니까?`)) return;
    try {
      for (const partnerId of selectedPartners) {
        await deletePartner(partnerId);
      }
      alert(`${selectedPartners.length}개의 파트너가 삭제되었습니다.`);
      setSelectedPartners([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to delete partners:', err);
      setError(err.message || '파트너 삭제에 실패했습니다.');
    }
  };

  const isAnySelected = selectedPartners.length > 0;
  const isExactlyOneSelected = selectedPartners.length === 1;

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
        <Typography variant={isMobile ? 'h5' : 'h4'}>파트너 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => navigate('/partners/new')}
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

      {/* 검색 영역: 파트너명 → 대표자명 → 상태 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 180 }, flexGrow: { md: 2 } }}>
            <TextField
              fullWidth
              label="파트너명"
              value={searchForm.name}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, name: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 180 }, flexGrow: { md: 2 } }}>
            <TextField
              fullWidth
              label="대표자명"
              value={searchForm.ceoName}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, ceoName: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.isClosed}
                label="상태"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, isClosed: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="false">운영중</MenuItem>
                <MenuItem value="true">폐업</MenuItem>
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
          ) : !hasSearched ? (
            <Paper sx={{ p: 4, textAlign: 'center' }}>
              <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
            </Paper>
          ) : partners.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
            </Paper>
          ) : (
            partners.map((partner) => (
              <Card key={partner.id} sx={{ cursor: 'pointer', width: '100%' }} onClick={() => navigate(`/partners/${partner.id}`)}>
                <CardContent>
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                    <Typography variant="h6" component="div" sx={{ flex: 1, mr: 1 }}>{partner.name}</Typography>
                    <Chip label={partner.isClosed ? '폐업' : '운영중'} color={partner.isClosed ? 'error' : 'success'} size="small" />
                  </Box>
                  <Typography variant="body2" color="text.secondary" gutterBottom>코드: {partner.code}</Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>사업자번호: {partner.businessNumber}</Typography>
                  <Typography variant="body2" color="text.secondary">대표: {partner.ceoName || '-'}</Typography>
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
              onRowsPerPageChange={(e) => { setRowsPerPage(parseInt(e.target.value, 10)); setPage(0); }}
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
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={selectedPartners.length > 0 && selectedPartners.length < partners.length}
                    checked={partners.length > 0 && selectedPartners.length === partners.length}
                    onChange={(e) => {
                      if (e.target.checked) {
                        setSelectedPartners(partners.map((p) => p.id));
                      } else {
                        setSelectedPartners([]);
                      }
                    }}
                  />
                </TableCell>
                <TableCell>코드</TableCell>
                <TableCell>파트너명</TableCell>
                <TableCell>사업자번호</TableCell>
                <TableCell>대표자명</TableCell>
                <TableCell>내부 담당자</TableCell>
                <TableCell>상태</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {loading ? (
                <TableRow>
                  <TableCell colSpan={7} align="center">
                    <CircularProgress size={24} />
                    <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
                  </TableCell>
                </TableRow>
              ) : !hasSearched ? (
                <TableRow>
                  <TableCell colSpan={7} align="center">
                    <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
                  </TableCell>
                </TableRow>
              ) : partners.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={7} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                partners.map((partner) => (
                  <TableRow
                    key={partner.id}
                    hover
                    selected={selectedPartners.includes(partner.id)}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/partners/${partner.id}`)}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedPartners.includes(partner.id)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedPartners((prev) => [...prev, partner.id]);
                          } else {
                            setSelectedPartners((prev) => prev.filter((id) => id !== partner.id));
                          }
                        }}
                        onClick={(e) => e.stopPropagation()}
                      />
                    </TableCell>
                    <TableCell>{partner.code}</TableCell>
                    <TableCell>{partner.name}</TableCell>
                    <TableCell>{partner.businessNumber}</TableCell>
                    <TableCell>{partner.ceoName || '-'}</TableCell>
                    <TableCell>{partner.managerName || '-'}</TableCell>
                    <TableCell>
                      <Chip label={partner.isClosed ? '폐업' : '운영중'} color={partner.isClosed ? 'error' : 'success'} size="small" />
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
            onRowsPerPageChange={(e) => { setRowsPerPage(parseInt(e.target.value, 10)); setPage(0); }}
            labelRowsPerPage="페이지당 행 수:"
          />
        </TableContainer>
      )}

      {/* 파트너 수정 팝업 */}
      <Dialog
        open={openEditDialog}
        onClose={() => setOpenEditDialog(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>파트너 수정</DialogTitle>
        <DialogContent>
          {selectedPartnerData && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              <Box sx={{ display: 'flex', gap: 1, flexWrap: 'wrap', alignItems: 'center' }}>
                <Chip label={`코드: ${selectedPartnerData.code}`} size="small" />
                <Chip
                  label={selectedPartnerData.isClosed ? '폐업' : '운영중'}
                  color={selectedPartnerData.isClosed ? 'error' : 'success'}
                  size="small"
                />
              </Box>
              <TextField
                fullWidth
                label="파트너명"
                value={editForm.name}
                onChange={(e) => setEditForm((prev) => ({ ...prev, name: e.target.value }))}
                size="small"
                required
              />
              <TextField
                fullWidth
                label="사업자등록번호"
                value={editForm.businessNumber}
                onChange={(e) => setEditForm((prev) => ({ ...prev, businessNumber: e.target.value }))}
                size="small"
                required
                helperText="10-12자리 숫자"
              />
              <TextField
                fullWidth
                label="대표자명"
                value={editForm.ceoName || ''}
                onChange={(e) => setEditForm((prev) => ({ ...prev, ceoName: e.target.value }))}
                size="small"
                helperText="선택사항"
              />
              <Autocomplete
                options={users}
                getOptionLabel={(option) => `${option.name} (${option.email})`}
                value={selectedManager}
                onChange={(_, newValue) => {
                  setSelectedManager(newValue);
                  setEditForm((prev) => ({ ...prev, managerId: newValue?.id || undefined }));
                }}
                renderInput={(params) => (
                  <TextField {...params} label="내부 담당자" size="small" helperText="선택사항" />
                )}
                isOptionEqualToValue={(option, value) => option.id === value.id}
              />
            </Box>
          )}
        </DialogContent>
        <DialogActions sx={{ justifyContent: 'space-between' }}>
          <Box>
            {selectedPartnerData && (
              selectedPartnerData.isClosed ? (
                <Button
                  variant="outlined"
                  color="success"
                  startIcon={<CheckCircle />}
                  onClick={handleReopenPartner}
                  disabled={closeLoading || editLoading}
                >
                  {closeLoading ? <CircularProgress size={20} /> : '재개업'}
                </Button>
              ) : (
                <Button
                  variant="outlined"
                  color="warning"
                  startIcon={<Block />}
                  onClick={handleClosePartner}
                  disabled={closeLoading || editLoading}
                >
                  {closeLoading ? <CircularProgress size={20} /> : '폐업처리'}
                </Button>
              )
            )}
          </Box>
          <Box sx={{ display: 'flex', gap: 1 }}>
            <Button onClick={() => setOpenEditDialog(false)} disabled={editLoading || closeLoading}>
              취소
            </Button>
            <Button
              variant="contained"
              onClick={handleEditSubmit}
              disabled={editLoading || closeLoading || !editForm.name || !editForm.businessNumber}
            >
              {editLoading ? <CircularProgress size={20} /> : '저장'}
            </Button>
          </Box>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default PartnerListPage;
