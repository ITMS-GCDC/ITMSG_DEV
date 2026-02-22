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
  Card,
  CardContent,
  useMediaQuery,
  useTheme,
  Alert,
  TextField,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Grid,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  CircularProgress,
  Checkbox,
  Autocomplete,
} from '@mui/material';
import { Add, Edit, Delete, Search, Refresh, Save, Cancel } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useForm, Controller } from 'react-hook-form';
import {
  getProjects, getCompanies, getPmCandidates,
  deleteProject, getProject, updateProject,
} from '../../api/project';
import type { Project, Company, ProjectListParams, ProjectRequest } from '../../types/project.types';
import type { PmCandidate } from '../../api/project';

interface SearchForm {
  companyId: string;
  name: string;
  projectType: string;
  pmId: string;
}

interface EditFormData {
  code: string;
  name: string;
  description: string;
  projectType: string;
  startDate: string;
  endDate: string;
  budget: string;
}

const EMPTY_FORM: SearchForm = { companyId: '', name: '', projectType: '', pmId: '' };

const hasCondition = (s: SearchForm): boolean =>
  !!(s.companyId || s.name.trim() || s.projectType || s.pmId);

const ProjectListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [projects, setProjects] = useState<Project[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  // 체크박스로 선택된 프로젝트
  const [selectedProject, setSelectedProject] = useState<Project | null>(null);

  // 삭제 다이얼로그
  const [deleteDialogOpen, setDeleteDialogOpen] = useState(false);
  const [deleting, setDeleting] = useState(false);

  // 수정 팝업
  const [editDialogOpen, setEditDialogOpen] = useState(false);
  const [editLoading, setEditLoading] = useState(false);
  const [editSaving, setEditSaving] = useState(false);
  const [editError, setEditError] = useState('');
  const [editProject, setEditProject] = useState<Project | null>(null);
  const [editPmList, setEditPmList] = useState<PmCandidate[]>([]);
  const [editSelectedPm, setEditSelectedPm] = useState<PmCandidate | null>(null);

  const { control, handleSubmit, reset, formState: { errors } } = useForm<EditFormData>({
    defaultValues: { code: '', name: '', description: '', projectType: 'SI', startDate: '', endDate: '', budget: '' },
  });

  const [companies, setCompanies] = useState<Company[]>([]);
  const [pmCandidates, setPmCandidates] = useState<PmCandidate[]>([]);
  const [form, setForm] = useState<SearchForm>(EMPTY_FORM);
  const [appliedSearch, setAppliedSearch] = useState<SearchForm>(EMPTY_FORM);

  useEffect(() => {
    loadFilterData();
  }, []);

  useEffect(() => {
    if (!hasCondition(appliedSearch)) {
      setProjects([]);
      setTotalElements(0);
      setSelectedProject(null);
      return;
    }
    const params: ProjectListParams = { page, size: rowsPerPage };
    if (appliedSearch.companyId) params.companyId = Number(appliedSearch.companyId);
    if (appliedSearch.name.trim()) params.name = appliedSearch.name.trim();
    if (appliedSearch.projectType) params.projectType = appliedSearch.projectType as any;
    if (appliedSearch.pmId) params.pmId = Number(appliedSearch.pmId);
    doFetch(params);
  }, [page, rowsPerPage, appliedSearch]);

  const loadFilterData = async () => {
    try {
      const [companiesData, pmData] = await Promise.all([getCompanies(), getPmCandidates()]);
      setCompanies(companiesData);
      setPmCandidates(pmData.content);
    } catch (err) {
      console.error('Failed to load filter data:', err);
    }
  };

  const doFetch = async (params: ProjectListParams) => {
    setLoading(true);
    setError('');
    try {
      const response = await getProjects(params);
      setProjects(response.content);
      setTotalElements(response.totalElements);
      setSelectedProject(null);
    } catch (err: any) {
      setError(err.message || err.response?.data?.message || '프로젝트 목록을 불러오는데 실패했습니다.');
    } finally {
      setLoading(false);
    }
  };

  const refreshList = () => {
    if (!hasCondition(appliedSearch)) return;
    const params: ProjectListParams = { page, size: rowsPerPage };
    if (appliedSearch.companyId) params.companyId = Number(appliedSearch.companyId);
    if (appliedSearch.name.trim()) params.name = appliedSearch.name.trim();
    if (appliedSearch.projectType) params.projectType = appliedSearch.projectType as any;
    if (appliedSearch.pmId) params.pmId = Number(appliedSearch.pmId);
    doFetch(params);
  };

  const handleSearch = () => { setPage(0); setAppliedSearch({ ...form }); };
  const handleReset = () => { setForm(EMPTY_FORM); setPage(0); setAppliedSearch(EMPTY_FORM); };
  const handleKeyDown = (e: React.KeyboardEvent) => { if (e.key === 'Enter') handleSearch(); };

  // 체크박스 토글
  const handleCheckbox = (project: Project, e: React.ChangeEvent<HTMLInputElement>) => {
    e.stopPropagation();
    setSelectedProject((prev) => (prev?.id === project.id ? null : project));
  };

  // ── 수정 팝업 ──────────────────────────────────────────────
  const handleEditOpen = async () => {
    if (!selectedProject) return;
    setEditDialogOpen(true);
    setEditLoading(true);
    setEditError('');
    setEditSelectedPm(null);
    try {
      const [projectData, usersRes] = await Promise.all([
        getProject(selectedProject.id),
        getPmCandidates(),
      ]);
      setEditProject(projectData);
      setEditPmList(usersRes.content);
      reset({
        code: projectData.code,
        name: projectData.name,
        description: projectData.description || '',
        projectType: projectData.projectType,
        startDate: projectData.startDate,
        endDate: projectData.endDate || '',
        budget: projectData.budget?.toString() || '',
      });
      if (projectData.pmId) {
        const pm = usersRes.content.find((u) => u.id === projectData.pmId);
        if (pm) setEditSelectedPm(pm);
      }
    } catch (err: any) {
      setEditError(err.message || '프로젝트 정보를 불러오는데 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  const handleEditClose = () => {
    if (editSaving) return;
    setEditDialogOpen(false);
    setEditProject(null);
    setEditError('');
  };

  const handleEditSubmit = async (data: EditFormData) => {
    if (!editProject) return;
    setEditSaving(true);
    setEditError('');
    try {
      const requestData: ProjectRequest = {
        code: data.code,
        name: data.name,
        projectType: data.projectType as 'SI' | 'SM',
        startDate: data.startDate,
        endDate: data.endDate || undefined,
        companyId: editProject.companyId,
        description: data.description || undefined,
        budget: data.budget ? parseInt(data.budget) : undefined,
        pmId: editSelectedPm?.id || undefined,
      };
      await updateProject(editProject.id, requestData);
      setEditDialogOpen(false);
      setSelectedProject(null);
      refreshList();
    } catch (err: any) {
      setEditError(err.message || err.response?.data?.message || '프로젝트 수정에 실패했습니다.');
    } finally {
      setEditSaving(false);
    }
  };

  // ── 삭제 ──────────────────────────────────────────────────
  const handleDelete = async () => {
    if (!selectedProject) return;
    try {
      setDeleting(true);
      await deleteProject(selectedProject.id);
      setDeleteDialogOpen(false);
      setSelectedProject(null);
      refreshList();
    } catch (err: any) {
      setError(err.message || err.response?.data?.message || '프로젝트 삭제에 실패했습니다.');
      setDeleteDialogOpen(false);
    } finally {
      setDeleting(false);
    }
  };

  const getStatusColor = (status: string) => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error'> = {
      PREPARING: 'default', IN_PROGRESS: 'primary', COMPLETED: 'success', CANCELLED: 'error',
    };
    return colors[status] || 'default';
  };

  const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
      PREPARING: '준비', IN_PROGRESS: '진행중', COMPLETED: '완료', CANCELLED: '취소',
    };
    return labels[status] || status;
  };

  const getProjectTypeLabel = (type: string) => ({ SI: 'SI', SM: 'SM' }[type] || type);
  const isChecked = (project: Project) => selectedProject?.id === project.id;

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
      {/* 헤더 */}
      <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', mb: 3, flexWrap: 'wrap', gap: 2, width: '100%' }}>
        <Typography variant={isMobile ? 'h5' : 'h4'}>프로젝트 관리</Typography>
        <Box sx={{ display: 'flex', gap: 1 }}>
          <Button variant="contained" startIcon={<Add />} onClick={() => navigate('/projects/new')} size={isMobile ? 'small' : 'medium'}>
            신규
          </Button>
          <Button variant="outlined" startIcon={<Edit />} disabled={!selectedProject} onClick={handleEditOpen} size={isMobile ? 'small' : 'medium'}>
            수정
          </Button>
          <Button variant="outlined" color="error" startIcon={<Delete />} disabled={!selectedProject} onClick={() => setDeleteDialogOpen(true)} size={isMobile ? 'small' : 'medium'}>
            삭제
          </Button>
        </Box>
      </Box>

      {/* 검색 조건 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>회사</InputLabel>
              <Select value={form.companyId} label="회사" onChange={(e) => setForm((f) => ({ ...f, companyId: e.target.value }))}>
                <MenuItem value="">전체</MenuItem>
                {companies.map((c) => <MenuItem key={c.id} value={String(c.id)}>{c.name}</MenuItem>)}
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 180 }, flexGrow: { md: 1.5 } }}>
            <TextField fullWidth size="small" label="프로젝트명" value={form.name}
              onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))} onKeyDown={handleKeyDown} placeholder="프로젝트명 검색" />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select value={form.projectType} label="유형" onChange={(e) => setForm((f) => ({ ...f, projectType: e.target.value }))}>
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="SI">SI (시스템 통합)</MenuItem>
                <MenuItem value="SM">SM (시스템 유지보수)</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>PM</InputLabel>
              <Select value={form.pmId} label="PM" onChange={(e) => setForm((f) => ({ ...f, pmId: e.target.value }))}>
                <MenuItem value="">전체</MenuItem>
                {pmCandidates.map((pm) => <MenuItem key={pm.id} value={String(pm.id)}>{pm.name}{pm.position ? ` (${pm.position})` : ''}</MenuItem>)}
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ display: 'flex', gap: 1, flexShrink: 0 }}>
            <Button variant="contained" onClick={handleSearch} startIcon={<Search />} size="medium" sx={{ whiteSpace: 'nowrap' }}>검색</Button>
            <Button variant="outlined" onClick={handleReset} startIcon={<Refresh />} size="medium" sx={{ whiteSpace: 'nowrap' }}>초기화</Button>
          </Grid>
        </Grid>
      </Paper>

      {error && <Alert severity="error" sx={{ mb: 2 }}>{error}</Alert>}

      {/* 모바일: 카드 뷰 */}
      {isMobile ? (
        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, width: '100%' }}>
          {loading ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}><Typography>로딩 중...</Typography></Paper>
          ) : !hasCondition(appliedSearch) ? (
            <Paper sx={{ p: 4, textAlign: 'center' }}><Typography color="text.secondary">검색조건을 입력 후 검색 버튼을 눌러주세요.</Typography></Paper>
          ) : projects.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}><Typography color="text.secondary">검색 결과가 없습니다.</Typography></Paper>
          ) : projects.map((project) => (
            <Card key={project.id} sx={{
              width: '100%',
              outline: isChecked(project) ? `2px solid ${theme.palette.primary.main}` : 'none',
              backgroundColor: isChecked(project) ? theme.palette.primary.light + '18' : 'inherit',
            }}>
              <CardContent>
                <Box sx={{ display: 'flex', alignItems: 'start', gap: 1, mb: 1 }}>
                  <Checkbox
                    checked={isChecked(project)}
                    onChange={(e) => handleCheckbox(project, e)}
                    size="small"
                    sx={{ mt: -0.5, ml: -1 }}
                  />
                  <Box sx={{ flex: 1 }}>
                    <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start' }}>
                      <Typography variant="h6" component="div" onClick={() => navigate(`/projects/${project.id}`)} sx={{ cursor: 'pointer', '&:hover': { textDecoration: 'underline' } }}>
                        {project.name}
                      </Typography>
                      <Chip label={getStatusLabel(project.status)} color={getStatusColor(project.status)} size="small" />
                    </Box>
                    <Typography variant="body2" color="text.secondary" gutterBottom>코드: {project.code}</Typography>
                    {project.companyName && <Typography variant="body2" color="text.secondary" gutterBottom>회사: {project.companyName}</Typography>}
                    <Typography variant="body2" color="text.secondary" gutterBottom>유형: {getProjectTypeLabel(project.projectType)}</Typography>
                    <Typography variant="body2" color="text.secondary" gutterBottom>기간: {project.startDate} ~ {project.endDate || '진행중'}</Typography>
                    {project.pmName && <Typography variant="body2" color="text.secondary">PM: {project.pmName}</Typography>}
                  </Box>
                </Box>
              </CardContent>
            </Card>
          ))}
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 2 }}>
            <TablePagination component="div" count={totalElements} page={page}
              onPageChange={(_, newPage) => setPage(newPage)} rowsPerPage={rowsPerPage}
              onRowsPerPageChange={(e) => { setRowsPerPage(parseInt(e.target.value, 10)); setPage(0); }}
              labelRowsPerPage="페이지당:" />
          </Box>
        </Box>
      ) : (
        /* 데스크탑: 테이블 뷰 */
        <TableContainer component={Paper} sx={{ width: '100%' }}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell padding="checkbox" />
                <TableCell>프로젝트 코드</TableCell>
                <TableCell>프로젝트명</TableCell>
                <TableCell>회사</TableCell>
                <TableCell>유형</TableCell>
                <TableCell>상태</TableCell>
                <TableCell>시작일</TableCell>
                <TableCell>종료일</TableCell>
                <TableCell>PM</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {loading ? (
                <TableRow><TableCell colSpan={9} align="center"><Typography>로딩 중...</Typography></TableCell></TableRow>
              ) : !hasCondition(appliedSearch) ? (
                <TableRow><TableCell colSpan={9} align="center"><Typography color="text.secondary">검색조건을 입력 후 검색 버튼을 눌러주세요.</Typography></TableCell></TableRow>
              ) : projects.length === 0 ? (
                <TableRow><TableCell colSpan={9} align="center"><Typography color="text.secondary">검색 결과가 없습니다.</Typography></TableCell></TableRow>
              ) : projects.map((project) => (
                <TableRow
                  key={project.id}
                  hover
                  selected={isChecked(project)}
                  sx={{ cursor: 'default' }}
                >
                  <TableCell padding="checkbox">
                    <Checkbox
                      checked={isChecked(project)}
                      onChange={(e) => handleCheckbox(project, e)}
                      size="small"
                    />
                  </TableCell>
                  <TableCell
                    onClick={() => navigate(`/projects/${project.id}`)}
                    sx={{ cursor: 'pointer', color: 'primary.main', '&:hover': { textDecoration: 'underline' } }}
                  >
                    {project.code}
                  </TableCell>
                  <TableCell>{project.name}</TableCell>
                  <TableCell>{project.companyName || '-'}</TableCell>
                  <TableCell>{getProjectTypeLabel(project.projectType)}</TableCell>
                  <TableCell>
                    <Chip label={getStatusLabel(project.status)} color={getStatusColor(project.status)} size="small" />
                  </TableCell>
                  <TableCell>{project.startDate}</TableCell>
                  <TableCell>{project.endDate || '-'}</TableCell>
                  <TableCell>{project.pmName || '-'}</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
          <TablePagination component="div" count={totalElements} page={page}
            onPageChange={(_, newPage) => setPage(newPage)} rowsPerPage={rowsPerPage}
            onRowsPerPageChange={(e) => { setRowsPerPage(parseInt(e.target.value, 10)); setPage(0); }}
            labelRowsPerPage="페이지당 행 수:" />
        </TableContainer>
      )}

      {/* ── 수정 팝업 다이얼로그 ─────────────────────────────── */}
      <Dialog open={editDialogOpen} onClose={handleEditClose} maxWidth="sm" fullWidth>
        <DialogTitle>프로젝트 수정</DialogTitle>
        <DialogContent dividers>
          {editLoading ? (
            <Box sx={{ display: 'flex', justifyContent: 'center', py: 4 }}>
              <CircularProgress />
            </Box>
          ) : (
            <Box component="form" id="edit-form" onSubmit={handleSubmit(handleEditSubmit)}>
              {editError && <Alert severity="error" sx={{ mb: 2 }}>{editError}</Alert>}

              <Controller name="code" control={control}
                render={({ field }) => (
                  <TextField {...field} label="프로젝트 코드" fullWidth margin="dense" disabled />
                )}
              />
              <Controller name="name" control={control}
                rules={{ required: '프로젝트명은 필수입니다.' }}
                render={({ field }) => (
                  <TextField {...field} label="프로젝트명" fullWidth margin="dense"
                    required error={!!errors.name} helperText={errors.name?.message} />
                )}
              />
              <Controller name="projectType" control={control}
                rules={{ required: '프로젝트 유형은 필수입니다.' }}
                render={({ field }) => (
                  <TextField {...field} select label="프로젝트 유형" fullWidth margin="dense"
                    required error={!!errors.projectType} helperText={errors.projectType?.message}>
                    <MenuItem value="SI">SI (시스템 통합)</MenuItem>
                    <MenuItem value="SM">SM (시스템 유지보수)</MenuItem>
                  </TextField>
                )}
              />
              <Autocomplete
                options={editPmList}
                getOptionLabel={(o) => `${o.name} (${o.email})`}
                value={editSelectedPm}
                onChange={(_, v) => setEditSelectedPm(v)}
                isOptionEqualToValue={(o, v) => o.id === v.id}
                renderInput={(params) => (
                  <TextField {...params} label="PM (프로젝트 관리자)" margin="dense" placeholder="PM을 선택하세요" />
                )}
                renderOption={(props, option) => (
                  <li {...props} key={option.id}>
                    <Box>
                      <Typography variant="body1">{option.name}</Typography>
                      <Typography variant="caption" color="text.secondary">
                        {option.email}{option.position && ` · ${option.position}`}
                      </Typography>
                    </Box>
                  </li>
                )}
                fullWidth
              />
              <Controller name="description" control={control}
                render={({ field }) => (
                  <TextField {...field} label="프로젝트 설명" fullWidth margin="dense" multiline rows={3} />
                )}
              />
              <Controller name="startDate" control={control}
                rules={{ required: '시작일은 필수입니다.' }}
                render={({ field }) => (
                  <TextField {...field} label="시작일" type="date" fullWidth margin="dense"
                    InputLabelProps={{ shrink: true }} required error={!!errors.startDate} helperText={errors.startDate?.message} />
                )}
              />
              <Controller name="endDate" control={control}
                render={({ field }) => (
                  <TextField {...field} label="종료일(예정)" type="date" fullWidth margin="dense" InputLabelProps={{ shrink: true }} />
                )}
              />
              <Controller name="budget" control={control}
                render={({ field }) => (
                  <TextField {...field} label="예산 (원)" type="number" fullWidth margin="dense" placeholder="예: 100000000" />
                )}
              />
            </Box>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={handleEditClose} disabled={editSaving} startIcon={<Cancel />}>취소</Button>
          <Button type="submit" form="edit-form" variant="contained" disabled={editSaving || editLoading}
            startIcon={editSaving ? <CircularProgress size={18} /> : <Save />}>
            {editSaving ? '저장 중...' : '저장'}
          </Button>
        </DialogActions>
      </Dialog>

      {/* ── 삭제 확인 다이얼로그 ─────────────────────────────── */}
      <Dialog open={deleteDialogOpen} onClose={() => !deleting && setDeleteDialogOpen(false)}>
        <DialogTitle>프로젝트 삭제</DialogTitle>
        <DialogContent>
          <DialogContentText>
            정말로 이 프로젝트를 삭제하시겠습니까?<br />
            <strong>{selectedProject?.name}</strong><br /><br />
            이 작업은 되돌릴 수 없습니다.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setDeleteDialogOpen(false)} disabled={deleting}>취소</Button>
          <Button onClick={handleDelete} color="error" disabled={deleting}
            startIcon={deleting ? <CircularProgress size={16} /> : null}>
            {deleting ? '삭제 중...' : '삭제'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default ProjectListPage;
