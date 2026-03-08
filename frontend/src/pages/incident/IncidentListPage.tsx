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
import { getIncidents, deleteIncident, updateIncident } from '../../api/incident';
import { getCompanies } from '../../api/project';
import type { Incident, IncidentListParams, IncidentUpdateRequest } from '../../types/incident.types';
import type { Company } from '../../types/project.types';

interface IncidentSearchForm {
  companyId: string;
  projectName: string;
  incidentNumber: string;
  severity: string;
  status: string;
}

const EMPTY_SEARCH_FORM: IncidentSearchForm = {
  companyId: '',
  projectName: '',
  incidentNumber: '',
  severity: '',
  status: '',
};

const IncidentListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [incidents, setIncidents] = useState<Incident[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const [companies, setCompanies] = useState<Company[]>([]);

  const [searchForm, setSearchForm] = useState<IncidentSearchForm>(EMPTY_SEARCH_FORM);
  const [activeParams, setActiveParams] = useState<IncidentListParams>({});
  const [hasSearched, setHasSearched] = useState(false);

  const [selectedIncidents, setSelectedIncidents] = useState<number[]>([]);

  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedIncidentData, setSelectedIncidentData] = useState<Incident | null>(null);
  const [editForm, setEditForm] = useState<IncidentUpdateRequest>({
    title: '',
    incidentType: 'INCIDENT',
    systemType: 'PROGRAM',
    businessArea: '',
    severity: 'MEDIUM',
  });
  const [editLoading, setEditLoading] = useState(false);

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
        const params: IncidentListParams = {
          page,
          size: rowsPerPage,
          ...activeParams,
        };
        const response = await getIncidents(params);
        setIncidents(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        console.error('Failed to fetch incidents:', err);
        setError(err.message || '장애 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams, hasSearched]);

  const handleSearch = () => {
    const params: IncidentListParams = {};
    if (searchForm.companyId) params.companyId = Number(searchForm.companyId);
    if (searchForm.incidentNumber) params.incidentNumber = searchForm.incidentNumber;
    if (searchForm.severity) params.severity = searchForm.severity;
    if (searchForm.status) params.status = searchForm.status;

    setHasSearched(true);
    setSelectedIncidents([]);
    setPage(0);
    setActiveParams(params);
  };

  const handleClearSearch = () => {
    setHasSearched(false);
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedIncidents([]);
    setPage(0);
    setActiveParams({});
    setIncidents([]);
    setTotalElements(0);
  };

  const handleOpenEdit = () => {
    if (selectedIncidents.length !== 1) return;
    const incident = incidents.find((i) => i.id === selectedIncidents[0]);
    if (!incident) return;
    setSelectedIncidentData(incident);
    setEditForm({
      title: incident.title,
      incidentType: incident.incidentType,
      systemType: incident.systemType,
      businessArea: incident.businessArea || '',
      severity: incident.severity,
      occurredAt: incident.occurredAt,
      assigneeId: incident.assigneeId,
    });
    setOpenEditDialog(true);
  };

  const handleEditSubmit = async () => {
    if (!selectedIncidentData) return;
    setEditLoading(true);
    try {
      await updateIncident(selectedIncidentData.id, editForm);
      setOpenEditDialog(false);
      setSelectedIncidents([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to update incident:', err);
      setError(err.message || '장애 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  const handleDelete = async () => {
    if (selectedIncidents.length === 0) return;
    if (!window.confirm(`${selectedIncidents.length}개의 장애를 삭제하시겠습니까?`)) return;
    try {
      for (const incidentId of selectedIncidents) {
        await deleteIncident(incidentId);
      }
      alert(`${selectedIncidents.length}개의 장애가 삭제되었습니다.`);
      setSelectedIncidents([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to delete incidents:', err);
      setError(err.message || '장애 삭제에 실패했습니다.');
    }
  };

  const getStatusColor = (status: string): 'default' | 'primary' | 'success' | 'error' | 'warning' => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error' | 'warning'> = {
      OPEN: 'error',
      IN_PROGRESS: 'warning',
      RESOLVED: 'success',
      CLOSED: 'default',
    };
    return colors[status] || 'default';
  };

  const getStatusLabel = (status: string) => {
    const labels: Record<string, string> = {
      OPEN: '발생',
      IN_PROGRESS: '진행중',
      RESOLVED: '해결됨',
      CLOSED: '종료',
    };
    return labels[status] || status;
  };

  const getSeverityColor = (severity: string): 'default' | 'primary' | 'success' | 'error' | 'warning' => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error' | 'warning'> = {
      LOW: 'default',
      MEDIUM: 'primary',
      HIGH: 'warning',
    };
    return colors[severity] || 'default';
  };

  const getSeverityLabel = (severity: string) => {
    const labels: Record<string, string> = {
      LOW: '낮음',
      MEDIUM: '보통',
      HIGH: '높음',
    };
    return labels[severity] || severity;
  };

  const getIncidentTypeLabel = (type: string) => {
    const labels: Record<string, string> = {
      INCIDENT: '인시던트',
      FAILURE: '장애',
    };
    return labels[type] || type;
  };

  const isAnySelected = selectedIncidents.length > 0;
  const isExactlyOneSelected = selectedIncidents.length === 1;

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
        <Typography variant={isMobile ? 'h5' : 'h4'}>장애 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => navigate('/incidents/new')}
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

      {/* 검색 영역: 회사 → 프로젝트명 → 장애번호 → 심각도 → 상태 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={1.5} alignItems="center" sx={{ flexWrap: { xs: 'wrap', md: 'nowrap' } }}>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1 } }}>
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
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 150 }, flexGrow: { md: 1.2 } }}>
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
              label="장애번호"
              value={searchForm.incidentNumber}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, incidentNumber: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 130 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>심각도</InputLabel>
              <Select
                value={searchForm.severity}
                label="심각도"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, severity: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="HIGH">높음</MenuItem>
                <MenuItem value="MEDIUM">보통</MenuItem>
                <MenuItem value="LOW">낮음</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 130 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.status}
                label="상태"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, status: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="OPEN">발생</MenuItem>
                <MenuItem value="IN_PROGRESS">진행중</MenuItem>
                <MenuItem value="RESOLVED">해결됨</MenuItem>
                <MenuItem value="CLOSED">종료</MenuItem>
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
          ) : incidents.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
            </Paper>
          ) : (
            incidents.map((incident) => (
              <Card
                key={incident.id}
                sx={{ cursor: 'pointer', width: '100%' }}
                onClick={() => navigate(`/incidents/${incident.id}`)}
              >
                <CardContent>
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                    <Typography variant="h6" component="div" sx={{ flex: 1, mr: 1 }}>{incident.title}</Typography>
                    <Chip label={getStatusLabel(incident.status)} color={getStatusColor(incident.status)} size="small" />
                  </Box>
                  <Box sx={{ display: 'flex', gap: 1, mb: 1 }}>
                    <Chip label={getSeverityLabel(incident.severity)} color={getSeverityColor(incident.severity)} size="small" />
                    <Chip label={getIncidentTypeLabel(incident.incidentType)} size="small" color="primary" />
                  </Box>
                  <Typography variant="body2" color="text.secondary" gutterBottom>장애번호: {incident.incidentNumber}</Typography>
                  {incident.companyName && (
                    <Typography variant="body2" color="text.secondary" gutterBottom>회사: {incident.companyName}</Typography>
                  )}
                  <Typography variant="body2" color="text.secondary">담당자: {incident.assigneeName || '-'}</Typography>
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
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={selectedIncidents.length > 0 && selectedIncidents.length < incidents.length}
                    checked={incidents.length > 0 && selectedIncidents.length === incidents.length}
                    onChange={(e) => {
                      if (e.target.checked) {
                        setSelectedIncidents(incidents.map((i) => i.id));
                      } else {
                        setSelectedIncidents([]);
                      }
                    }}
                  />
                </TableCell>
                <TableCell align="center">장애번호</TableCell>
                <TableCell align="center">제목</TableCell>
                <TableCell align="center">유형</TableCell>
                <TableCell align="center">심각도</TableCell>
                <TableCell align="center">상태</TableCell>
                <TableCell align="center">회사</TableCell>
                <TableCell align="center">담당자</TableCell>
                <TableCell align="center">발생일</TableCell>
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
              ) : incidents.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={9} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                incidents.map((incident) => (
                  <TableRow
                    key={incident.id}
                    hover
                    selected={selectedIncidents.includes(incident.id)}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/incidents/${incident.id}`)}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedIncidents.includes(incident.id)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedIncidents((prev) => [...prev, incident.id]);
                          } else {
                            setSelectedIncidents((prev) => prev.filter((id) => id !== incident.id));
                          }
                        }}
                        onClick={(e) => e.stopPropagation()}
                      />
                    </TableCell>
                    <TableCell align="center">{incident.incidentNumber}</TableCell>
                    <TableCell align="center">{incident.title}</TableCell>
                    <TableCell align="center">
                      <Chip label={getIncidentTypeLabel(incident.incidentType)} size="small" color="primary" />
                    </TableCell>
                    <TableCell align="center">
                      <Chip label={getSeverityLabel(incident.severity)} color={getSeverityColor(incident.severity)} size="small" />
                    </TableCell>
                    <TableCell align="center">
                      <Chip label={getStatusLabel(incident.status)} color={getStatusColor(incident.status)} size="small" />
                    </TableCell>
                    <TableCell align="center">{incident.companyName || '-'}</TableCell>
                    <TableCell align="center">{incident.assigneeName || '-'}</TableCell>
                    <TableCell align="center">{new Date(incident.occurredAt).toLocaleDateString()}</TableCell>
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

      {/* 장애 수정 팝업 */}
      <Dialog
        open={openEditDialog}
        onClose={() => setOpenEditDialog(false)}
        maxWidth="md"
        fullWidth
      >
        <DialogTitle>장애 수정</DialogTitle>
        <DialogContent>
          {selectedIncidentData && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              {/* 읽기 전용 정보 */}
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 1 }}>
                <Box>
                  <Typography variant="caption" color="text.secondary">장애번호</Typography>
                  <Typography variant="body2" fontWeight="bold">{selectedIncidentData.incidentNumber}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">회사</Typography>
                  <Typography variant="body2">{selectedIncidentData.companyName || '-'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">담당자</Typography>
                  <Typography variant="body2">{selectedIncidentData.assigneeName || '-'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">발생일시</Typography>
                  <Typography variant="body2">{new Date(selectedIncidentData.occurredAt).toLocaleString()}</Typography>
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
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 2 }}>
                <FormControl fullWidth size="small">
                  <InputLabel>장애유형</InputLabel>
                  <Select
                    value={editForm.incidentType}
                    label="장애유형"
                    onChange={(e) => setEditForm((prev) => ({ ...prev, incidentType: e.target.value as any }))}
                  >
                    <MenuItem value="INCIDENT">인시던트</MenuItem>
                    <MenuItem value="FAILURE">장애</MenuItem>
                  </Select>
                </FormControl>
                <FormControl fullWidth size="small">
                  <InputLabel>시스템유형</InputLabel>
                  <Select
                    value={editForm.systemType}
                    label="시스템유형"
                    onChange={(e) => setEditForm((prev) => ({ ...prev, systemType: e.target.value as any }))}
                  >
                    <MenuItem value="PROGRAM">프로그램</MenuItem>
                    <MenuItem value="DATA">데이터</MenuItem>
                    <MenuItem value="SERVER">서버</MenuItem>
                    <MenuItem value="NETWORK">네트워크</MenuItem>
                    <MenuItem value="PC">PC</MenuItem>
                  </Select>
                </FormControl>
                <FormControl fullWidth size="small">
                  <InputLabel>심각도</InputLabel>
                  <Select
                    value={editForm.severity}
                    label="심각도"
                    onChange={(e) => setEditForm((prev) => ({ ...prev, severity: e.target.value as any }))}
                  >
                    <MenuItem value="HIGH">높음</MenuItem>
                    <MenuItem value="MEDIUM">보통</MenuItem>
                    <MenuItem value="LOW">낮음</MenuItem>
                  </Select>
                </FormControl>
                <TextField
                  fullWidth
                  label="업무영역"
                  value={editForm.businessArea || ''}
                  onChange={(e) => setEditForm((prev) => ({ ...prev, businessArea: e.target.value }))}
                  size="small"
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
            disabled={editLoading || !editForm.title}
          >
            {editLoading ? <CircularProgress size={20} /> : '저장'}
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default IncidentListPage;
