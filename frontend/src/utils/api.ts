import axios, { type AxiosInstance, type InternalAxiosRequestConfig, type AxiosResponse } from 'axios';
import type { ApiError } from '../types/common.types';

// API Base URL
// 프로덕션: Nginx 프록시를 통해 /api로 요청
// 개발: 환경변수가 있으면 사용, 없으면 상대 경로
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || '/api';

// Axios 인스턴스 생성
const apiClient: AxiosInstance = axios.create({
  baseURL: API_BASE_URL,
  timeout: 30000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request Interceptor - JWT 토큰 추가
apiClient.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    const token = localStorage.getItem('accessToken');
    if (token && config.headers) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// 로그아웃 처리 함수 (중복 리다이렉트 방지)
let isRedirecting = false;
const handleLogout = () => {
  if (isRedirecting) return;
  isRedirecting = true;
  
  localStorage.removeItem('accessToken');
  localStorage.removeItem('refreshToken');
  
  // 현재 로그인 페이지가 아닌 경우에만 리다이렉트
  if (!window.location.pathname.includes('/login')) {
    window.location.href = '/login';
  }
};

// Response Interceptor - 에러 처리
apiClient.interceptors.response.use(
  (response: AxiosResponse) => {
    return response;
  },
  async (error) => {
    const originalRequest = error.config;

    // 401 에러 (인증 실패) 또는 403 에러 (Spring Security STATELESS 환경에서 만료 토큰 처리)
    // → 토큰 갱신 시도
    const status = error.response?.status;
    if ((status === 401 || status === 403) && !originalRequest._retry) {
      originalRequest._retry = true;

      try {
        const refreshToken = localStorage.getItem('refreshToken');
        if (refreshToken) {
          const response = await axios.post(`${API_BASE_URL}/auth/refresh`, {
            refreshToken,
          });

          const { accessToken } = response.data;
          localStorage.setItem('accessToken', accessToken);

          // 원래 요청 재시도
          originalRequest.headers.Authorization = `Bearer ${accessToken}`;
          return apiClient(originalRequest);
        } else {
          // refreshToken이 없으면 로그아웃
          handleLogout();
        }
      } catch (refreshError) {
        // 토큰 갱신 실패 - 로그아웃 처리
        handleLogout();
        return Promise.reject(refreshError);
      }
    }

    // 갱신 재시도 후에도 401/403이면 로그아웃
    if ((status === 401 || status === 403) && originalRequest._retry) {
      handleLogout();
    }

    // API 에러 응답 처리
    const apiError: ApiError = error.response?.data || {
      code: 'UNKNOWN_ERROR',
      message: '알 수 없는 오류가 발생했습니다.',
      timestamp: new Date().toISOString(),
    };

    return Promise.reject(apiError);
  }
);

export default apiClient;



