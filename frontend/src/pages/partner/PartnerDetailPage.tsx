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
import { getPartner } from '../../api/partner';
import type { Partner } from '../../types/partner.types';

const PartnerDetailPage: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));
  const { id } = useParams<{ id: string }>();
  const [partner, setPartner] = useState<Partner | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    if (id) fetchPartner(Number(id));
  }, [id]);

  const fetchPartner = async (partnerId: number) => {
    try {
      setLoading(true);
      const data = await getPartner(partnerId);
      setPartner(data);
    } catch (err: any) {
      setError(err.response?.data?.message || '파트너를 불러오는데 실패했습니다.');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '400px' }}><CircularProgress /></Box>;
  }

  if (error || !partner) {
    return (
      <Box>
        <Alert severity="error">{error || '파트너를 찾을 수 없습니다.'}</Alert>
        <Button startIcon={<ArrowBack />} onClick={() => navigate('/partners')} sx={{ mt: 2 }}>목록으로</Button>
      </Box>
    );
  }

  return (
    <Box sx={{ width: '100%' }}>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 3, flexWrap: 'wrap', gap: 1 }}>
        <Button startIcon={isMobile ? null : <ArrowBack />} onClick={() => navigate('/partners')} size={isMobile ? 'small' : 'medium'}>목록으로</Button>
      </Box>

      <Paper sx={{ p: { xs: 2, sm: 3 } }}>
        <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', mb: 2, flexWrap: 'wrap', gap: 1 }}>
          <Box>
            <Typography variant={isMobile ? 'h5' : 'h4'}>{partner.name}</Typography>
            <Typography variant="body2" color="text.secondary">{partner.code}</Typography>
          </Box>
          <Chip label={partner.isClosed ? '폐업' : '운영중'} color={partner.isClosed ? 'error' : 'success'} />
        </Box>

        <Divider sx={{ my: 3 }} />

        <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', md: 'repeat(2, 1fr)' }, gap: 3 }}>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>사업자등록번호</Typography>
            <Typography variant="body1">{partner.businessNumber}</Typography>
          </Box>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>대표자명</Typography>
            <Typography variant="body1">{partner.ceoName || '-'}</Typography>
          </Box>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>내부 담당자</Typography>
            <Typography variant="body1">{partner.managerName || '-'}</Typography>
          </Box>
          {partner.isClosed && partner.closedAt && (
            <Box>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>폐업일</Typography>
              <Typography variant="body1">{partner.closedAt}</Typography>
            </Box>
          )}
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>등록일</Typography>
            <Typography variant="body1">{new Date(partner.createdAt).toLocaleString()}</Typography>
          </Box>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>등록자</Typography>
            <Typography variant="body1">{partner.createdBy}</Typography>
          </Box>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>수정일</Typography>
            <Typography variant="body1">{new Date(partner.updatedAt).toLocaleString()}</Typography>
          </Box>
          <Box>
            <Typography variant="subtitle2" color="text.secondary" gutterBottom>수정자</Typography>
            <Typography variant="body1">{partner.updatedBy}</Typography>
          </Box>
        </Box>
      </Paper>
    </Box>
  );
};

export default PartnerDetailPage;
