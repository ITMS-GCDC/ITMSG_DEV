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
  type SelectChangeEvent,
} from '@mui/material';
import { Add, Search, Refresh, Edit, Delete } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { getAssets, updateAsset, deleteAsset } from '../../api/asset';
import { getCompanies, getProjects } from '../../api/project';
import { getActiveUsersSimple } from '../../api/user';
import type { UserSimple } from '../../api/user';
import type { Asset, AssetType, AssetListParams, AssetUpdateRequest } from '../../types/asset.types';
import type { Company, Project } from '../../types/project.types';

interface AssetSearchForm {
  companyId: string;
  projectId: string;
  assetNumber: string;
  assetType: string;
  isExpired: string;
}

const EMPTY_SEARCH_FORM: AssetSearchForm = {
  companyId: '',
  projectId: '',
  assetNumber: '',
  assetType: '',
  isExpired: '',
};

const AssetListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [assets, setAssets] = useState<Asset[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const [companies, setCompanies] = useState<Company[]>([]);
  const [projects, setProjects] = useState<Project[]>([]);

  const [searchForm, setSearchForm] = useState<AssetSearchForm>(EMPTY_SEARCH_FORM);
  const [activeParams, setActiveParams] = useState<AssetListParams>({});
  const [hasSearched, setHasSearched] = useState(false);

  const [selectedAssets, setSelectedAssets] = useState<number[]>([]);

  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedAssetData, setSelectedAssetData] = useState<Asset | null>(null);
  const [editForm, setEditForm] = useState<AssetUpdateRequest>({
    assetType: 'PC',
    serialNumber: '',
  });
  const [editLoading, setEditLoading] = useState(false);
  const [editError, setEditError] = useState('');

  const [users, setUsers] = useState<UserSimple[]>([]);
  const [usersLoading, setUsersLoading] = useState(false);
  const [editSelectedUser, setEditSelectedUser] = useState<UserSimple | null>(null);
  const [editProjects, setEditProjects] = useState<Project[]>([]);

  useEffect(() => {
    getCompanies()
      .then(setCompanies)
      .catch((err) => console.error('Failed to load companies:', err));
    loadAllProjects();
  }, []);

  const loadAllProjects = async () => {
    try {
      const res = await getProjects({ page: 0, size: 1000 });
      setEditProjects(res.content);
    } catch (err) {
      console.error('Failed to load projects for edit:', err);
    }
  };

  const loadProjectsByCompany = async (companyId: number | null) => {
    try {
      const params = companyId
        ? { page: 0, size: 1000, companyId }
        : { page: 0, size: 1000 };
      const res = await getProjects(params);
      setProjects(res.content);
    } catch (err) {
      console.error('Failed to load projects:', err);
    }
  };

  useEffect(() => {
    if (!hasSearched) return;
    const doFetch = async () => {
      setLoading(true);
      setError('');
      try {
        const params: AssetListParams = {
          page,
          size: rowsPerPage,
          ...activeParams,
        };
        const response = await getAssets(params);
        setAssets(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        console.error('Failed to fetch assets:', err);
        setError(err.message || '자산 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams, hasSearched]);

  const handleSearch = () => {
    const params: AssetListParams = {};
    if (searchForm.companyId) params.companyId = Number(searchForm.companyId);
    if (searchForm.projectId) params.projectId = Number(searchForm.projectId);
    if (searchForm.assetNumber) params.assetNumber = searchForm.assetNumber;
    if (searchForm.assetType) params.assetType = searchForm.assetType as AssetType;
    if (searchForm.isExpired !== '') params.isExpired = searchForm.isExpired === 'true';

    setHasSearched(true);
    setSelectedAssets([]);
    setPage(0);
    setActiveParams(params);
  };

  const handleClearSearch = () => {
    setHasSearched(false);
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedAssets([]);
    setPage(0);
    setActiveParams({});
    setAssets([]);
    setTotalElements(0);
    setProjects([]);
  };

  const handleCompanyChange = (companyId: string) => {
    setSearchForm((prev) => ({ ...prev, companyId, projectId: '' }));
    if (companyId) {
      loadProjectsByCompany(Number(companyId));
    } else {
      setProjects([]);
    }
  };

  const handleOpenEdit = () => {
    if (selectedAssets.length !== 1) return;
    const asset = assets.find((a) => a.id === selectedAssets[0]);
    if (!asset) return;

    setSelectedAssetData(asset);
    setEditError('');
    setEditForm({
      assetType: asset.assetType,
      serialNumber: asset.serialNumber || '',
      managerId: asset.managerId,
      projectId: asset.projectId,
    });
    if (asset.managerId && asset.managerName) {
      setEditSelectedUser({ id: asset.managerId, name: asset.managerName, email: '' } as UserSimple);
    } else {
      setEditSelectedUser(null);
    }

    setUsersLoading(true);
    getActiveUsersSimple({ size: 1000 })
      .then((res) => setUsers(res.content))
      .catch((err) => console.error('Failed to load users:', err))
      .finally(() => setUsersLoading(false));

    setOpenEditDialog(true);
  };

  const handleEditSubmit = async () => {
    if (!selectedAssetData) return;
    setEditLoading(true);
    setEditError('');
    try {
      await updateAsset(selectedAssetData.id, editForm);
      setOpenEditDialog(false);
      setSelectedAssets([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to update asset:', err);
      setEditError(err.response?.data?.message || '자산 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  const handleDelete = async () => {
    if (selectedAssets.length === 0) return;
    if (!window.confirm(`${selectedAssets.length}개의 자산을 삭제하시겠습니까?`)) return;
    try {
      for (const assetId of selectedAssets) {
        await deleteAsset(assetId);
      }
      alert(`${selectedAssets.length}개의 자산이 삭제되었습니다.`);
      setSelectedAssets([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to delete assets:', err);
      setError(err.response?.data?.message || '자산 삭제에 실패했습니다.');
    }
  };

  const getTypeLabel = (type: AssetType) => {
    const labels: Record<AssetType, string> = {
      PC: '데스크톱',
      LAPTOP: '노트북',
      MONITOR: '모니터',
      SERVER: '서버',
      NETWORK: '네트워크',
      PRINTER: '프린터',
      OTHER: '기타',
    };
    return labels[type] || type;
  };

  const isAnySelected = selectedAssets.length > 0;
  const isExactlyOneSelected = selectedAssets.length === 1;

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
        <Typography variant={isMobile ? 'h5' : 'h4'}>자산 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => navigate('/assets/new')}
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

      {/* 검색 영역: 회사 → 프로젝트명 → 자산번호 → 유형 → 상태 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>회사</InputLabel>
              <Select
                value={searchForm.companyId}
                label="회사"
                onChange={(e: SelectChangeEvent<string>) => handleCompanyChange(e.target.value)}
              >
                <MenuItem value="">전체</MenuItem>
                {companies.map((c) => (
                  <MenuItem key={c.id} value={String(c.id)}>{c.name}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1.2 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>프로젝트명</InputLabel>
              <Select
                value={searchForm.projectId}
                label="프로젝트명"
                onChange={(e: SelectChangeEvent<string>) => setSearchForm((prev) => ({ ...prev, projectId: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                {projects.map((p) => (
                  <MenuItem key={p.id} value={String(p.id)}>{p.name}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <TextField
              fullWidth
              label="자산번호"
              value={searchForm.assetNumber}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, assetNumber: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 130 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select
                value={searchForm.assetType}
                label="유형"
                onChange={(e: SelectChangeEvent<string>) => setSearchForm((prev) => ({ ...prev, assetType: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="PC">데스크톱</MenuItem>
                <MenuItem value="LAPTOP">노트북</MenuItem>
                <MenuItem value="MONITOR">모니터</MenuItem>
                <MenuItem value="SERVER">서버</MenuItem>
                <MenuItem value="NETWORK">네트워크</MenuItem>
                <MenuItem value="PRINTER">프린터</MenuItem>
                <MenuItem value="OTHER">기타</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 120 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.isExpired}
                label="상태"
                onChange={(e: SelectChangeEvent<string>) => setSearchForm((prev) => ({ ...prev, isExpired: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="false">사용중</MenuItem>
                <MenuItem value="true">폐기</MenuItem>
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
          ) : assets.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
            </Paper>
          ) : (
            assets.map((asset) => (
              <Card
                key={asset.id}
                sx={{ cursor: 'pointer', width: '100%' }}
                onClick={() => navigate(`/assets/${asset.id}`)}
              >
                <CardContent>
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                    <Typography variant="h6" component="div" sx={{ flex: 1, mr: 1 }}>{asset.assetNumber}</Typography>
                    <Chip label={asset.isExpired ? '폐기' : '사용중'} color={asset.isExpired ? 'default' : 'success'} size="small" />
                  </Box>
                  {asset.companyName && (
                    <Typography variant="body2" color="text.secondary" gutterBottom>회사: {asset.companyName}</Typography>
                  )}
                  {asset.projectName && (
                    <Typography variant="body2" color="text.secondary" gutterBottom>프로젝트: {asset.projectName}</Typography>
                  )}
                  <Typography variant="body2" color="text.secondary" gutterBottom>유형: {getTypeLabel(asset.assetType)}</Typography>
                  <Typography variant="body2" color="text.secondary">담당자: {asset.managerName || '-'}</Typography>
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
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={selectedAssets.length > 0 && selectedAssets.length < assets.length}
                    checked={assets.length > 0 && selectedAssets.length === assets.length}
                    onChange={(e) => {
                      if (e.target.checked) {
                        setSelectedAssets(assets.map((a) => a.id));
                      } else {
                        setSelectedAssets([]);
                      }
                    }}
                  />
                </TableCell>
                <TableCell align="center">자산번호</TableCell>
                <TableCell align="center">회사</TableCell>
                <TableCell align="center">프로젝트명</TableCell>
                <TableCell align="center">유형</TableCell>
                <TableCell align="center">시리얼번호</TableCell>
                <TableCell align="center">취득일</TableCell>
                <TableCell align="center">담당자</TableCell>
                <TableCell align="center">상태</TableCell>
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
              ) : !hasSearched ? (
                <TableRow>
                  <TableCell colSpan={9} align="center">
                    <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
                  </TableCell>
                </TableRow>
              ) : assets.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={9} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                assets.map((asset) => (
                  <TableRow
                    key={asset.id}
                    hover
                    selected={selectedAssets.includes(asset.id)}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/assets/${asset.id}`)}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedAssets.includes(asset.id)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedAssets((prev) => [...prev, asset.id]);
                          } else {
                            setSelectedAssets((prev) => prev.filter((id) => id !== asset.id));
                          }
                        }}
                        onClick={(e) => e.stopPropagation()}
                      />
                    </TableCell>
                    <TableCell align="center">{asset.assetNumber}</TableCell>
                    <TableCell align="center">{asset.companyName || '-'}</TableCell>
                    <TableCell align="center">{asset.projectName || '-'}</TableCell>
                    <TableCell align="center">
                      <Chip label={getTypeLabel(asset.assetType)} size="small" color="primary" variant="outlined" />
                    </TableCell>
                    <TableCell align="center">{asset.serialNumber || '-'}</TableCell>
                    <TableCell align="center">{asset.acquiredAt}</TableCell>
                    <TableCell align="center">{asset.managerName || '-'}</TableCell>
                    <TableCell align="center">
                      <Chip label={asset.isExpired ? '폐기' : '사용중'} color={asset.isExpired ? 'default' : 'success'} size="small" />
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

      {/* 자산 수정 팝업 */}
      <Dialog
        open={openEditDialog}
        onClose={() => setOpenEditDialog(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>자산 수정</DialogTitle>
        <DialogContent>
          {selectedAssetData && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              {editError && <Alert severity="error">{editError}</Alert>}

              {/* 읽기 전용 정보 */}
              <Box sx={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: 1, p: 1.5, bgcolor: 'grey.50', borderRadius: 1 }}>
                <Box>
                  <Typography variant="caption" color="text.secondary">자산번호</Typography>
                  <Typography variant="body2" fontWeight="bold">{selectedAssetData.assetNumber}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">취득일</Typography>
                  <Typography variant="body2">{selectedAssetData.acquiredAt}</Typography>
                </Box>
                {selectedAssetData.companyName && (
                  <Box>
                    <Typography variant="caption" color="text.secondary">회사</Typography>
                    <Typography variant="body2">{selectedAssetData.companyName}</Typography>
                  </Box>
                )}
              </Box>

              {/* 편집 가능 필드 */}
              <FormControl fullWidth size="small">
                <InputLabel>자산 유형</InputLabel>
                <Select
                  value={editForm.assetType}
                  label="자산 유형"
                  onChange={(e: SelectChangeEvent<string>) =>
                    setEditForm((prev) => ({ ...prev, assetType: e.target.value as AssetType }))
                  }
                >
                  <MenuItem value="PC">데스크톱</MenuItem>
                  <MenuItem value="LAPTOP">노트북</MenuItem>
                  <MenuItem value="MONITOR">모니터</MenuItem>
                  <MenuItem value="SERVER">서버</MenuItem>
                  <MenuItem value="NETWORK">네트워크 장비</MenuItem>
                  <MenuItem value="PRINTER">프린터</MenuItem>
                  <MenuItem value="OTHER">기타</MenuItem>
                </Select>
              </FormControl>

              <TextField
                fullWidth
                label="시리얼번호"
                value={editForm.serialNumber || ''}
                onChange={(e) => setEditForm((prev) => ({ ...prev, serialNumber: e.target.value }))}
                size="small"
              />

              <FormControl fullWidth size="small">
                <InputLabel>프로젝트</InputLabel>
                <Select
                  value={editForm.projectId ? String(editForm.projectId) : ''}
                  label="프로젝트"
                  onChange={(e: SelectChangeEvent<string>) =>
                    setEditForm((prev) => ({ ...prev, projectId: e.target.value ? Number(e.target.value) : undefined }))
                  }
                >
                  <MenuItem value="">없음</MenuItem>
                  {editProjects.map((p) => (
                    <MenuItem key={p.id} value={String(p.id)}>{p.name}</MenuItem>
                  ))}
                </Select>
              </FormControl>

              <Autocomplete
                options={users}
                value={users.find((u) => u.id === editForm.managerId) || editSelectedUser}
                getOptionLabel={(option) => option.email ? `${option.name} (${option.email})` : option.name}
                loading={usersLoading}
                onChange={(_, value) => {
                  setEditForm((prev) => ({ ...prev, managerId: value?.id }));
                  setEditSelectedUser(value);
                }}
                isOptionEqualToValue={(option, value) => option.id === value.id}
                renderInput={(params) => (
                  <TextField
                    {...params}
                    label="담당자"
                    fullWidth
                    size="small"
                    helperText="선택사항"
                    InputProps={{
                      ...params.InputProps,
                      endAdornment: (
                        <>
                          {usersLoading ? <CircularProgress color="inherit" size={20} /> : null}
                          {params.InputProps.endAdornment}
                        </>
                      ),
                    }}
                  />
                )}
              />
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
            disabled={editLoading}
          >
            {editLoading ? <CircularProgress size={20} /> : '저장'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default AssetListPage;
