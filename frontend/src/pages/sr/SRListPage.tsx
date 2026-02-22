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
  IconButton,
  Tooltip,
  Checkbox,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Stack,
} from '@mui/material';
import { Add, Search, Clear, Edit, Delete } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { getSrs } from '../../api/sr';
import type { ServiceRequest, SrListParams } from '../../types/sr.types';

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
  
  // 검색 상태
  const [searchParams, setSearchParams] = useState<SrListParams>({
    title: '',
    srType: undefined,
    status: undefined,
    priority: undefined,
    projectId: undefined,
    companyName: undefined,
    projectName: undefined,
    requesterId: undefined,
    startDate: undefined,
    endDate: undefined,
  });

  // 선택된 SR ID 관리
  const [selectedSrs, setSelectedSrs] = useState<number[]>([]);
  const [openEditDialog, setOpenEditDialog] = useState(false);
  const [selectedSrData, setSelectedSrData] = useState<ServiceRequest | null>(null);

  useEffect(() => {
    fetchSrs();
  }, [page, rowsPerPage, searchParams]);

  const fetchSrs = async () => {
    setLoading(true);
    setError('');
    try {
      const params = {
        page,
        size: rowsPerPage,
        ...searchParams,
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

  // 검색어 변경 핸들러
  const handleSearchChange = (field: keyof SrListParams, value: any) => {
    setSearchParams(prev => ({
      ...prev,
      [field]: value
    }));
  };

  // 검색 실행
  const handleSearch = () => {
    setPage(0);
    fetchSrs();
  };

  // 검색 조건 초기화
  const handleClearSearch = () => {
    setSearchParams({
      title: '',
      srType: undefined,
      status: undefined,
      priority: undefined,
      projectId: undefined,
      companyName: undefined,
      projectName: undefined,
      requesterId: undefined,
      startDate: undefined,
      endDate: undefined,
    });
    setPage(0);
    fetchSrs();
  };

  // 검색 조건 표시 텍스트 생성
  const getSearchConditionText = () => {
    const conditions: string[] = [];
    
    if (searchParams.title) conditions.push(`제목: ${searchParams.title}`);
    if (searchParams.companyName) conditions.push(`회사: ${searchParams.companyName}`);
    if (searchParams.projectName) conditions.push(`프로젝트: ${searchParams.projectName}`);
    if (searchParams.srType) conditions.push(`유형: ${searchParams.srType === 'DEVELOPMENT' ? '개발' : '운영'}`);
    if (searchParams.status) conditions.push(`상태: ${getStatusLabel(searchParams.status)}`);
    if (searchParams.priority) conditions.push(`우선순위: ${getPriorityLabel(searchParams.priority)}`);
    
    return conditions.length > 0 ? `검색조건: ${conditions.join(', ')}` : '';
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

  return (
    <Box sx={{ width: '100%', height: '100%' }}>
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
            onClick={() => {
              if (selectedSrs.length === 0) {
                alert('수정할 SR을 선택해주세요.');
                return;
              }
              if (selectedSrs.length > 1) {
                alert('한 번에 하나의 SR만 수정할 수 있습니다.');
                return;
              }
              const selectedSr = srs.find(sr => sr.id === selectedSrs[0]);
              if (selectedSr) {
                setSelectedSrData(selectedSr);
                setOpenEditDialog(true);
              }
            }}
            disabled={selectedSrs.length !== 1}
            size={isMobile ? 'small' : 'medium'}
          >
            수정
          </Button>
          <Button 
            variant="outlined" 
            color="error"
            startIcon={<Delete />} 
            onClick={() => {
              if (selectedSrs.length === 0) {
                alert('삭제할 SR을 선택해주세요.');
                return;
              }
              if (!window.confirm(`${selectedSrs.length}개의 SR을 삭제하시겠습니까?`)) {
                return;
              }
              // TODO: 삭제 API 호출 구현
              console.log('삭제할 SR ID:', selectedSrs);
            }}
            disabled={selectedSrs.length === 0}
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

      {/* 검색 영역 */}
      <Paper sx={{ p: 2, mb: 2 }}>
        <Grid container spacing={2} alignItems="end">
          <Grid item xs={12} sm={2}>
            <TextField
              fullWidth
              label="회사"
              value={searchParams.companyName || ''}
              onChange={(e) => handleSearchChange('companyName', e.target.value)}
              size="small"
            />
          </Grid>
          <Grid item xs={12} sm={2}>
            <TextField
              fullWidth
              label="프로젝트"
              value={searchParams.projectName || ''}
              onChange={(e) => handleSearchChange('projectName', e.target.value)}
              size="small"
            />
          </Grid>
          <Grid item xs={12} sm={2}>
            <FormControl fullWidth size="small">
              <InputLabel>유형</InputLabel>
              <Select
                value={searchParams.srType || ''}
                label="유형"
                onChange={(e) => handleSearchChange('srType', e.target.value)}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="DEVELOPMENT">개발</MenuItem>
                <MenuItem value="OPERATION">운영</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12} sm={2}>
            <FormControl fullWidth size="small">
              <InputLabel>상태</InputLabel>
              <Select
                value={searchParams.status || ''}
                label="상태"
                onChange={(e) => handleSearchChange('status', e.target.value)}
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
          <Grid item xs={12} sm={2}>
            <FormControl fullWidth size="small">
              <InputLabel>우선순위</InputLabel>
              <Select
                value={searchParams.priority || ''}
                label="우선순위"
                onChange={(e) => handleSearchChange('priority', e.target.value)}
              >
                <MenuItem value="">전체</MenuItem>
                <MenuItem value="LOW">낮음</MenuItem>
                <MenuItem value="MEDIUM">보통</MenuItem>
                <MenuItem value="HIGH">높음</MenuItem>
                <MenuItem value="URGENT">긴급</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12} sm={1}>
            <Box sx={{ display: 'flex', gap: 1 }}>
              <Tooltip title="검색">
                <IconButton onClick={handleSearch} color="primary">
                  <Search />
                </IconButton>
              </Tooltip>
              <Tooltip title="초기화">
                <IconButton onClick={handleClearSearch} color="default">
                  <Clear />
                </IconButton>
              </Tooltip>
            </Box>
          </Grid>
        </Grid>
        
        {/* 검색 조건 표시 */}
        {getSearchConditionText() && (
          <Box sx={{ mt: 2, p: 1, bgcolor: 'grey.100', borderRadius: 1 }}>
            <Typography variant="body2" color="text.secondary">
              {getSearchConditionText()}
            </Typography>
          </Box>
        )}
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
                <TableCell padding="checkbox">
                  <Checkbox
                    indeterminate={selectedSrs.length > 0 && selectedSrs.length < srs.length}
                    checked={srs.length > 0 && selectedSrs.length === srs.length}
                    onChange={(e) => {
                      if (e.target.checked) {
                        setSelectedSrs(srs.map(sr => sr.id));
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
                  <TableCell colSpan={8} align="center">
                    <CircularProgress size={24} />
                    <Typography sx={{ mt: 1 }}>로딩 중...</Typography>
                  </TableCell>
                </TableRow>
              ) : srs.length === 0 ? (
                <TableRow>
                  <TableCell colSpan={8} align="center">
                    <Typography>데이터가 없습니다.</Typography>
                  </TableCell>
                </TableRow>
              ) : (
                srs.map((sr) => (
                  <TableRow
                    key={sr.id}
                    hover
                    onClick={() => navigate(`/srs/${sr.id}`)}
                    sx={{ cursor: 'pointer' }}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        checked={selectedSrs.includes(sr.id)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedSrs(prev => [...prev, sr.id]);
                          } else {
                            setSelectedSrs(prev => prev.filter(id => id !== sr.id));
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
                    <TableCell align="center">{sr.requestDate || new Date(sr.createdAt).toLocaleDateString()}</TableCell>
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
    </Box>

    {/* SR 수정 팝업 */}
    <Dialog 
      open={openEditDialog} 
      onClose={() => setOpenEditDialog(false)}
      maxWidth="md"
      fullWidth
    >
      <DialogTitle>SR 수정</DialogTitle>
      <DialogContent>
        {selectedSrData && (
          <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', md: 'repeat(2, 1fr)' }, gap: 2 }}>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                SR 번호
              </Typography>
              <Typography variant="body1">{selectedSrData.srNumber}</Typography>
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                제목
              </Typography>
              <Typography variant="body1">{selectedSrData.title}</Typography>
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                유형
              </Typography>
              <Typography variant="body1">
                {selectedSrData.srType === 'DEVELOPMENT' ? '개발' : '운영'}
              </Typography>
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                프로젝트
              </Typography>
              <Typography variant="body1">{selectedSrData.projectName}</Typography>
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                요청자
              </Typography>
              <Typography variant="body1">{selectedSrData.requesterName}</Typography>
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                상태
              </Typography>
              <Chip
                label={getStatusLabel(selectedSrData.status)}
                color={getStatusColor(selectedSrData.status)}
                size="small"
              />
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                우선순위
              </Typography>
              <Chip
                label={getPriorityLabel(selectedSrData.priority)}
                color={getPriorityColor(selectedSrData.priority)}
                size="small"
              />
            </Box>
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                요청일
              </Typography>
              <Typography variant="body1">
                {selectedSrData.requestDate || new Date(selectedSrData.createdAt).toLocaleDateString()}
              </Typography>
            </Box>
            <Box sx={{ gridColumn: { xs: '1', md: '1 / -1' } }}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                비즈니스 요구사항
              </Typography>
              <Paper
                variant="outlined"
                sx={{ p: 2, bgcolor: 'rgba(255,255,255,0.03)', whiteSpace: 'pre-wrap' }}
              >
                <Typography variant="body1">{selectedSrData.businessRequirement}</Typography>
              </Paper>
            </Box>
          </Box>
        )}
      </DialogContent>
      <DialogActions>
        <Button onClick={() => setOpenEditDialog(false)}>닫기</Button>
        <Button 
          variant="contained" 
          onClick={() => {
            if (selectedSrData) {
              navigate(`/srs/${selectedSrData.id}/edit`);
            }
          }}
        >
          상세 수정 페이지로 이동
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default SRListPage;
