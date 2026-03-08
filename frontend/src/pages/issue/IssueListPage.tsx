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
import { getIssues, deleteIssue, updateIssue } from '../../api/issue';
import { getCompanies } from '../../api/project';
import type { Issue, IssueListParams, IssueUpdateRequest } from '../../types/issue.types';
import type { Company } from '../../types/project.types';

interface IssueSearchForm {
  companyId: string;
  projectName: string;
  issueNumber: string;
  issueType: string;
  priority: string;
  status: string;
}

const EMPTY_SEARCH_FORM: IssueSearchForm = {
  companyId: '',
  projectName: '',
  issueNumber: '',
  issueType: '',
  priority: '',
  status: '',
};

const IssueListPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));

  const [issues, setIssues] = useState<Issue[]>([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [totalElements, setTotalElements] = useState(0);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const [companies, setCompanies] = useState<Company[]>([]);

  const [searchForm, setSearchForm] = useState<IssueSearchForm>(EMPTY_SEARCH_FORM);
  const [activeParams, setActiveParams] = useState<IssueListParams>({});
  const [hasSearched, setHasSearched] = useState(false);

  const [selectedIssues, setSelectedIssues] = useState<number[]>([]);

  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedIssueData, setSelectedIssueData] = useState<Issue | null>(null);
  const [editForm, setEditForm] = useState<IssueUpdateRequest>({
    title: '',
    content: '',
    issueType: undefined,
    priority: undefined,
    status: undefined,
    assigneeId: undefined,
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
        const params: IssueListParams = {
          page,
          size: rowsPerPage,
          ...activeParams,
        };
        const response = await getIssues(params);
        setIssues(response.content || []);
        setTotalElements(response.totalElements || 0);
      } catch (err: any) {
        console.error('Failed to fetch issues:', err);
        setError(err.message || '이슈 목록을 불러오는데 실패했습니다.');
      } finally {
        setLoading(false);
      }
    };
    doFetch();
  }, [page, rowsPerPage, activeParams, hasSearched]);

  const handleSearch = () => {
    const params: IssueListParams = {};
    if (searchForm.companyId) params.companyId = Number(searchForm.companyId);
    if (searchForm.projectName) params.projectName = searchForm.projectName;
    if (searchForm.issueNumber) params.issueNumber = searchForm.issueNumber;
    if (searchForm.issueType) params.issueType = searchForm.issueType;
    if (searchForm.priority) params.priority = searchForm.priority;
    if (searchForm.status) params.status = searchForm.status;

    setHasSearched(true);
    setSelectedIssues([]);
    setPage(0);
    setActiveParams(params);
  };

  const handleClearSearch = () => {
    setHasSearched(false);
    setSearchForm(EMPTY_SEARCH_FORM);
    setSelectedIssues([]);
    setPage(0);
    setActiveParams({});
    setIssues([]);
    setTotalElements(0);
  };

  const handleOpenEdit = () => {
    if (selectedIssues.length !== 1) return;
    const issue = issues.find((i) => i.id === selectedIssues[0]);
    if (!issue) return;
    setSelectedIssueData(issue);
    setEditForm({
      title: issue.title,
      content: issue.content,
      issueType: issue.issueType,
      priority: issue.priority as any,
      status: issue.status,
      assigneeId: issue.assigneeId,
    });
    setOpenEditDialog(true);
  };

  const handleEditSubmit = async () => {
    if (!selectedIssueData) return;
    setEditLoading(true);
    try {
      await updateIssue(selectedIssueData.id, editForm);
      setOpenEditDialog(false);
      setSelectedIssues([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to update issue:', err);
      setError(err.message || '이슈 수정에 실패했습니다.');
    } finally {
      setEditLoading(false);
    }
  };

  const handleDelete = async () => {
    if (selectedIssues.length === 0) return;
    if (!window.confirm(`${selectedIssues.length}개의 이슈를 삭제하시겠습니까?`)) return;
    try {
      for (const issueId of selectedIssues) {
        await deleteIssue(issueId);
      }
      alert(`${selectedIssues.length}개의 이슈가 삭제되었습니다.`);
      setSelectedIssues([]);
      setActiveParams((prev) => ({ ...prev }));
    } catch (err: any) {
      console.error('Failed to delete issues:', err);
      setError(err.message || '이슈 삭제에 실패했습니다.');
    }
  };

  const getStatusColor = (status: string) => {
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
      OPEN: '열림',
      IN_PROGRESS: '진행중',
      RESOLVED: '해결됨',
      CLOSED: '닫힘',
    };
    return labels[status] || status;
  };

  const getPriorityColor = (priority?: string) => {
    const colors: Record<string, 'default' | 'primary' | 'success' | 'error' | 'warning'> = {
      LOW: 'default',
      MEDIUM: 'primary',
      HIGH: 'warning',
      CRITICAL: 'error',
    };
    return colors[priority || ''] || 'default';
  };

  const getPriorityLabel = (priority?: string) => {
    const labels: Record<string, string> = {
      LOW: '낮음',
      MEDIUM: '보통',
      HIGH: '높음',
      CRITICAL: '심각',
    };
    return labels[priority || ''] || priority || '-';
  };

  const getIssueTypeLabel = (issueType?: string) => {
    const labels: Record<string, string> = {
      BUG: '버그',
      IMPROVEMENT: '개선',
      NEW_FEATURE: '신규기능',
      TASK: '작업',
    };
    return labels[issueType || ''] || issueType || '-';
  };

  const isAnySelected = selectedIssues.length > 0;
  const isExactlyOneSelected = selectedIssues.length === 1;

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
        <Typography variant={isMobile ? 'h5' : 'h4'}>이슈 관리</Typography>
        <Stack direction="row" spacing={1} flexWrap="wrap" justifyContent="flex-end">
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={() => navigate('/issues/new')}
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

      {/* 검색 영역: 회사 → 프로젝트명 → 이슈번호 → 유형 → 우선순위 → 상태 */}
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
                {companies.map((c) => <MenuItem key={c.id} value={String(c.id)}>{c.name}</MenuItem>)}
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
              label="이슈번호"
              value={searchForm.issueNumber}
              onChange={(e) => setSearchForm((prev) => ({ ...prev, issueNumber: e.target.value }))}
              size="small"
              onKeyDown={(e) => { if (e.key === 'Enter') handleSearch(); }}
            />
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select
                value={searchForm.issueType}
                label="유형"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, issueType: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="BUG">버그</MenuItem>
                <MenuItem value="IMPROVEMENT">개선</MenuItem>
                <MenuItem value="NEW_FEATURE">신규기능</MenuItem>
                <MenuItem value="TASK">작업</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
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
                <MenuItem value="CRITICAL">심각</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid size={{ xs: 12, md: 'auto' }} sx={{ minWidth: { md: 140 }, flexGrow: { md: 1 } }}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchForm.status}
                label="상태"
                onChange={(e) => setSearchForm((prev) => ({ ...prev, status: e.target.value }))}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="OPEN">열림</MenuItem>
                <MenuItem value="IN_PROGRESS">진행중</MenuItem>
                <MenuItem value="RESOLVED">해결됨</MenuItem>
                <MenuItem value="CLOSED">닫힘</MenuItem>
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
          ) : issues.length === 0 ? (
            <Paper sx={{ p: 3, textAlign: 'center' }}>
              <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
            </Paper>
          ) : (
            issues.map((issue) => (
              <Card
                key={issue.id}
                sx={{ cursor: 'pointer', width: '100%' }}
                onClick={() => navigate(`/issues/${issue.id}`)}
              >
                <CardContent>
                  <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 1 }}>
                    <Typography variant="h6" component="div" sx={{ flex: 1, mr: 1 }}>{issue.title}</Typography>
                    <Chip label={getStatusLabel(issue.status)} color={getStatusColor(issue.status)} size="small" />
                  </Box>
                  <Box sx={{ display: 'flex', gap: 1, mb: 1 }}>
                    <Chip label={getIssueTypeLabel(issue.issueType)} size="small" color="primary" />
                    <Chip label={getPriorityLabel(issue.priority)} color={getPriorityColor(issue.priority)} size="small" />
                  </Box>
                  <Typography variant="body2" color="text.secondary" gutterBottom>이슈번호: {issue.issueNumber}</Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>프로젝트: {issue.projectName || '-'}</Typography>
                  <Typography variant="body2" color="text.secondary">담당자: {issue.assigneeName || '-'}</Typography>
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
                    indeterminate={selectedIssues.length > 0 && selectedIssues.length < issues.length}
                    checked={issues.length > 0 && selectedIssues.length === issues.length}
                    onChange={(e) => {
                      if (e.target.checked) {
                        setSelectedIssues(issues.map((i) => i.id));
                      } else {
                        setSelectedIssues([]);
                      }
                    }}
                  />
                </TableCell>
                <TableCell align="center">이슈번호</TableCell>
                <TableCell align="center">제목</TableCell>
                <TableCell align="center">유형</TableCell>
                <TableCell align="center">우선순위</TableCell>
                <TableCell align="center">상태</TableCell>
                <TableCell align="center">프로젝트</TableCell>
                <TableCell align="center">담당자</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {loading ? (
                <TableRow>
                  <TableCell colSpan={8} align="center">
                    <CircularProgress size={24} />
                    <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
                  </TableCell>
                </TableRow>
              ) : !hasSearched ? (
                <TableRow>
                  <TableCell colSpan={8} align="center">
                    <Typography color="text.secondary">검색조건을 입력 후 조회 버튼을 눌러주세요.</Typography>
                  </TableCell>
                </TableRow>
              ) : issues.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={8} align="center">
                    <Typography color="text.secondary">검색 결과가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                issues.map((issue) => (
                  <TableRow
                    key={issue.id}
                    hover
                    selected={selectedIssues.includes(issue.id)}
                    sx={{ cursor: 'pointer' }}
                    onClick={() => navigate(`/issues/${issue.id}`)}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedIssues.includes(issue.id)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedIssues((prev) => [...prev, issue.id]);
                          } else {
                            setSelectedIssues((prev) => prev.filter((id) => id !== issue.id));
                          }
                        }}
                        onClick={(e) => e.stopPropagation()}
                      />
                    </TableCell>
                    <TableCell align="center">{issue.issueNumber}</TableCell>
                    <TableCell align="center">{issue.title}</TableCell>
                    <TableCell align="center">
                      <Chip label={getIssueTypeLabel(issue.issueType)} size="small" color="primary" />
                    </TableCell>
                    <TableCell align="center">
                      <Chip label={getPriorityLabel(issue.priority)} color={getPriorityColor(issue.priority)} size="small" />
                    </TableCell>
                    <TableCell align="center">
                      <Chip label={getStatusLabel(issue.status)} color={getStatusColor(issue.status)} size="small" />
                    </TableCell>
                    <TableCell align="center">{issue.projectName || '-'}</TableCell>
                    <TableCell align="center">{issue.assigneeName || '-'}</TableCell>
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

      {/* 이슈 수정 팝업 */}
      <Dialog
        open={openEditDialog}
        onClose={() => setOpenEditDialog(false)}
        maxWidth="md"
        fullWidth
      >
        <DialogTitle>이슈 수정</DialogTitle>
        <DialogContent>
          {selectedIssueData && (
            <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
              {/* 읽기 전용 정보 */}
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 1 }}>
                <Box>
                  <Typography variant="caption" color="text.secondary">이슈 번호</Typography>
                  <Typography variant="body2" fontWeight="bold">{selectedIssueData.issueNumber}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">프로젝트</Typography>
                  <Typography variant="body2">{selectedIssueData.projectName || '-'}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">보고자</Typography>
                  <Typography variant="body2">{selectedIssueData.reporterName}</Typography>
                </Box>
                <Box>
                  <Typography variant="caption" color="text.secondary">회사</Typography>
                  <Typography variant="body2">{selectedIssueData.companyName || '-'}</Typography>
                </Box>
              </Box>

              {/* 편집 가능 필드 */}
              <TextField
                fullWidth
                label="제목"
                value={editForm.title || ''}
                onChange={(e) => setEditForm((prev) => ({ ...prev, title: e.target.value }))}
                size="small"
                required
              />
              <TextField
                fullWidth
                label="내용"
                value={editForm.content || ''}
                onChange={(e) => setEditForm((prev) => ({ ...prev, content: e.target.value }))}
                multiline
                rows={4}
                size="small"
              />
              <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(3, 1fr)' }, gap: 2 }}>
                <FormControl fullWidth size="small">
                  <InputLabel>유형</InputLabel>
                  <Select
                    value={editForm.issueType || ''}
                    label="유형"
                    onChange={(e) => setEditForm((prev) => ({ ...prev, issueType: e.target.value as any }))}
                  >
                    <MenuItem value="BUG">버그</MenuItem>
                    <MenuItem value="IMPROVEMENT">개선</MenuItem>
                    <MenuItem value="NEW_FEATURE">신규기능</MenuItem>
                    <MenuItem value="TASK">작업</MenuItem>
                  </Select>
                </FormControl>
                <FormControl fullWidth size="small">
                  <InputLabel>우선순위</InputLabel>
                  <Select
                    value={editForm.priority || ''}
                    label="우선순위"
                    onChange={(e) => setEditForm((prev) => ({ ...prev, priority: e.target.value as any }))}
                  >
                    <MenuItem value="LOW">낮음</MenuItem>
                    <MenuItem value="MEDIUM">보통</MenuItem>
                    <MenuItem value="HIGH">높음</MenuItem>
                    <MenuItem value="CRITICAL">심각</MenuItem>
                  </Select>
                </FormControl>
                <FormControl fullWidth size="small">
                  <InputLabel>상태</InputLabel>
                  <Select
                    value={editForm.status || ''}
                    label="상태"
                    onChange={(e) => setEditForm((prev) => ({ ...prev, status: e.target.value as any }))}
                  >
                    <MenuItem value="OPEN">열림</MenuItem>
                    <MenuItem value="IN_PROGRESS">진행중</MenuItem>
                    <MenuItem value="RESOLVED">해결됨</MenuItem>
                    <MenuItem value="CLOSED">닫힘</MenuItem>
                  </Select>
                </FormControl>
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

export default IssueListPage;
