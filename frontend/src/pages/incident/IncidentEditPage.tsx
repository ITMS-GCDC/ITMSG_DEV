import React, { useState, useEffect } from 'react';
import {
  Box,
  Typography,
  TextField,
  Button,
  Paper,
  MenuItem,
  CircularProgress,
  Alert,
  Chip,
  useMediaQuery,
  useTheme,
} from '@mui/material';
import { ArrowBack, Save, Cancel } from '@mui/icons-material';
import { useNavigate, useParams } from 'react-router-dom';
import { getIncident, updateIncident } from '../../api/incident';
import type { Incident, IncidentUpdateRequest } from '../../types/incident.types';

const IncidentEditPage: React.FC = () => {
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));

  const [incident, setIncident] = useState<Incident | null>(null);
  const [formData, setFormData] = useState<IncidentUpdateRequest>({
    title: '',
    incidentType: 'INCIDENT',
    systemType: 'PROGRAM',
    businessArea: '',
    severity: 'MEDIUM',
  });
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  useEffect(() => {
    if (id) fetchIncident(Number(id));
  }, [id]);

  const fetchIncident = async (incidentId: number) => {
    try {
      setLoading(true);
      const data = await getIncident(incidentId);
      setIncident(data);
      setFormData({
        title: data.title,
        incidentType: data.incidentType,
        systemType: data.systemType,
        businessArea: data.businessArea || '',
        severity: data.severity,
        occurredAt: data.occurredAt,
        assigneeId: data.assigneeId,
      });
    } catch (err: any) {
      setError(err.response?.data?.message || '장애를 불러오는데 실패했습니다.');
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!id) return;

    setSaving(true);
    setError('');
    setSuccess('');

    try {
      if (!formData.title) {
        setError('제목은 필수입니다.');
        setSaving(false);
        return;
      }

      await updateIncident(Number(id), formData);
      setSuccess('장애가 성공적으로 수정되었습니다.');
      setTimeout(() => navigate(`/incidents/${id}`), 2000);
    } catch (err: any) {
      setError(err.response?.data?.message || '장애 수정에 실패했습니다.');
    } finally {
      setSaving(false);
    }
  };

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '400px' }}>
        <CircularProgress />
      </Box>
    );
  }

  if (!incident) {
    return (
      <Box>
        <Alert severity="error">{error || '장애를 찾을 수 없습니다.'}</Alert>
        <Button startIcon={<ArrowBack />} onClick={() => navigate('/incidents')} sx={{ mt: 2 }}>목록으로</Button>
      </Box>
    );
  }

  return (
    <Box sx={{ width: '100%' }}>
      <Button startIcon={<ArrowBack />} onClick={() => navigate(`/incidents/${id}`)} sx={{ mb: 2 }}>
        상세로 돌아가기
      </Button>
      <Typography variant={isMobile ? 'h5' : 'h4'} gutterBottom>장애 수정</Typography>

      <Paper sx={{ p: { xs: 2, sm: 3 }, mb: 3 }}>
        <Typography variant="subtitle2" color="text.secondary" gutterBottom>장애 정보 (수정 불가)</Typography>
        <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 2 }}>
          <Chip label={`장애번호: ${incident.incidentNumber}`} variant="outlined" />
          {incident.companyName && (
            <Chip label={`회사: ${incident.companyName}`} variant="outlined" />
          )}
          {incident.assigneeName && (
            <Chip label={`담당자: ${incident.assigneeName}`} variant="outlined" />
          )}
          <Chip label={`발생일: ${new Date(incident.occurredAt).toLocaleDateString()}`} variant="outlined" />
        </Box>
      </Paper>

      <Paper sx={{ p: { xs: 2, sm: 3 } }}>
        <Box component="form" onSubmit={handleSubmit}>
          {error && <Alert severity="error" sx={{ mb: 2 }}>{error}</Alert>}
          {success && <Alert severity="success" sx={{ mb: 2 }}>{success}</Alert>}

          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
            <TextField
              fullWidth
              label="제목"
              name="title"
              value={formData.title}
              onChange={handleChange}
              required
            />

            <Box sx={{ display: 'grid', gridTemplateColumns: { xs: '1fr', sm: 'repeat(2, 1fr)' }, gap: 2 }}>
              <TextField fullWidth select label="장애유형" name="incidentType" value={formData.incidentType} onChange={handleChange}>
                <MenuItem value="INCIDENT">인시던트</MenuItem>
                <MenuItem value="FAILURE">장애</MenuItem>
              </TextField>
              <TextField fullWidth select label="시스템유형" name="systemType" value={formData.systemType} onChange={handleChange}>
                <MenuItem value="PROGRAM">프로그램</MenuItem>
                <MenuItem value="DATA">데이터</MenuItem>
                <MenuItem value="SERVER">서버</MenuItem>
                <MenuItem value="NETWORK">네트워크</MenuItem>
                <MenuItem value="PC">PC</MenuItem>
              </TextField>
              <TextField fullWidth select label="심각도" name="severity" value={formData.severity} onChange={handleChange}>
                <MenuItem value="HIGH">높음</MenuItem>
                <MenuItem value="MEDIUM">보통</MenuItem>
                <MenuItem value="LOW">낮음</MenuItem>
              </TextField>
              <TextField
                fullWidth
                label="업무영역"
                name="businessArea"
                value={formData.businessArea || ''}
                onChange={handleChange}
                placeholder="업무영역을 입력하세요"
              />
            </Box>
          </Box>

          <Box sx={{ mt: 3, display: 'flex', justifyContent: 'flex-end', gap: 2, flexDirection: { xs: 'column', sm: 'row' } }}>
            <Button
              variant="outlined"
              startIcon={isMobile ? null : <Cancel />}
              onClick={() => navigate(`/incidents/${id}`)}
              disabled={saving}
              fullWidth={isMobile}
            >
              취소
            </Button>
            <Button
              type="submit"
              variant="contained"
              startIcon={saving ? <CircularProgress size={20} /> : (isMobile ? null : <Save />)}
              disabled={saving}
              fullWidth={isMobile}
            >
              {saving ? '저장 중...' : '저장'}
            </Button>
          </Box>
        </Box>
      </Paper>
    </Box>
  );
};

export default IncidentEditPage;
