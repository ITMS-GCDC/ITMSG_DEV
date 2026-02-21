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
} from '@mui/material';
import { Add, Search, Refresh } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { getProjects, getCompanies, getPmCandidates } from '../../api/project';
import type { Project, Company, ProjectListParams } from '../../types/project.types';
import type { PmCandidate } from '../../api/project';

interface SearchForm {
  companyId: string;
  name: string;
  projectType: string;
  pmId: string;
}

const EMPTY_FORM: SearchForm = { companyId: '', name: '', projectType: '', pmId: '' };

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

  const [companies, setCompanies] = useState<Company[]>([]);
  const [pmCandidates, setPmCandidates] = useState<PmCandidate[]>([]);

  // 폼 입력값 (사용자가 변경 중인 값)
  const [form, setForm] = useState<SearchForm>(EMPTY_FORM);
  // 실제 적용된 검색조건 (검색 버튼 클릭 시 커밋)
  const [appliedSearch, setAppliedSearch] = useState<SearchForm>(EMPTY_FORM);

  useEffect(() => {
    loadFilterData();
  }, []);

  // page, rowsPerPage, appliedSearch 변경 시 조회
  useEffect(() => {
    const params: ProjectListParams = { page, size: rowsPerPage };
    if (appliedSearch.companyId) params.companyId = Number(appliedSearch.companyId);
    if (appliedSearch.name.trim()) params.name = appliedSearch.name.trim();
    if (appliedSearch.projectType) params.projectType = appliedSearch.projectType as any;
    if (appliedSearch.pmId) params.pmId = Number(appliedSearch.pmId);
    doFetch(params);
  }, [page, rowsPerPage, appliedSearch]);

  const loadFilterData = async () => {
    try {
      const [companiesData, pmData] = await Promise.all([
        getCompanies(),
        getPmCandidates(),
      ]);
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
    } catch (err: any) {
      console.error('Failed to fetch projects:', err);
      setError(err.response?.data?.message || '프로젝트 목록을 불러오는데 실패했습니다.');
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = () => {
    setPage(0);
    setAppliedSearch({ ...form });
  };

  const handleReset = () => {
    setForm(EMPTY_FORM);
    setPage(0);
    setAppliedSearch(EMPTY_FORM);
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') handleSearch();
  };

  const getStatusColor = (status: string) => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error'> = {
      PREPARING: 'default',
      IN_PROGRESS: 'primary',
      COMPLETED: 'success',
      CANCELLED: 'error',
    };
    return colors[status] || 'default';
  };

  const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
      PREPARING: '준비',
      IN_PROGRESS: '진행중',
      COMPLETED: '완료',
      CANCELLED: '취소',
    };
    return labels[status] || status;
  };

  const getProjectTypeLabel = (type: string) => {
    const labels: Record<string, string> = { SI: 'SI', SM: 'SM' };
    return labels[type] || type;
  };

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
      {/* 헤더 */}
      <Box sx={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        mb: 3,
        flexWrap: 'wrap',
        gap: 2,
        width: '100%',
      }}>
        <Typography variant={isMobile ? 'h5' : 'h4'}>프로젝트 관리</Typography>
        <Button
          variant="contained"
          startIcon={<Add />}
          onClick={() => navigate('/projects/new')}
          size={isMobile ? 'small' : 'medium'}
        >
          {isMobile ? '등록' : '프로젝트 등록'}
        </Button>
      </Box>

      {/* 검색 조건 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" wrap="nowrap"
          sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>

          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>회사</InputLabel>
              <Select
                value={form.companyId}
                label="회사"
                onChange={(e) => setForm((f) => ({ ...f, companyId: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                {companies.map((c) => (
                  <MenuItem key={c.id} value={String(c.id)}>{c.name}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>

          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 180 }, flexGrow: { md: 1.5 } }}>
            <TextField
              fullWidth
              size="small"
              label="프로젝트명"
              value={form.name}
              onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))}
              onKeyDown={handleKeyDown}
              placeholder="프로젝트명 검색"
            />
          </Grid>

          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select
                value={form.projectType}
                label="유형"
                onChange={(e) => setForm((f) => ({ ...f, projectType: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="SI">SI (시스템 통합)</MenuItem>
                <MenuItem value="SM">SM (시스템 유지보수)</MenuItem>
              </Select>
            </FormControl>
          </Grid>

          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 160 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>PM</InputLabel>
              <Select
                value={form.pmId}
                label="PM"
                onChange={(e) => setForm((f) => ({ ...f, pmId: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                {pmCandidates.map((pm) => (
                  <MenuItem key={pm.id} value={String(pm.id)}>
                    {pm.name}{pm.position ? ` (${pm.position})` : ''}
                  </MenuItem>
                ))}
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
              onClick={handleReset}
              startIcon={<Refresh />}
              size="medium"
              sx={{ whiteSpace: 'nowrap' }}
            >
              초기화
            </Button>
          </Grid>
        </Grid>
      </Paper>

      {error && (
        <Alert severity="error" sx={{ mb: 2 }}>
          {error}
        </Alert>
      )}

      {/* 모바일: 카드 뷰 */}
      {isMobile ? (
        <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, width: '100%' }}>
          {loading ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography>로딩 중...</Typography>
            </Paper>
          ) : projects.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
            </Paper>
          ) : projects.map((project) => (
            <Card
              key={project.id}
              sx={{ cursor: 'pointer', width: '100%' }}
              onClick={() => navigate(`/projects/${project.id}`)}
            >
              <CardContent>
                <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                  <Typography variant="h6" component="div">{project.name}</Typography>
                  <Chip
                    label={getStatusLabel(project.status)}
                    color={getStatusColor(project.status)}
                    size="small"
                  />
                </Box>
                <Typography variant="body2" color="text.secondary" gutterBottom>
                  코드: {project.code}
                </Typography>
                {project.companyName && (
                  <Typography variant="body2" color="text.secondary" gutterBottom>
                    회사: {project.companyName}
                  </Typography>
                )}
                <Typography variant="body2" color="text.secondary" gutterBottom>
                  유형: {getProjectTypeLabel(project.projectType)}
                </Typography>
                <Typography variant="body2" color="text.secondary" gutterBottom>
                  기간: {project.startDate} ~ {project.endDate || '진행중'}
                </Typography>
                {project.pmName && (
                  <Typography variant="body2" color="text.secondary">
                    PM: {project.pmName}
                  </Typography>
                )}
              </CardContent>
            </Card>
          ))}
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
                <TableRow>
                  <TableCell colSpan={8} align="center">
                    <Typography>로딩 중...</Typography>
                  </TableCell>
                </TableRow>
              ) : projects.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={8} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : projects.map((project) => (
                <TableRow
                  key={project.id}
                  hover
                  onClick={() => navigate(`/projects/${project.id}`)}
                  sx={{ cursor: 'pointer' }}
                >
                  <TableCell>{project.code}</TableCell>
                  <TableCell>{project.name}</TableCell>
                  <TableCell>{project.companyName || '-'}</TableCell>
                  <TableCell>{getProjectTypeLabel(project.projectType)}</TableCell>
                  <TableCell>
                    <Chip
                      label={getStatusLabel(project.status)}
                      color={getStatusColor(project.status)}
                      size="small"
                    />
                  </TableCell>
                  <TableCell>{project.startDate}</TableCell>
                  <TableCell>{project.endDate || '-'}</TableCell>
                  <TableCell>{project.pmName || '-'}</TableCell>
                </TableRow>
              ))}
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
    </Box>
  );
};

export default ProjectListPage;
