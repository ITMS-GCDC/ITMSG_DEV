import React, { useEffect, useState } from 'react';
import {
  Box,
  Typography,
  Paper,
  Chip,
  Button,
  CircularProgress,
  Alert,
  Divider,
  useMediaQuery,
  useTheme,
} from '@mui/material';
import { useNavigate, useParams } from 'react-router-dom';
import { ArrowBack } from '@mui/icons-material';
import { getSpec } from '../../api/spec';
import type { Specification } from '../../types/spec.types';

const SpecDetailPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));
  const { id } = useParams<{ id: string }>();
  const [spec, setSpec] = useState<Specification | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    if (id) {
      fetchSpec(Number(id));
    }
  }, [id]);

  const fetchSpec = async (specId: number) => {
    try {
      setLoading(true);
      setError('');
      const data = await getSpec(specId);
      setSpec(data);
    } catch (err: any) {
      console.error('Failed to fetch SPEC:', err);
      setError(err.response?.data?.message || 'SPEC을 불러오는데 실패했습니다.');
    } finally {
      setLoading(false);
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

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '400px' }}>
        <CircularProgress />
      </Box>
    );
  }

  if (error || !spec) {
    return (
      <Box>
        <Alert severity="error">{error || 'SPEC을 찾을 수 없습니다.'}</Alert>
        <Button startIcon={<ArrowBack />} onClick={() => navigate('/specs')} sx={{ mt: 2 }}>
          목록으로
        </Button>
      </Box>
    );
  }

  return (
    <Box sx={{ width: '100%' }}>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 3, flexWrap: 'wrap', gap: 1 }}>
        <Button startIcon={isMobile ? null : <ArrowBack />} onClick={() => navigate('/specs')} size={isMobile ? 'small' : 'medium'}>
          목록으로
        </Button>
      </Box>

      <Paper sx={{ p: { xs: 2, sm: 3 } }}>
        <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', mb: 2, flexWrap: 'wrap', gap: 1 }}>
          <Typography variant={isMobile ? 'h5' : 'h4'}>{spec.specNumber}</Typography>
        </Box>

        <Box sx={{ display: 'flex', gap: 1, mb: 3, flexWrap: 'wrap' }}>
          <Chip label={spec.specType === 'DEVELOPMENT' ? '개발' : '운영'} color={spec.specType === 'DEVELOPMENT' ? 'primary' : 'secondary'} />
          <Chip label={spec.specCategory === 'ACCEPTED' ? '접수' : '취소'} variant="outlined" />
          <Chip label={getStatusLabel(spec.status)} color={getStatusColor(spec.status)} />
        </Box>

        <Divider sx={{ my: 3 }} />

        <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', md: 'repeat(2, 1fr)' }, gap: 3 }}>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>회사</Typography>
            <Typography variant="body1">{spec.companyName || '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>프로젝트</Typography>
            <Typography variant="body1">{spec.projectName || '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>연결된 SR</Typography>
            <Typography variant="body1">{spec.srNumber || '-'}{spec.srTitle ? ` - ${spec.srTitle}` : ''}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>담당자</Typography>
            <Typography variant="body1">{spec.assigneeName || '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>FP (Function Point)</Typography>
            <Typography variant="body1">{spec.functionPoint ?? '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>M/D (공수)</Typography>
            <Typography variant="body1">{spec.manDay ?? '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>검토자</Typography>
            <Typography variant="body1">{spec.reviewerName || '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>검토일</Typography>
            <Typography variant="body1">{spec.reviewedAt ? new Date(spec.reviewedAt).toLocaleString() : '-'}</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>등록일</Typography>
            <Typography variant="body1">{new Date(spec.createdAt).toLocaleString()} ({spec.createdBy})</Typography>
          </Box>

          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>수정일</Typography>
            <Typography variant="body1">{new Date(spec.updatedAt).toLocaleString()}</Typography>
          </Box>
        </Box>
      </Paper>
    </Box>
  );
};

export default SpecDetailPage;
