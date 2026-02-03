-- RELEASE 데이터 삽입 쿼리 (V3.0.14)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 릴리즈 관리 데이터 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- RELEASE 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 릴리즈번호, 제목, 릴리즈유형, 상태, 내용, 요청자, 요청부서, 승인자, 예정일시, 배포일시
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/releases
-- 백엔드 객체: ReleaseService.createRelease()
-- 대상 테이블 & 컬럼: releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: ReleaseService, ReleaseRepository, UserRepository, DepartmentRepository, ApprovalService
-- 연관 DB 객체: releases 테이블, users 테이블 (requester_id, approver_id FK), departments 테이블 (requester_dept_id FK)
-- 사이드 이펙트: 릴리즈 번호 자동 생성, 승인 프로세스 연동, 배포 일정 관리
-- 프론트 연동: ReleaseCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 RELEASE 데이터 삽입 쿼리 (멱등성 보장)
-- 각 파트너의 사용자를 요청자로 하여 다양한 릴리즈 데이터 생성 (총 100개)

-- ========================================
-- REGULAR 릴리즈 - DEPLOYED (정기 배포 완료) (40개)
-- ========================================

-- 삼성그룹 정기 배포 완료 릴리즈 (10개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((row_number() OVER ())::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '반도체 공정 시스템 v2.1.0 정기 배포'
        WHEN 1 THEN '모바일 앱 보안 강화 v1.5.2 정기 배포'
        WHEN 2 THEN 'ERP 통합 시스템 v3.0.1 정기 배포'
        WHEN 3 THEN '배터리 관리 시스템 v2.3.0 정기 배포'
        WHEN 4 THEN '디스플레이 제어 시스템 v1.8.1 정기 배포'
        WHEN 5 THEN '품질 관리 시스템 v2.0.5 정기 배포'
        WHEN 6 THEN '재고 관리 시스템 v1.9.2 정기 배포'
        WHEN 7 THEN '고객 관리 시스템 v3.1.0 정기 배포'
        WHEN 8 THEN '회계 시스템 v2.2.1 정기 배포'
        ELSE '인사 관리 시스템 v1.7.3 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'DEPLOYED' as status,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '반도체 공정 효율성 개선을 위한 시스템 업데이트. 주요 변경사항: 공정 모니터링 기능 강화, 불량률 감소 알고리즘 적용, 실시간 데이터 분석 대시보드 추가'
        WHEN 1 THEN '모바일 앱 보안 취약점 패치 및 성능 개선. 주요 변경사항: OAuth 2.0 인증 강화, 데이터 암호화 적용, 로그인 속도 40% 개선'
        WHEN 2 THEN 'ERP 시스템 통합 및 워크플로우 개선. 주요 변경사항: 구매-회계 자동 연동, 결재 라인 최적화, 모바일 승인 기능 추가'
        WHEN 3 THEN '배터리 수명 예측 및 관리 기능 고도화. 주요 변경사항: AI 기반 수명 예측 모델 적용, 충전 최적화 알고리즘 개선'
        WHEN 4 THEN '디스플레이 색상 캘리브레이션 자동화. 주요 변경사항: 자동 색상 보정 기능, 품질 검사 AI 적용'
        WHEN 5 THEN '품질 검사 프로세스 자동화 및 AI 적용. 주요 변경사항: 비전 검사 정확도 95% 달성, 불량 패턴 자동 분류'
        WHEN 6 THEN '재고 최적화 및 자동 발주 시스템 구축. 주요 변경사항: 수요 예측 알고리즘 적용, 자동 발주 임계값 설정'
        WHEN 7 THEN 'CRM 고객 세분화 및 마케팅 자동화. 주요 변경사항: RFM 분석 기능 추가, 자동 캠페인 발송'
        WHEN 8 THEN '회계 마감 프로세스 자동화 및 리포트 강화. 주요 변경사항: 자동 분개 처리, 실시간 재무제표 생성'
        ELSE '인사평가 시스템 개편 및 피드백 강화. 주요 변경사항: 360도 평가 도입, 목표 관리 시스템 연동'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-01-01 00:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as scheduled_at,
    TIMESTAMP '2025-01-01 02:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'samsung-electronics@partner.com',
    'samsung-cnt@partner.com',
    'samsung-life@partner.com',
    'samsung-fire@partner.com',
    'samsung-electro@partner.com',
    'samsung-sdi@partner.com',
    'samsung-bio@partner.com',
    'samsung-engineering@partner.com',
    'samsung-heavy@partner.com',
    'samsung-techwin@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- 현대그룹 정기 배포 완료 릴리즈 (10개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((11 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '차량 생산 관리 시스템 v3.2.0 정기 배포'
        WHEN 1 THEN '스마트 팩토리 IoT 플랫폼 v2.1.5 정기 배포'
        WHEN 2 THEN '부품 조달 시스템 v1.9.0 정기 배포'
        WHEN 3 THEN '건설 현장 관리 시스템 v2.5.1 정기 배포'
        WHEN 4 THEN '물류 추적 시스템 v1.7.2 정기 배포'
        WHEN 5 THEN '품질 검사 자동화 시스템 v2.0.3 정기 배포'
        WHEN 6 THEN '정비 이력 관리 시스템 v1.6.1 정기 배포'
        WHEN 7 THEN '딜러 관리 시스템 v3.0.2 정기 배포'
        WHEN 8 THEN '철강 생산 최적화 시스템 v2.3.0 정기 배포'
        ELSE '조선 설계 시스템 v1.8.5 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'DEPLOYED' as status,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '차량 생산 라인 효율성 향상. 주요 변경사항: 실시간 생산 모니터링, 품질 이슈 자동 감지, 생산 계획 최적화 AI 적용'
        WHEN 1 THEN 'IoT 센서 데이터 수집 및 분석 고도화. 주요 변경사항: 실시간 설비 상태 모니터링, 예지 정비 알림, 에너지 효율 분석'
        WHEN 2 THEN '부품 조달 프로세스 자동화. 주요 변경사항: 자동 발주 시스템, 공급업체 평가 자동화, 납기 준수율 모니터링'
        WHEN 3 THEN '건설 현장 안전 관리 및 진행률 추적. 주요 변경사항: 드론 촬영 연동, 안전사고 위험도 분석, 공정 지연 예측'
        WHEN 4 THEN '글로벌 물류 실시간 추적 및 최적화. 주요 변경사항: GPS 기반 실시간 추적, 배송 경로 최적화, 지연 알림'
        WHEN 5 THEN 'AI 기반 자동 품질 검사 시스템. 주요 변경사항: 비전 AI 정확도 98% 달성, 불량 자동 분류, 원인 분석 리포트'
        WHEN 6 THEN '차량 정비 이력 통합 관리. 주요 변경사항: 정비 패턴 분석, 부품 교체 주기 예측, 고객 만족도 조사 자동화'
        WHEN 7 THEN '딜러 판매 및 재고 관리 통합. 주요 변경사항: 실시간 재고 현황, 판매 예측 분석, 프로모션 자동 추천'
        WHEN 8 THEN '철강 생산 공정 최적화 AI 적용. 주요 변경사항: 공정 온도 자동 조절, 불량률 감소 알고리즘, 에너지 절감 최적화'
        ELSE '조선 설계 3D 모델링 고도화. 주요 변경사항: 실시간 협업 기능, 자동 도면 생성, 설계 오류 검증'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-01-15 00:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as scheduled_at,
    TIMESTAMP '2025-01-15 02:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'hyundai-motor@partner.com',
    'kia@partner.com',
    'hyundai-mobis@partner.com',
    'hyundai-wia@partner.com',
    'hyundai-glovis@partner.com',
    'hyundai-construction@partner.com',
    'hyundai-steel@partner.com',
    'hyundai-ever@partner.com',
    'hyundai-merchant@partner.com',
    'hyundai-marine@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- SK그룹 정기 배포 완료 릴리즈 (10개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((21 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '통신 인프라 관리 시스템 v4.1.0 정기 배포'
        WHEN 1 THEN '5G 네트워크 최적화 시스템 v2.3.2 정기 배포'
        WHEN 2 THEN '고객 센터 통합 플랫폼 v3.0.1 정기 배포'
        WHEN 3 THEN '에너지 관리 시스템 v2.2.0 정기 배포'
        WHEN 4 THEN 'AI 기반 요금제 추천 시스템 v1.5.3 정기 배포'
        WHEN 5 THEN '화학 공정 제어 시스템 v2.1.1 정기 배포'
        WHEN 6 THEN '물류 센터 자동화 시스템 v1.8.0 정기 배포'
        WHEN 7 THEN '바이오 연구 데이터 관리 시스템 v2.0.2 정기 배포'
        WHEN 8 THEN '반도체 메모리 테스트 시스템 v3.2.1 정기 배포'
        ELSE '디지털 마케팅 플랫폼 v1.9.5 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'DEPLOYED' as status,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '통신 인프라 모니터링 및 장애 예측. 주요 변경사항: 실시간 네트워크 상태 모니터링, 장애 예측 AI 모델 적용'
        WHEN 1 THEN '5G 네트워크 커버리지 최적화. 주요 변경사항: 자동 기지국 파라미터 조정, 트래픽 부하 분산 알고리즘'
        WHEN 2 THEN '고객 센터 상담 효율성 향상. 주요 변경사항: AI 챗봇 고도화, 상담 이력 통합 관리, 고객 만족도 실시간 분석'
        WHEN 3 THEN '에너지 사용 최적화 및 비용 절감. 주요 변경사항: 실시간 에너지 모니터링, 피크 타임 제어, 재생 에너지 통합'
        WHEN 4 THEN 'AI 기반 개인화 요금제 추천. 주요 변경사항: 사용 패턴 분석, 맞춤형 요금제 추천, 이탈 고객 예측'
        WHEN 5 THEN '화학 공정 안전 관리 강화. 주요 변경사항: 실시간 공정 모니터링, 위험 요소 자동 감지, 비상 대응 시스템'
        WHEN 6 THEN '물류 센터 로봇 자동화 확대. 주요 변경사항: AGV 경로 최적화, 재고 실시간 추적, 피킹 효율 30% 향상'
        WHEN 7 THEN '바이오 연구 데이터 통합 관리. 주요 변경사항: 실험 데이터 자동 수집, 분석 파이프라인 구축, 협업 기능 강화'
        WHEN 8 THEN '반도체 메모리 테스트 자동화. 주요 변경사항: 테스트 시간 50% 단축, 불량 패턴 자동 분석, 수율 개선 알고리즘'
        ELSE '디지털 마케팅 캠페인 자동화. 주요 변경사항: A/B 테스트 자동화, ROI 실시간 분석, 타겟 고객 세분화'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-02-01 00:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as scheduled_at,
    TIMESTAMP '2025-02-01 02:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'sk-hynix@partner.com',
    'sk-innovation@partner.com',
    'sk-telecom@partner.com',
    'sk-square@partner.com',
    'sk-discovery@partner.com',
    'skc@partner.com',
    'sk-gas@partner.com',
    'sk-move@partner.com',
    'sk-bio@partner.com',
    'sk-on@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- LG그룹 정기 배포 완료 릴리즈 (10개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((31 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN 'OLED 생산 제어 시스템 v3.1.2 정기 배포'
        WHEN 1 THEN '가전 IoT 플랫폼 v2.5.0 정기 배포'
        WHEN 2 THEN '화학 소재 연구 시스템 v1.9.1 정기 배포'
        WHEN 3 THEN '통신 가입자 관리 시스템 v2.7.0 정기 배포'
        WHEN 4 THEN '2차 전지 품질 관리 시스템 v2.3.2 정기 배포'
        WHEN 5 THEN '스마트홈 통합 플랫폼 v3.0.5 정기 배포'
        WHEN 6 THEN '디스플레이 검사 자동화 시스템 v2.1.3 정기 배포'
        WHEN 7 THEN '클라우드 인프라 관리 시스템 v4.2.0 정기 배포'
        WHEN 8 THEN '글로벌 무역 관리 시스템 v1.8.2 정기 배포'
        ELSE '전자부품 재고 최적화 시스템 v2.0.1 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'DEPLOYED' as status,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN 'OLED 생산 수율 향상 및 품질 개선. 주요 변경사항: 공정 파라미터 자동 조정, 불량 패턴 AI 분석'
        WHEN 1 THEN 'IoT 가전 원격 제어 및 진단. 주요 변경사항: 실시간 상태 모니터링, 고장 예측, 원격 펌웨어 업데이트'
        WHEN 2 THEN '화학 소재 연구 데이터 분석 고도화. 주요 변경사항: 실험 결과 자동 분석, 소재 특성 예측 모델'
        WHEN 3 THEN '통신 가입자 이탈 방지 및 마케팅 자동화. 주요 변경사항: 이탈 예측 모델, 맞춤형 프로모션 추천'
        WHEN 4 THEN '2차 전지 품질 검사 정확도 향상. 주요 변경사항: 비전 검사 AI 적용, 불량 자동 분류, 수명 예측'
        WHEN 5 THEN '스마트홈 기기 통합 제어 및 자동화. 주요 변경사항: 음성 제어 고도화, 시나리오 자동 실행, 에너지 절감'
        WHEN 6 THEN '디스플레이 품질 검사 자동화. 주요 변경사항: 화소 결함 자동 감지, 색상 균일도 분석, 검사 시간 단축'
        WHEN 7 THEN '클라우드 리소스 자동 스케일링. 주요 변경사항: 부하 기반 자동 확장, 비용 최적화, 장애 자동 복구'
        WHEN 8 THEN '글로벌 무역 규정 준수 자동화. 주요 변경사항: 관세 자동 계산, 수출입 서류 자동 생성, 컴플라이언스 체크'
        ELSE '전자부품 재고 최적화 및 수요 예측. 주요 변경사항: AI 기반 수요 예측, 자동 발주, 재고 회전율 개선'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-02-15 00:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as scheduled_at,
    TIMESTAMP '2025-02-15 02:00:00' + (INTERVAL '1 week' * ((row_number() OVER () - 1))) as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'lg-electronics@partner.com',
    'lg-chemical@partner.com',
    'lg-display@partner.com',
    'lg-innotek@partner.com',
    'lg-uplus@partner.com',
    'lg-life@partner.com',
    'lg-cns@partner.com',
    'lg-trading@partner.com',
    'lg-energy@partner.com',
    'lg-household@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- ========================================
-- REGULAR 릴리즈 - APPROVED (정기 배포 승인됨) (25개)
-- ========================================

-- 롯데그룹 정기 배포 승인됨 릴리즈 (8개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((41 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 8
        WHEN 0 THEN '유통 POS 시스템 v2.5.0 정기 배포'
        WHEN 1 THEN '온라인몰 통합 플랫폼 v3.1.2 정기 배포'
        WHEN 2 THEN '식음료 생산 관리 시스템 v2.0.3 정기 배포'
        WHEN 3 THEN '호텔 예약 관리 시스템 v1.9.1 정기 배포'
        WHEN 4 THEN '백화점 고객 관리 시스템 v2.3.0 정기 배포'
        WHEN 5 THEN '렌탈 자산 관리 시스템 v1.7.2 정기 배포'
        WHEN 6 THEN '보험 계약 관리 시스템 v2.1.5 정기 배포'
        ELSE '식품 안전 품질 관리 시스템 v1.8.0 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'APPROVED' as status,
    CASE (row_number() OVER ()) % 8
        WHEN 0 THEN 'POS 시스템 성능 개선 및 결제 수단 추가. 주요 변경사항: 결제 속도 30% 향상, 간편결제 연동, 재고 실시간 연동'
        WHEN 1 THEN '온라인몰 개인화 추천 엔진 고도화. 주요 변경사항: AI 기반 상품 추천, 실시간 재고 반영, 배송 추적 강화'
        WHEN 2 THEN '식음료 생산 HACCP 관리 강화. 주요 변경사항: 위생 모니터링 자동화, 품질 검사 디지털화, 추적성 확보'
        WHEN 3 THEN '호텔 예약 및 고객 관리 통합. 주요 변경사항: 실시간 객실 현황, 동적 가격 책정, 멤버십 연동'
        WHEN 4 THEN '백화점 VIP 고객 맞춤 서비스. 주요 변경사항: 구매 패턴 분석, 개인화 프로모션, 포인트 통합 관리'
        WHEN 5 THEN '렌탈 자산 상태 모니터링 및 정비 관리. 주요 변경사항: GPS 기반 위치 추적, 정비 주기 알림, 수익성 분석'
        WHEN 6 THEN '보험 계약 심사 자동화 및 클레임 관리. 주요 변경사항: AI 언더라이팅, 보험금 자동 산정, 사기 탐지'
        ELSE '식품 원산지 추적 및 품질 보증. 주요 변경사항: 블록체인 기반 추적, 품질 검사 이력 관리, 리콜 자동화'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-03-01 00:00:00' + (INTERVAL '3 days' * ((row_number() OVER () - 1))) as scheduled_at,
    NULL as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'lotte-confectionery@partner.com',
    'lotte-chilsung@partner.com',
    'lotte-mart@partner.com',
    'lotte-department@partner.com',
    'lotte-hotel@partner.com',
    'lotte-food@partner.com',
    'lotte-rental@partner.com',
    'lotte-insurance@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- GS그룹 정기 배포 승인됨 릴리즈 (8개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((49 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 8
        WHEN 0 THEN '건설 프로젝트 관리 시스템 v3.0.1 정기 배포'
        WHEN 1 THEN '주유소 통합 관리 시스템 v2.2.0 정기 배포'
        WHEN 2 THEN '편의점 본부 시스템 v2.5.3 정기 배포'
        WHEN 3 THEN '홈쇼핑 방송 관리 시스템 v1.9.2 정기 배포'
        WHEN 4 THEN '에너지 거래 플랫폼 v2.1.1 정기 배포'
        WHEN 5 THEN '부동산 자산 관리 시스템 v1.8.5 정기 배포'
        WHEN 6 THEN '유통 물류 최적화 시스템 v2.3.0 정기 배포'
        ELSE '스포츠 마케팅 관리 시스템 v1.7.1 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'APPROVED' as status,
    CASE (row_number() OVER ()) % 8
        WHEN 0 THEN '건설 프로젝트 진행률 추적 및 리소스 관리. 주요 변경사항: 실시간 공정률 모니터링, 자재 발주 자동화'
        WHEN 1 THEN '주유소 재고 및 판매 실시간 관리. 주요 변경사항: 유가 변동 자동 반영, 재고 최적화, 멤버십 통합'
        WHEN 2 THEN '편의점 발주 자동화 및 재고 최적화. 주요 변경사항: AI 기반 수요 예측, 자동 발주, 폐기율 감소'
        WHEN 3 THEN '홈쇼핑 방송 스케줄 및 재고 연동. 주요 변경사항: 실시간 판매 현황, 긴급 재고 확보, 방송 효과 분석'
        WHEN 4 THEN '에너지 거래 자동화 및 시장 분석. 주요 변경사항: 실시간 가격 모니터링, 자동 거래 전략, 리스크 관리'
        WHEN 5 THEN '부동산 자산 가치 평가 및 임대 관리. 주요 변경사항: 시세 자동 업데이트, 임대료 최적화, 공실률 분석'
        WHEN 6 THEN '물류 센터 배송 최적화. 주요 변경사항: 배송 경로 최적화, 차량 적재 효율 개선, 배송 시간 단축'
        ELSE '스포츠 마케팅 캠페인 관리 및 효과 측정. 주요 변경사항: 스폰서십 ROI 분석, 팬 참여도 측정, SNS 연동'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-03-15 00:00:00' + (INTERVAL '3 days' * ((row_number() OVER () - 1))) as scheduled_at,
    NULL as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'gs-construction@partner.com',
    'gs-caltex@partner.com',
    'gs-retail@partner.com',
    'gs-shop@partner.com',
    'gs-power@partner.com',
    'gs-sports@partner.com',
    'gs-home@partner.com',
    'gs-global@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- IT 기업 정기 배포 승인됨 릴리즈 (9개)
INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((57 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 9
        WHEN 0 THEN '검색 엔진 알고리즘 v5.2.0 정기 배포'
        WHEN 1 THEN '메신저 앱 신규 기능 v3.8.1 정기 배포'
        WHEN 2 THEN '이커머스 플랫폼 v4.1.3 정기 배포'
        WHEN 3 THEN '배달 라이더 관리 시스템 v2.5.2 정기 배포'
        WHEN 4 THEN '숙박 예약 플랫폼 v2.9.0 정기 배포'
        WHEN 5 THEN '패션 커머스 큐레이션 v3.2.1 정기 배포'
        WHEN 6 THEN '중고거래 신뢰 시스템 v2.1.5 정기 배포'
        WHEN 7 THEN '온라인 교육 플랫폼 v1.8.3 정기 배포'
        ELSE '핀테크 결제 시스템 v4.0.2 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'APPROVED' as status,
    CASE (row_number() OVER ()) % 9
        WHEN 0 THEN '검색 정확도 향상 및 AI 기반 개인화. 주요 변경사항: 의미 기반 검색, 검색 의도 파악, 실시간 트렌드 반영'
        WHEN 1 THEN '메신저 화상통화 품질 개선 및 협업 기능 추가. 주요 변경사항: 4K 영상 지원, 화면 공유 최적화, 파일 전송 속도 개선'
        WHEN 2 THEN '이커머스 결제 프로세스 간소화. 주요 변경사항: 원클릭 결제, 다양한 결제 수단 추가, 환불 자동화'
        WHEN 3 THEN '배달 라이더 효율적 배차 및 안전 관리. 주요 변경사항: AI 기반 최적 경로, 실시간 날씨 연동, 사고 예방 알림'
        WHEN 4 THEN '숙박 예약 실시간 재고 및 동적 가격 책정. 주요 변경사항: 수요 예측 기반 가격 조정, 즉시 확정 예약, 리뷰 신뢰도 분석'
        WHEN 5 THEN '패션 AI 스타일 추천 고도화. 주요 변경사항: 체형 기반 추천, 트렌드 분석, 코디 자동 제안'
        WHEN 6 THEN '중고거래 사기 방지 및 안전 거래. 주요 변경사항: AI 사기 탐지, 안전 결제 시스템, 위치 기반 직거래 매칭'
        WHEN 7 THEN '온라인 교육 학습 효과 분석 및 맞춤 학습. 주요 변경사항: 학습 패턴 분석, 개인화 커리큘럼, 실시간 Q&A'
        ELSE '핀테크 보안 강화 및 간편 인증. 주요 변경사항: 생체 인증 확대, 이상 거래 탐지 AI, 분산 원장 적용'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-04-01 00:00:00' + (INTERVAL '2 days' * ((row_number() OVER () - 1))) as scheduled_at,
    NULL as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM users u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
WHERE u.email IN (
    'naver@partner.com',
    'kakao@partner.com',
    'coupang@partner.com',
    'baedal@partner.com',
    'yanolja@partner.com',
    'musinsa@partner.com',
    'danggeun@partner.com',
    'classone@partner.com',
    'toss@partner.com'
)
ON CONFLICT (release_number) DO NOTHING;

-- ========================================
-- EMERGENCY 릴리즈 - DEPLOYED (긴급 배포 완료) (20개)
-- ========================================

INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((66 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 20
        WHEN 0 THEN '보안 취약점 긴급 패치 v1.0.1'
        WHEN 1 THEN '결제 장애 긴급 수정 v2.3.5'
        WHEN 2 THEN '데이터베이스 성능 이슈 긴급 해결 v3.1.2'
        WHEN 3 THEN '인증 오류 긴급 패치 v1.5.3'
        WHEN 4 THEN '서버 메모리 누수 긴급 수정 v2.0.8'
        WHEN 5 THEN 'API 타임아웃 이슈 긴급 해결 v2.2.1'
        WHEN 6 THEN '파일 업로드 오류 긴급 패치 v1.9.4'
        WHEN 7 THEN '메일 발송 장애 긴급 수정 v3.0.6'
        WHEN 8 THEN '로그인 장애 긴급 복구 v2.5.2'
        WHEN 9 THEN '배치 작업 실패 긴급 패치 v1.7.3'
        WHEN 10 THEN '데이터 동기화 오류 긴급 수정 v2.1.5'
        WHEN 11 THEN '캐시 무효화 이슈 긴급 해결 v1.8.1'
        WHEN 12 THEN '세션 만료 오류 긴급 패치 v2.3.0'
        WHEN 13 THEN '검색 기능 장애 긴급 수정 v3.2.4'
        WHEN 14 THEN '알림 발송 실패 긴급 복구 v1.6.2'
        WHEN 15 THEN 'XSS 취약점 긴급 패치 v2.0.9'
        WHEN 16 THEN 'SQL 인젝션 방어 긴급 적용 v3.1.7'
        WHEN 17 THEN '파일 다운로드 오류 긴급 수정 v1.9.8'
        WHEN 18 THEN '트랜잭션 롤백 이슈 긴급 해결 v2.4.1'
        ELSE '외부 API 연동 장애 긴급 패치 v1.5.6'
    END as title,
    'EMERGENCY' as release_type,
    'DEPLOYED' as status,
    CASE (row_number() OVER ()) % 20
        WHEN 0 THEN '긴급 보안 취약점 발견으로 즉시 패치 배포. CVE-2025-12345 취약점 수정, 권한 검증 강화, 암호화 알고리즘 업데이트'
        WHEN 1 THEN '결제 모듈 타임아웃 이슈로 긴급 수정. PG사 연동 오류 해결, 결제 재시도 로직 개선, 모니터링 강화'
        WHEN 2 THEN '데이터베이스 커넥션 풀 고갈 문제 해결. 커넥션 수 증설, 쿼리 최적화, 인덱스 추가'
        WHEN 3 THEN 'JWT 토큰 검증 오류로 인한 인증 실패 수정. 토큰 갱신 로직 개선, 만료 시간 조정'
        WHEN 4 THEN '서버 메모리 누수로 인한 OOM 발생 해결. 메모리 프로파일링, 불필요한 객체 제거, GC 튜닝'
        WHEN 5 THEN '외부 API 타임아웃으로 인한 서비스 지연 해결. 타임아웃 설정 조정, 서킷 브레이커 적용, 재시도 로직 개선'
        WHEN 6 THEN '대용량 파일 업로드 시 메모리 부족 오류 해결. 스트리밍 업로드 적용, 파일 크기 제한 조정'
        WHEN 7 THEN 'SMTP 서버 연동 오류로 메일 발송 실패 수정. SMTP 설정 변경, 재시도 로직 추가, 큐 시스템 도입'
        WHEN 8 THEN '세션 스토어 장애로 인한 로그인 불가 해결. Redis 클러스터 복구, 세션 백업 메커니즘 적용'
        WHEN 9 THEN '야간 배치 작업 실패로 데이터 미생성 긴급 수정. 배치 로직 오류 수정, 재실행 메커니즘 추가'
        WHEN 10 THEN '마스터-슬레이브 DB 동기화 지연 해결. 복제 지연 모니터링 강화, 동기화 간격 조정'
        WHEN 11 THEN 'Redis 캐시 무효화 타이밍 이슈 수정. 캐시 키 전략 변경, TTL 조정, 무효화 로직 개선'
        WHEN 12 THEN '세션 만료 시간 불일치로 인한 오류 해결. 세션 타임아웃 설정 통일, 갱신 로직 개선'
        WHEN 13 THEN 'Elasticsearch 인덱싱 오류로 검색 불가 수정. 인덱스 재생성, 매핑 구조 개선, 동의어 사전 업데이트'
        WHEN 14 THEN 'FCM 푸시 알림 발송 실패 해결. FCM 토큰 갱신 로직 개선, 배치 발송 적용'
        WHEN 15 THEN 'XSS 취약점 발견으로 입력값 검증 강화. HTML 이스케이프 처리, CSP 헤더 적용'
        WHEN 16 THEN 'SQL 인젝션 취약점 발견으로 파라미터 바인딩 적용. PreparedStatement 전환, 입력값 검증 강화'
        WHEN 17 THEN '파일 다운로드 시 인코딩 오류 수정. Content-Disposition 헤더 수정, 파일명 인코딩 개선'
        WHEN 18 THEN '트랜잭션 롤백 실패로 데이터 불일치 해결. 트랜잭션 격리 수준 조정, 롤백 로직 강화'
        ELSE '외부 결제 API 연동 장애 긴급 대응. API 엔드포인트 변경, 재시도 로직 추가, 장애 알림 설정'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    approver.id as approver_id,
    TIMESTAMP '2025-01-10 15:00:00' + (INTERVAL '2 days' * ((row_number() OVER () - 1))) as scheduled_at,
    TIMESTAMP '2025-01-10 16:30:00' + (INTERVAL '2 days' * ((row_number() OVER () - 1))) as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    LIMIT 20
) u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
CROSS JOIN LATERAL (
    SELECT u2.* FROM users u2 
    WHERE u2.email = 'admin@company.com'
    LIMIT 1
) approver
ON CONFLICT (release_number) DO NOTHING;

-- ========================================
-- REGULAR 릴리즈 - REQUESTED (정기 배포 요청됨) (10개)
-- ========================================

INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((86 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '고객 데이터 분석 플랫폼 v2.0.0 정기 배포'
        WHEN 1 THEN 'AI 챗봇 고도화 v3.1.0 정기 배포'
        WHEN 2 THEN '모바일 앱 UI/UX 개선 v2.5.0 정기 배포'
        WHEN 3 THEN '통합 리포팅 시스템 v1.8.0 정기 배포'
        WHEN 4 THEN '공급망 관리 시스템 v2.3.0 정기 배포'
        WHEN 5 THEN '품질 관리 대시보드 v1.9.0 정기 배포'
        WHEN 6 THEN '인사평가 시스템 개편 v3.0.0 정기 배포'
        WHEN 7 THEN '재무 분석 플랫폼 v2.1.0 정기 배포'
        WHEN 8 THEN '마케팅 자동화 시스템 v1.7.0 정기 배포'
        ELSE 'IT 자산 관리 시스템 v2.2.0 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'REQUESTED' as status,
    CASE (row_number() OVER ()) % 10
        WHEN 0 THEN '고객 행동 분석 및 세분화 고도화 예정. 계획: RFM 분석 자동화, 고객 생애가치 예측, 이탈 고객 분석 대시보드'
        WHEN 1 THEN 'AI 챗봇 자연어 이해 능력 향상 예정. 계획: GPT-4 기반 대화 모델 적용, 다국어 지원 확대, 감정 분석 기능 추가'
        WHEN 2 THEN '모바일 앱 사용자 경험 개선 예정. 계획: 다크모드 지원, 접근성 개선, 애니메이션 최적화, 로딩 시간 단축'
        WHEN 3 THEN '통합 리포팅 자동화 및 실시간 대시보드 구축 예정. 계획: 실시간 데이터 반영, 커스텀 리포트 생성, 자동 배포'
        WHEN 4 THEN '공급망 가시성 확보 및 리스크 관리 강화 예정. 계획: 실시간 추적, 공급업체 평가 자동화, 수요 예측'
        WHEN 5 THEN '품질 관리 실시간 모니터링 및 예측 분석 예정. 계획: 불량률 실시간 추적, AI 기반 불량 예측, 원인 분석'
        WHEN 6 THEN '인사평가 프로세스 디지털화 및 피드백 강화 예정. 계획: 연속 피드백 시스템, OKR 관리, 역량 평가 자동화'
        WHEN 7 THEN '재무 데이터 통합 분석 및 예측 모델 구축 예정. 계획: 재무비율 자동 계산, 예산 대비 실적 분석, 손익 예측'
        WHEN 8 THEN '마케팅 캠페인 자동화 및 ROI 측정 예정. 계획: 멀티채널 캠페인 관리, A/B 테스트 자동화, 전환율 분석'
        ELSE 'IT 자산 라이프사이클 관리 자동화 예정. 계획: 자산 취득부터 폐기까지 자동 추적, 감가상각 자동 계산, 정비 일정 관리'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    NULL as approver_id,
    TIMESTAMP '2025-05-01 00:00:00' + (INTERVAL '3 days' * ((row_number() OVER () - 1))) as scheduled_at,
    NULL as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id DESC
    LIMIT 10
) u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
ON CONFLICT (release_number) DO NOTHING;

-- ========================================
-- EMERGENCY 릴리즈 - CANCELLED (긴급 배포 취소됨) (5개)
-- ========================================

INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((96 + (row_number() OVER () - 1))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '긴급 보안 패치 v1.2.3 (취소됨)'
        WHEN 1 THEN '결제 오류 긴급 수정 v2.1.1 (취소됨)'
        WHEN 2 THEN '데이터 마이그레이션 긴급 작업 (취소됨)'
        WHEN 3 THEN 'API 장애 긴급 복구 v3.0.5 (취소됨)'
        ELSE '인증 시스템 긴급 패치 v1.9.2 (취소됨)'
    END as title,
    'EMERGENCY' as release_type,
    'CANCELLED' as status,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '보안 취약점 긴급 패치 예정이었으나 오탐으로 판명되어 취소. 추가 검증 결과 취약점이 존재하지 않음을 확인'
        WHEN 1 THEN '결제 오류로 긴급 배포 예정이었으나 근본 원인이 PG사 측 이슈로 확인되어 취소. PG사에서 자체 해결'
        WHEN 2 THEN '데이터 마이그레이션 긴급 작업 예정이었으나 영향도 분석 결과 정기 배포로 변경. 추가 테스트 필요'
        WHEN 3 THEN 'API 장애 긴급 복구 예정이었으나 일시적 네트워크 이슈로 확인되어 취소. 자동 복구됨'
        ELSE '인증 시스템 긴급 패치 예정이었으나 기존 버전에서 정상 동작 확인되어 취소. 재현 불가 이슈로 판명'
    END as content,
    u.id as requester_id,
    d.id as requester_dept_id,
    NULL as approver_id,
    TIMESTAMP '2025-01-20 14:00:00' + (INTERVAL '1 day' * ((row_number() OVER () - 1))) as scheduled_at,
    NULL as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email IN (
        'naver@partner.com',
        'kakao@partner.com',
        'coupang@partner.com',
        'toss@partner.com',
        'yanolja@partner.com'
    )
) u
CROSS JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.name = 'IT개발팀'
    LIMIT 1
) d
ON CONFLICT (release_number) DO NOTHING;

-- 4. RELEASE 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- RELEASE 데이터 건수 확인
SELECT COUNT(*) as release_count FROM releases;

-- RELEASE 번호 중복 검증
SELECT release_number, COUNT(*) as duplicate_count 
FROM releases 
GROUP BY release_number 
HAVING COUNT(*) > 1;

-- 요청자 존재 검증
SELECT r.release_number, r.requester_id, u.email
FROM releases r
LEFT JOIN users u ON r.requester_id = u.id
WHERE u.id IS NULL;

-- 승인자 존재 검증 (NULL 허용)
SELECT r.release_number, r.approver_id, u.email
FROM releases r
LEFT JOIN users u ON r.approver_id = u.id
WHERE r.approver_id IS NOT NULL AND u.id IS NULL;

-- 릴리즈 유형별 통계
SELECT release_type, status, COUNT(*) as count
FROM releases
GROUP BY release_type, status
ORDER BY release_type, status;

-- 릴리즈 상태별 통계
SELECT 
    status,
    COUNT(*) as count,
    ROUND(COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM releases) * 100, 2) as percentage
FROM releases
GROUP BY status
ORDER BY count DESC;

-- 배포 완료율 분석
SELECT 
    release_type,
    COUNT(*) as total,
    SUM(CASE WHEN status = 'DEPLOYED' THEN 1 ELSE 0 END) as deployed,
    ROUND(SUM(CASE WHEN status = 'DEPLOYED' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*) * 100, 2) as deployment_rate
FROM releases
GROUP BY release_type;

-- 요청자별 릴리즈 건수
SELECT 
    u.email as requester_email,
    COUNT(r.id) as release_count,
    STRING_AGG(DISTINCT r.release_type, ', ' ORDER BY r.release_type) as release_types,
    STRING_AGG(DISTINCT r.status, ', ' ORDER BY r.status) as statuses
FROM releases r
JOIN users u ON r.requester_id = u.id
GROUP BY u.email
HAVING COUNT(r.id) > 0
ORDER BY release_count DESC
LIMIT 20;

-- 월별 릴리즈 예정 통계
SELECT 
    TO_CHAR(scheduled_at, 'YYYY-MM') as month,
    COUNT(*) as scheduled_releases,
    SUM(CASE WHEN status = 'DEPLOYED' THEN 1 ELSE 0 END) as deployed,
    SUM(CASE WHEN status = 'APPROVED' THEN 1 ELSE 0 END) as approved,
    SUM(CASE WHEN status = 'REQUESTED' THEN 1 ELSE 0 END) as requested,
    SUM(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) as cancelled
FROM releases
WHERE scheduled_at IS NOT NULL
GROUP BY TO_CHAR(scheduled_at, 'YYYY-MM')
ORDER BY month;

-- 긴급 릴리즈 분석
SELECT 
    COUNT(*) as emergency_count,
    AVG(EXTRACT(EPOCH FROM (deployed_at - scheduled_at))/3600) as avg_deploy_hours,
    MIN(deployed_at - scheduled_at) as min_deploy_time,
    MAX(deployed_at - scheduled_at) as max_deploy_time
FROM releases
WHERE release_type = 'EMERGENCY' AND deployed_at IS NOT NULL;

-- RELEASE 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 총 100개의 RELEASE 데이터를 생성하였습니다.
-- 모든 RELEASE는 파트너 사용자를 요청자로 연계되어 있으며, 다양한 유형과 상태로 구성되어 있습니다.
-- RELEASE 번호 중복 검증 및 요청자/승인자 존재 검증을 통해 데이터 무결성을 보장합니다.
-- 모든 RELEASE는 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - release_type: 'EMERGENCY'(긴급), 'REGULAR'(정기)
--   - status: 'REQUESTED'(요청됨), 'APPROVED'(승인됨), 'DEPLOYED'(배포됨), 'CANCELLED'(취소됨)
-- 
-- 릴리즈 구성:
--   - REGULAR + DEPLOYED: 40개 (정기 배포 완료)
--   - REGULAR + APPROVED: 25개 (정기 배포 승인됨)
--   - EMERGENCY + DEPLOYED: 20개 (긴급 배포 완료)
--   - REGULAR + REQUESTED: 10개 (정기 배포 요청됨)
--   - EMERGENCY + CANCELLED: 5개 (긴급 배포 취소됨)
--   - 총 100개의 다양한 릴리즈로 실제 배포 관리 환경을 시뮬레이션
--   - 릴리즈 번호: REL2501-0001 ~ REL2501-0100
--   - 배포 시간대, 승인 프로세스, 긴급/정기 구분 등 실제 운영 환경 반영
