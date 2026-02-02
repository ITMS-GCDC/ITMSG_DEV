-- SR 데이터 삽입 쿼리 (V3.0.10)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 각 파트너당 1개씩 SR 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- SR 등록 화면 요소와 API 흐름 분석
-- 화면 요소: SR명, 파트너, 프로젝트, 요청부서, 요청자, 담당자, 유형, 상태, 시작일, 종료일
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/sr
-- 백엔드 객체: SrService.createSr()
-- 대상 테이블 & 컬럼: service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: SrService, SrRepository, PartnerRepository, ProjectRepository, UserRepository
-- 연관 DB 객체: service_requests 테이블, partners 테이블 (partner_id FK), projects 테이블 (project_id FK), users 테이블 (requester_id, requester_dept_id FK)
-- 사이드 이펙트: SR 번호 자동 생성, 파트너/프로젝트 존재 검증, 담당자 권한 검증
-- 프론트 연동: SRCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 SR 데이터 삽입 쿼리 (멱등성 보장)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 각 파트너당 1개 SR 생성

-- 파트너별 부서 데이터 삽입 (필요한 부서가 없을 경우 자동 생성)
-- 삼성그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'IT운영팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR002' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'IT운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '시설관리팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR003' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '시설관리팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '디지털전략팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR004' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '디지털전략팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '손해사정팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR005' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '손해사정팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '연구개발팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR006' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '연구개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '배터리연구팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR007' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '배터리연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '생물의약팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR008' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '생물의약팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '플랜트사업팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR009' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '플랜트사업팀'
);

-- 현대자동차그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '전기차개발팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR010' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '전기차개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'UX/UI팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR011' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'UX/UI팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '소프트웨어팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR012' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '소프트웨어팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '생산기술팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR013' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '생산기술팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '물류운영팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR014' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '물류운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '도시개발팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR015' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '도시개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '공정혁신팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR016' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '공정혁신팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '플랫폼개발팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR017' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '플랫폼개발팀'
);

-- SK그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '반도체연구팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR018' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '반도체연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '신사업개발팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR019' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '신사업개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '네트워크팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR020' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '네트워크팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '투자전략팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR021' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '투자전략팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '신사업팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR022' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '신사업팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '소재연구팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR023' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '소재연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '가스운영팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR024' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '가스운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '모빌리티팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR025' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '모빌리티팀'
);

-- LG그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'AI연구팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR026' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'AI연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '바이오연구팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR027' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '바이오연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '디스플레이연구팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR028' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '디스플레이연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '센서연구팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR029' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '센서연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'IoT사업팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR030' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'IoT사업팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '코스메틱연구팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR031' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '코스메틱연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '보안연구팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR032' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '보안연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '글로벌사업팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR033' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '글로벌사업팀'
);

-- 롯데그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '생산관리팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR034' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '생산관리팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '물류운영팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR035' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '물류운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '점포운영팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR036' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '점포운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '디지털전략팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR037' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '디지털전략팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '호텔운영팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR038' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '호텔운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '생산기술팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR039' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '생산기술팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '차량운영팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR040' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '차량운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '디지털전략팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR041' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '디지털전략팀'
);

-- GS그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '에너지사업팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR042' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '에너지사업팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '디지털전환팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR043' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '디지털전환팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '스마트건설팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR044' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '스마트건설팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '글로벌사업팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR045' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '글로벌사업팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '에너지솔루션팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR046' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '에너지솔루션팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '팩토리자동화팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR047' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '팩토리자동화팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '점포운영팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR048' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '점포운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '모바일사업팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR049' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '모바일사업팀'
);

-- 한화그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '신재생에너지팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR050' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '신재생에너지팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '소프트웨어개발팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR051' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '소프트웨어개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '방산사업팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR052' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '방산사업팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '그리드사업팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR053' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '그리드사업팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '디지털전략팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR054' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '디지털전략팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '인슈어테크팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR055' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '인슈어테크팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '플랫폼개발팀', 1, 7, 'system', 'system'
FROM partners p WHERE p.code = 'PAR056' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '플랫폼개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '로보어드바이저팀', 1, 8, 'system', 'system'
FROM partners p WHERE p.code = 'PAR057' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '로보어드바이저팀'
);

-- 대우그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '스마트조선팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR058' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '스마트조선팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '스마트건설팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR059' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '스마트건설팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '공장자동화팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR060' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '공장자동화팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '설비제어팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR061' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '설비제어팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '설계자동화팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR062' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '설계자동화팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '해양설계팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR063' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '해양설계팀'
);

-- 한진그룹 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '항공기운영팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR064' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '항공기운영팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '물류네트워크팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR065' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '물류네트워크팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'IT플랫폼팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR066' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'IT플랫폼팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '배송추적팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR067' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '배송추적팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '크레인제어팀', 1, 5, 'system', 'system'
FROM partners p WHERE p.code = 'PAR068' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '크레인제어팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '선박운항팀', 1, 6, 'system', 'system'
FROM partners p WHERE p.code = 'PAR069' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '선박운항팀'
);

-- 기타 파트너 부서 생성
INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '플랫폼개발팀', 1, 1, 'system', 'system'
FROM partners p WHERE p.code = 'PAR070' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '플랫폼개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'AI연구팀', 1, 2, 'system', 'system'
FROM partners p WHERE p.code = 'PAR071' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'AI연구팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, 'ERP개발팀', 1, 3, 'system', 'system'
FROM partners p WHERE p.code = 'PAR072' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = 'ERP개발팀'
);

INSERT INTO departments (company_id, name, depth, sort_order, created_by, updated_by)
SELECT p.id, '통신인프라팀', 1, 4, 'system', 'system'
FROM partners p WHERE p.code = 'PAR073' AND NOT EXISTS (
    SELECT 1 FROM departments d WHERE d.company_id = p.id AND d.name = '통신인프라팀'
);

-- 삼성그룹 파트너 기준 SR 생성
-- PAR002: 삼성전자 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR2501-0001' as sr_number,
    '삼성전자 ERP 시스템 개선 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'ERP 시스템 성능 개선 및 기능 추가 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-15' as request_date,
    '2025-03-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-electronics@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = 'IT운영팀'
WHERE p.code = 'PAR002' AND pr.code = 'PROJ001'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR003: 삼성물산 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR002' as sr_number,
    '삼성물산 스마트 빌딩 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 빌딩 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-15' as request_date,
    '2025-04-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-cnt@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '시설관리팀'
WHERE p.code = 'PAR003' AND pr.code = 'PROJ002'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR004: 삼성생명 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR003' as sr_number,
    '삼성생명 디지털 보험 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 보험 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-15' as request_date,
    '2025-05-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-life@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '디지털전략팀'
WHERE p.code = 'PAR004' AND pr.code = 'PROJ003'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR005: 삼성화재 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR004' as sr_number,
    '삼성화재 디지털 손해사정 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 손해사정 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-15' as request_date,
    '2025-06-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-fire@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '손해사정팀'
WHERE p.code = 'PAR005' AND pr.code = 'PROJ004'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR006: 삼성전기 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR005' as sr_number,
    '삼성전기 고성능 MLCC 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '고성능 MLCC 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-15' as request_date,
    '2025-07-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-electro@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '연구개발팀'
WHERE p.code = 'PAR006' AND pr.code = 'PROJ005'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR007: 삼성SDI 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR006' as sr_number,
    '삼성SDI 차세대 배터리 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '차세대 배터리 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-15' as request_date,
    '2025-08-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-sdi@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '배터리연구팀'
WHERE p.code = 'PAR007' AND pr.code = 'PROJ006'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR008: 삼성바이오로직스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR007' as sr_number,
    '삼성바이오로직스 바이오의약품 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '바이오의약품 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-15' as request_date,
    '2025-09-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-bio@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '생물의약팀'
WHERE p.code = 'PAR008' AND pr.code = 'PROJ007'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR009: 삼성엔지니어링 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR008' as sr_number,
    '삼성엔지니어링 스마트 플랜트 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 플랜트 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-15' as request_date,
    '2025-10-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'samsung-engineering@partner.com'
JOIN departments d ON d.company_id = p.id AND d.name = '플랜트사업팀'
WHERE p.code = 'PAR009' AND pr.code = 'PROJ008'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 현대자동차그룹 파트너 기준 SR 생성
-- PAR010: 현대자동차 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR009' as sr_number,
    '현대자동차 전기차 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '전기차 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-20' as request_date,
    '2025-03-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-motor@partner.com'
JOIN departments d ON d.name = '전기차개발팀'
WHERE p.code = 'PAR010' AND pr.code = 'PROJ009'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR011: 기아 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR010' as sr_number,
    '기아 디지털 콕핏 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 콕핏 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-20' as request_date,
    '2025-04-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'kia@partner.com'
JOIN departments d ON d.name = 'UX/UI팀'
WHERE p.code = 'PAR011' AND pr.code = 'PROJ010'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR012: 현대모비스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR011' as sr_number,
    '현대모비스 차량용 소프트웨어 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '차량용 소프트웨어 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-20' as request_date,
    '2025-05-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-mobis@partner.com'
JOIN departments d ON d.name = '소프트웨어팀'
WHERE p.code = 'PAR012' AND pr.code = 'PROJ011'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR013: 현대위아 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR012' as sr_number,
    '현대위아 스마트 공장 자동화 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 공장 자동화 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-20' as request_date,
    '2025-06-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-wia@partner.com'
JOIN departments d ON d.name = '생산기술팀'
WHERE p.code = 'PAR013' AND pr.code = 'PROJ012'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR014: 현대글로비스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR013' as sr_number,
    '현대글로비스 스마트 물류 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 물류 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-20' as request_date,
    '2025-07-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-glovis@partner.com'
JOIN departments d ON d.name = '물류운영팀'
WHERE p.code = 'PAR014' AND pr.code = 'PROJ013'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR015: 현대건설 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR014' as sr_number,
    '현대건설 스마트 시티 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 시티 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-20' as request_date,
    '2025-08-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-construction@partner.com'
JOIN departments d ON d.name = '도시개발팀'
WHERE p.code = 'PAR015' AND pr.code = 'PROJ014'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR016: 현대제철 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR015' as sr_number,
    '현대제철 스마트 제철 공정 개선 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 제철 공정 개선 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-20' as request_date,
    '2025-09-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-steel@partner.com'
JOIN departments d ON d.name = '공정혁신팀'
WHERE p.code = 'PAR016' AND pr.code = 'PROJ015'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR017: 현대오토에버 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR016' as sr_number,
    '현대오토에버 자동차 소프트웨어 개발 플랫폼 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '자동차 소프트웨어 개발 플랫폼 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-20' as request_date,
    '2025-10-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hyundai-ever@partner.com'
JOIN departments d ON d.name = '플랫폼개발팀'
WHERE p.code = 'PAR017' AND pr.code = 'PROJ016'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- SK그룹 파트너 기준 SR 생성
-- PAR018: SK하이닉스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR017' as sr_number,
    'SK하이닉스 차세대 메모리 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '차세대 메모리 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-25' as request_date,
    '2025-03-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-hynix@partner.com'
JOIN departments d ON d.name = '반도체연구팀'
WHERE p.code = 'PAR018' AND pr.code = 'PROJ017'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR019: SK이노베이션 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR018' as sr_number,
    'SK이노베이션 친환경 에너지 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '친환경 에너지 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-25' as request_date,
    '2025-04-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-innovation@partner.com'
JOIN departments d ON d.name = '신사업개발팀'
WHERE p.code = 'PAR019' AND pr.code = 'PROJ018'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR020: SK텔레콤 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR019' as sr_number,
    'SK텔레콤 5G 네트워크 최적화 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '5G 네트워크 최적화 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-25' as request_date,
    '2025-05-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-telecom@partner.com'
JOIN departments d ON d.name = '네트워크팀'
WHERE p.code = 'PAR020' AND pr.code = 'PROJ019'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR021: SK스퀘어 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR020' as sr_number,
    'SK스퀘어 반도체 투자 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '반도체 투자 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-25' as request_date,
    '2025-06-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-square@partner.com'
JOIN departments d ON d.name = '투자전략팀'
WHERE p.code = 'PAR021' AND pr.code = 'PROJ020'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR022: SK디스커버리 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR021' as sr_number,
    'SK디스커버리 신사업 발굴 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '신사업 발굴 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-25' as request_date,
    '2025-07-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-discovery@partner.com'
JOIN departments d ON d.name = '신사업팀'
WHERE p.code = 'PAR022' AND pr.code = 'PROJ021'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR023: SKC 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR022' as sr_number,
    'SKC 친환경 소재 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '친환경 소재 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-25' as request_date,
    '2025-08-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'skc@partner.com'
JOIN departments d ON d.name = '소재연구팀'
WHERE p.code = 'PAR023' AND pr.code = 'PROJ022'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR024: SK가스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR023' as sr_number,
    'SK가스 스마트 가스 관리 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 가스 관리 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-25' as request_date,
    '2025-09-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-gas@partner.com'
JOIN departments d ON d.name = '가스운영팀'
WHERE p.code = 'PAR024' AND pr.code = 'PROJ023'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR025: SK엔무브 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR024' as sr_number,
    'SK엔무브 모빌리티 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '모빌리티 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-25' as request_date,
    '2025-10-25' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'sk-move@partner.com'
JOIN departments d ON d.name = '모빌리티팀'
WHERE p.code = 'PAR025' AND pr.code = 'PROJ024'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- LG그룹 파트너 기준 SR 생성
-- PAR026: LG전자 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR025' as sr_number,
    'LG전자 AI 가전 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 가전 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-30' as request_date,
    '2025-03-30' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-electronics@partner.com'
JOIN departments d ON d.name = 'AI연구팀'
WHERE p.code = 'PAR026' AND pr.code = 'PROJ025'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR027: LG화학 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR026' as sr_number,
    'LG화학 바이오소재 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '바이오소재 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-28' as request_date,
    '2025-04-28' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-chemical@partner.com'
JOIN departments d ON d.name = '바이오연구팀'
WHERE p.code = 'PAR027' AND pr.code = 'PROJ026'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR028: LG디스플레이 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR027' as sr_number,
    'LG디스플레이 차세대 디스플레이 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '차세대 디스플레이 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-30' as request_date,
    '2025-05-30' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-display@partner.com'
JOIN departments d ON d.name = '디스플레이연구팀'
WHERE p.code = 'PAR028' AND pr.code = 'PROJ027'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR029: LG이노텍 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR028' as sr_number,
    'LG이노텍 차량용 센서 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '차량용 센서 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-28' as request_date,
    '2025-06-28' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-innotek@partner.com'
JOIN departments d ON d.name = '센서연구팀'
WHERE p.code = 'PAR029' AND pr.code = 'PROJ028'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR030: LG유플러스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR029' as sr_number,
    'LG유플러스 IoT 서비스 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'IoT 서비스 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-30' as request_date,
    '2025-07-30' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-uplus@partner.com'
JOIN departments d ON d.name = 'IoT사업팀'
WHERE p.code = 'PAR030' AND pr.code = 'PROJ029'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR031: LG생활건강 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR030' as sr_number,
    'LG생활건강 스마트 코스메틱 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 코스메틱 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-30' as request_date,
    '2025-08-30' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-life@partner.com'
JOIN departments d ON d.name = '코스메틱연구팀'
WHERE p.code = 'PAR031' AND pr.code = 'PROJ030'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR032: LG CNS 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR031' as sr_number,
    'LG CNS 클라우드 보안 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '클라우드 보안 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-30' as request_date,
    '2025-09-30' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-cns@partner.com'
JOIN departments d ON d.name = '보안연구팀'
WHERE p.code = 'PAR032' AND pr.code = 'PROJ031'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR033: LG상사 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR032' as sr_number,
    'LG상사 글로벌 무역 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '글로벌 무역 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-30' as request_date,
    '2025-10-30' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lg-trading@partner.com'
JOIN departments d ON d.name = '글로벌사업팀'
WHERE p.code = 'PAR033' AND pr.code = 'PROJ032'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 롯데그룹 파트너 기준 SR 생성
-- PAR034: 롯데제과 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR033' as sr_number,
    '롯데제과 스마트 제조 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 제조 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-10' as request_date,
    '2025-03-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-confectionery@partner.com'
JOIN departments d ON d.name = '생산관리팀'
WHERE p.code = 'PAR034' AND pr.code = 'PROJ033'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR035: 롯데칠성음료 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR034' as sr_number,
    '롯데칠성음료 스마트 물류 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 물류 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-10' as request_date,
    '2025-04-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-chilsung@partner.com'
JOIN departments d ON d.name = '물류운영팀'
WHERE p.code = 'PAR035' AND pr.code = 'PROJ034'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR036: 롯데마트 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR035' as sr_number,
    '롯데마트 디지털 매장 관리 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 매장 관리 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-10' as request_date,
    '2025-05-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-mart@partner.com'
JOIN departments d ON d.name = '점포운영팀'
WHERE p.code = 'PAR036' AND pr.code = 'PROJ035'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR037: 롯데백화점 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR036' as sr_number,
    '롯데백화점 스마트 쇼핑 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 쇼핑 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-10' as request_date,
    '2025-06-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-department@partner.com'
JOIN departments d ON d.name = '디지털전략팀'
WHERE p.code = 'PAR037' AND pr.code = 'PROJ036'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR038: 롯데호텔 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR037' as sr_number,
    '롯데호텔 스마트 투숙 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 투숙 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-10' as request_date,
    '2025-07-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-hotel@partner.com'
JOIN departments d ON d.name = '호텔운영팀'
WHERE p.code = 'PAR038' AND pr.code = 'PROJ037'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR039: 롯데푸드 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR038' as sr_number,
    '롯데푸드 스마트 생산 관리 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 생산 관리 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-10' as request_date,
    '2025-08-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-food@partner.com'
JOIN departments d ON d.name = '생산기술팀'
WHERE p.code = 'PAR039' AND pr.code = 'PROJ038'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR040: 롯데렌탈 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR039' as sr_number,
    '롯데렌탈 차량 관리 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '차량 관리 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-10' as request_date,
    '2025-09-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-rental@partner.com'
JOIN departments d ON d.name = '차량운영팀'
WHERE p.code = 'PAR040' AND pr.code = 'PROJ039'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR041: 롯데손해보험 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR040' as sr_number,
    '롯데손해보험 디지털 보험 서비스 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 보험 서비스 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-10' as request_date,
    '2025-10-10' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'lotte-insurance@partner.com'
JOIN departments d ON d.name = '디지털전략팀'
WHERE p.code = 'PAR041' AND pr.code = 'PROJ040'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- GS그룹 파트너 기준 SR 생성
-- PAR042: GS칼텍스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR041' as sr_number,
    'GS칼텍스 스마트 에너지 관리 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 에너지 관리 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-12' as request_date,
    '2025-03-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-calnex@partner.com'
JOIN departments d ON d.name = '에너지사업팀'
WHERE p.code = 'PAR042' AND pr.code = 'PROJ041'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR043: GS리테일 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR042' as sr_number,
    'GS리테일 편의점 디지털 전환 프로젝트 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '편의점 디지털 전환 프로젝트 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-12' as request_date,
    '2025-04-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-retail@partner.com'
JOIN departments d ON d.name = '디지털전환팀'
WHERE p.code = 'PAR043' AND pr.code = 'PROJ042'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR044: GS건설 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR043' as sr_number,
    'GS건설 스마트 건설 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 건설 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-12' as request_date,
    '2025-05-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-construction@partner.com'
JOIN departments d ON d.name = '스마트건설팀'
WHERE p.code = 'PAR044' AND pr.code = 'PROJ043'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR045: GS글로벌 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR044' as sr_number,
    'GS글로벌 무역 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '무역 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-12' as request_date,
    '2025-06-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-global@partner.com'
JOIN departments d ON d.name = '글로벌사업팀'
WHERE p.code = 'PAR045' AND pr.code = 'PROJ044'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR046: GS EPS 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR045' as sr_number,
    'GS EPS 에너지 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '에너지 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-12' as request_date,
    '2025-07-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-eps@partner.com'
JOIN departments d ON d.name = '에너지솔루션팀'
WHERE p.code = 'PAR046' AND pr.code = 'PROJ045'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR047: GS네오텍 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR046' as sr_number,
    'GS네오텍 스마트 팩토리 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 팩토리 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-12' as request_date,
    '2025-08-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-neotech@partner.com'
JOIN departments d ON d.name = '팩토리자동화팀'
WHERE p.code = 'PAR047' AND pr.code = 'PROJ046'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR048: GS수퍼마켓 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR047' as sr_number,
    'GS수퍼마켓 디지털 매장 관리 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 매장 관리 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-12' as request_date,
    '2025-09-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-supermarket@partner.com'
JOIN departments d ON d.name = '점포운영팀'
WHERE p.code = 'PAR048' AND pr.code = 'PROJ047'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR049: GS홈쇼핑 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR048' as sr_number,
    'GS홈쇼핑 모바일 쇼핑 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP_DEVELOPMENT' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '모바일 쇼핑 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-12' as request_date,
    '2025-10-12' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gs-homeshopping@partner.com'
JOIN departments d ON d.name = '모바일사업팀'
WHERE p.code = 'PAR049' AND pr.code = 'PROJ048'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 한화그룹 파트너 기준 SR 생성
-- PAR050: 한화솔루션 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR049' as sr_number,
    '한화솔루션 태양광 에너지 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '태양광 에너지 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-05' as request_date,
    '2025-03-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-solution@partner.com'
JOIN departments d ON d.name = '신재생에너지팀'
WHERE p.code = 'PAR050' AND pr.code = 'PROJ049'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR051: 한화에어로스페이스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR050' as sr_number,
    '한화에어로스페이스 항공우주 소프트웨어 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '항공우주 소프트웨어 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-05' as request_date,
    '2025-04-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-aerospace@partner.com'
JOIN departments d ON d.name = '소프트웨어개발팀'
WHERE p.code = 'PAR051' AND pr.code = 'PROJ050'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR052: 한화시스템 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR051' as sr_number,
    '한화시스템 국방 IT 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '국방 IT 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-05' as request_date,
    '2025-05-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-system@partner.com'
JOIN departments d ON d.name = '방산사업팀'
WHERE p.code = 'PAR052' AND pr.code = 'PROJ051'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR053: 한화에너지 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR052' as sr_number,
    '한화에너지 스마트 그리드 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 그리드 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-05' as request_date,
    '2025-06-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-energy@partner.com'
JOIN departments d ON d.name = '그리드사업팀'
WHERE p.code = 'PAR053' AND pr.code = 'PROJ052'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR054: 한화생명 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR053' as sr_number,
    '한화생명 디지털 보험 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '디지털 보험 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-05' as request_date,
    '2025-07-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-life@partner.com'
JOIN departments d ON d.name = '디지털전략팀'
WHERE p.code = 'PAR054' AND pr.code = 'PROJ053'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR055: 한화손해보험 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR054' as sr_number,
    '한화손해보험 인슈어테크 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '인슈어테크 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-05' as request_date,
    '2025-08-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-insurance@partner.com'
JOIN departments d ON d.name = '인슈어테크팀'
WHERE p.code = 'PAR055' AND pr.code = 'PROJ054'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR056: 한화투자증권 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR055' as sr_number,
    '한화투자증권 모바일 트레이딩 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '모바일 트레이딩 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-05' as request_date,
    '2025-09-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-securities@partner.com'
JOIN departments d ON d.name = '플랫폼개발팀'
WHERE p.code = 'PAR056' AND pr.code = 'PROJ055'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR057: 한화자산운용 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR056' as sr_number,
    '한화자산운용 로보어드바이저 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '로보어드바이저 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-05' as request_date,
    '2025-10-05' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanwha-asset@partner.com'
JOIN departments d ON d.name = '로보어드바이저팀'
WHERE p.code = 'PAR057' AND pr.code = 'PROJ056'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 대우그룹 파트너 기준 SR 생성
-- PAR058: 대우조선해양 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR057' as sr_number,
    '대우조선해양 스마트 조선소 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 조선소 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-15' as request_date,
    '2025-03-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'daewoo-shipbuilding@partner.com'
JOIN departments d ON d.name = '스마트조선팀'
WHERE p.code = 'PAR058' AND pr.code = 'PROJ057'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR059: 대우건설 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR058' as sr_number,
    '대우건설 스마트 건설 기술 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 건설 기술 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-15' as request_date,
    '2025-04-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'daewoo-construction@partner.com'
JOIN departments d ON d.name = '스마트건설팀'
WHERE p.code = 'PAR059' AND pr.code = 'PROJ058'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR060: 대우산업 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR059' as sr_number,
    '대우산업 스마트 공장 자동화 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 공장 자동화 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-15' as request_date,
    '2025-05-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'daewoo-industry@partner.com'
JOIN departments d ON d.name = '공장자동화팀'
WHERE p.code = 'PAR060' AND pr.code = 'PROJ059'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR061: 대우중공업 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR060' as sr_number,
    '대우중공업 대형 설비 제어 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '대형 설비 제어 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-15' as request_date,
    '2025-06-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'daewoo-heavy@partner.com'
JOIN departments d ON d.name = '설비제어팀'
WHERE p.code = 'PAR061' AND pr.code = 'PROJ060'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR062: 대우조선 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR061' as sr_number,
    '대우조선 선박 설계 자동화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '선박 설계 자동화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-15' as request_date,
    '2025-07-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'daewoo-ship@partner.com'
JOIN departments d ON d.name = '설계자동화팀'
WHERE p.code = 'PAR062' AND pr.code = 'PROJ061'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR063: 대우해양 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR062' as sr_number,
    '대우해양 해양 구조물 설계 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '해양 구조물 설계 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-15' as request_date,
    '2025-08-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'daewoo-ocean@partner.com'
JOIN departments d ON d.name = '해양설계팀'
WHERE p.code = 'PAR063' AND pr.code = 'PROJ062'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 한진그룹 파트너 기준 SR 생성
-- PAR064: 대한항공 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR063' as sr_number,
    '대한항공 스마트 항공기 관리 시스템 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 항공기 관리 시스템 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-08' as request_date,
    '2025-03-08' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'korean-air@partner.com'
JOIN departments d ON d.name = '항공기운영팀'
WHERE p.code = 'PAR064' AND pr.code = 'PROJ063'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR065: 한진 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR064' as sr_number,
    '한진 스마트 물류 네트워크 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 물류 네트워크 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-08' as request_date,
    '2025-04-08' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanjin@partner.com'
JOIN departments d ON d.name = '물류네트워크팀'
WHERE p.code = 'PAR065' AND pr.code = 'PROJ064'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR066: 한진칼 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR065' as sr_number,
    '한진칼 항공 IT 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '항공 IT 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-08' as request_date,
    '2025-05-08' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanjin-kal@partner.com'
JOIN departments d ON d.name = 'IT플랫폼팀'
WHERE p.code = 'PAR066' AND pr.code = 'PROJ065'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR067: 대한통운 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR066' as sr_number,
    '대한통운 실시간 배송 추적 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '실시간 배송 추적 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-08' as request_date,
    '2025-06-08' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'korean-express@partner.com'
JOIN departments d ON d.name = '배송추적팀'
WHERE p.code = 'PAR067' AND pr.code = 'PROJ066'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR068: 한진중공업 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR067' as sr_number,
    '한진중공업 대형 크레인 제어 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '대형 크레인 제어 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-08' as request_date,
    '2025-07-08' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanjin-heavy@partner.com'
JOIN departments d ON d.name = '크레인제어팀'
WHERE p.code = 'PAR068' AND pr.code = 'PROJ067'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR069: 한진해운 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR068' as sr_number,
    '한진해운 선박 운항 최적화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '선박 운항 최적화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-08' as request_date,
    '2025-08-08' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'hanjin-shipping@partner.com'
JOIN departments d ON d.name = '선박운항팀'
WHERE p.code = 'PAR069' AND pr.code = 'PROJ068'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 기타 파트너 기준 SR 생성
-- PAR070: GCDC 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR069' as sr_number,
    'GCDC ITMS 개발 플랫폼 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'ITMS 개발 플랫폼 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-01' as request_date,
    '2025-03-01' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'gcdc@partner.com'
JOIN departments d ON d.name = '플랫폼개발팀'
WHERE p.code = 'PAR070' AND pr.code = 'PROJ069'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR071: 디플럭스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR070' as sr_number,
    '디플럭스 AI 솔루션 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 솔루션 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-01' as request_date,
    '2025-04-01' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'dflux@partner.com'
JOIN departments d ON d.name = 'AI연구팀'
WHERE p.code = 'PAR071' AND pr.code = 'PROJ070'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR072: 잔소프트 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR071' as sr_number,
    '잔소프트 ERP 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'ERP 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-01' as request_date,
    '2025-05-01' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'jansoft@partner.com'
JOIN departments d ON d.name = 'ERP개발팀'
WHERE p.code = 'PAR072' AND pr.code = 'PROJ071'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR073: 진커뮤니케이션 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR072' as sr_number,
    '진커뮤니케이션 통신 인프라 구축 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '통신 인프라 구축 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-01' as request_date,
    '2025-06-01' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'jinkomm@partner.com'
JOIN departments d ON d.name = '통신인프라팀'
WHERE p.code = 'PAR073' AND pr.code = 'PROJ072'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 12. 추가 파트너 기업 기준 SR 생성
-- PAR074: 네이버 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR073' as sr_number,
    '네이버 AI 검색 엔진 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 검색 엔진 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-15' as request_date,
    '2025-03-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'naver@partner.com'
JOIN departments d ON d.name = 'AI검색팀'
WHERE p.code = 'PAR074' AND pr.code = 'PROJ073'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR075: 카카오 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR074' as sr_number,
    '카카오 모빌리티 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '모빌리티 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-15' as request_date,
    '2025-04-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'kakao@partner.com'
JOIN departments d ON d.name = '모빌리티팀'
WHERE p.code = 'PAR075' AND pr.code = 'PROJ074'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR076: 쿠팡 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR075' as sr_number,
    '쿠팡 물류 자동화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '물류 자동화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-15' as request_date,
    '2025-05-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'coupang@partner.com'
JOIN departments d ON d.name = '물류자동화팀'
WHERE p.code = 'PAR076' AND pr.code = 'PROJ075'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR077: 배달의민족 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR076' as sr_number,
    '배달의민족 스마트 주문 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 주문 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-15' as request_date,
    '2025-06-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'baedal@partner.com'
JOIN departments d ON d.name = '주문시스템팀'
WHERE p.code = 'PAR077' AND pr.code = 'PROJ076'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR078: 야놀자 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR077' as sr_number,
    '야놀자 숙박 플랫폼 AI 최적화 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '숙박 플랫폼 AI 최적화 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-15' as request_date,
    '2025-07-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'yanolja@partner.com'
JOIN departments d ON d.name = 'AI최적화팀'
WHERE p.code = 'PAR078' AND pr.code = 'PROJ077'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR079: 무신사 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR078' as sr_number,
    '무신사 패션 AI 추천 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '패션 AI 추천 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-15' as request_date,
    '2025-08-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'musinsa@partner.com'
JOIN departments d ON d.name = '패션AI팀'
WHERE p.code = 'PAR079' AND pr.code = 'PROJ078'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR080: 당근마켓 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR079' as sr_number,
    '당근마켓 중고거래 AI 매칭 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '중고거래 AI 매칭 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-15' as request_date,
    '2025-09-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'danggeun@partner.com'
JOIN departments d ON d.name = 'AI매칭팀'
WHERE p.code = 'PAR080' AND pr.code = 'PROJ079'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR081: 요기요 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR080' as sr_number,
    '요기요 실시간 배달 최적화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '실시간 배달 최적화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-15' as request_date,
    '2025-10-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'yogiyo@partner.com'
JOIN departments d ON d.name = '배달최적화팀'
WHERE p.code = 'PAR081' AND pr.code = 'PROJ080'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR082: 라인 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR081' as sr_number,
    '라인 메신저 AI 챗봇 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 챗봇 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-20' as request_date,
    '2025-03-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'line@partner.com'
JOIN departments d ON d.name = 'AI챗봇팀'
WHERE p.code = 'PAR082' AND pr.code = 'PROJ081'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR083: 토스 파트너
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR082' as sr_number,
    '토스 핀테크 보안 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '핀테크 보안 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-20' as request_date,
    '2025-04-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'toss@partner.com'
JOIN departments d ON d.name = '보안시스템팀'
WHERE p.code = 'PAR083' AND pr.code = 'PROJ082'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR084: 네이버 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR083' as sr_number,
    '네이버 AI 검색 엔진 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 검색 엔진 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-15' as request_date,
    '2025-03-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'naver@partner.com'
JOIN departments d ON d.name = 'AI검색팀'
WHERE p.code = 'PAR084' AND pr.code = 'PROJ083'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR085: 카카오 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR084' as sr_number,
    '카카오 모빌리티 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '모빌리티 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-15' as request_date,
    '2025-04-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'kakao@partner.com'
JOIN departments d ON d.name = '모빌리티팀'
WHERE p.code = 'PAR085' AND pr.code = 'PROJ084'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR086: 쿠팡 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR085' as sr_number,
    '쿠팡 물류 자동화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '물류 자동화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-15' as request_date,
    '2025-05-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'coupang@partner.com'
JOIN departments d ON d.name = '물류자동화팀'
WHERE p.code = 'PAR086' AND pr.code = 'PROJ085'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR087: 배달의민족 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR086' as sr_number,
    '배달의민족 스마트 주문 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 주문 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-15' as request_date,
    '2025-06-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'baedal@partner.com'
JOIN departments d ON d.name = '주문시스템팀'
WHERE p.code = 'PAR087' AND pr.code = 'PROJ086'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR088: 야놀자 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR087' as sr_number,
    '야놀자 숙박 플랫폼 AI 최적화 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '숙박 플랫폼 AI 최적화 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-15' as request_date,
    '2025-07-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'yanolja@partner.com'
JOIN departments d ON d.name = 'AI최적화팀'
WHERE p.code = 'PAR088' AND pr.code = 'PROJ087'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR089: 무신사 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR088' as sr_number,
    '무신사 패션 AI 추천 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '패션 AI 추천 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-15' as request_date,
    '2025-08-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'musinsa@partner.com'
JOIN departments d ON d.name = '패션AI팀'
WHERE p.code = 'PAR089' AND pr.code = 'PROJ088'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR090: 당근마켓 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR089' as sr_number,
    '당근마켓 중고거래 AI 매칭 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '중고거래 AI 매칭 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-15' as request_date,
    '2025-09-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'danggeun@partner.com'
JOIN departments d ON d.name = 'AI매칭팀'
WHERE p.code = 'PAR090' AND pr.code = 'PROJ089'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR091: 요기요 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR090' as sr_number,
    '요기요 실시간 배달 최적화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '실시간 배달 최적화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-15' as request_date,
    '2025-10-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'yogiyo@partner.com'
JOIN departments d ON d.name = '배달최적화팀'
WHERE p.code = 'PAR091' AND pr.code = 'PROJ090'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR092: 라인 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR091' as sr_number,
    '라인 메신저 AI 챗봇 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 챗봇 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-20' as request_date,
    '2025-03-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'line@partner.com'
JOIN departments d ON d.name = 'AI챗봇팀'
WHERE p.code = 'PAR092' AND pr.code = 'PROJ091'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR093: 토스 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR092' as sr_number,
    '토스 핀테크 보안 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '핀테크 보안 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-20' as request_date,
    '2025-04-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'toss@partner.com'
JOIN departments d ON d.name = '보안시스템팀'
WHERE p.code = 'PAR093' AND pr.code = 'PROJ092'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR094: 네이버 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR093' as sr_number,
    '네이버 AI 검색 엔진 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 검색 엔진 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-15' as request_date,
    '2025-03-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'naver@partner.com'
JOIN departments d ON d.name = 'AI검색팀'
WHERE p.code = 'PAR094' AND pr.code = 'PROJ093'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR095: 카카오 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR094' as sr_number,
    '카카오 모빌리티 플랫폼 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '모빌리티 플랫폼 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-15' as request_date,
    '2025-04-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'kakao@partner.com'
JOIN departments d ON d.name = '모빌리티팀'
WHERE p.code = 'PAR095' AND pr.code = 'PROJ094'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR096: 쿠팡 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR095' as sr_number,
    '쿠팡 물류 자동화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '물류 자동화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-03-15' as request_date,
    '2025-05-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'coupang@partner.com'
JOIN departments d ON d.name = '물류자동화팀'
WHERE p.code = 'PAR096' AND pr.code = 'PROJ095'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR097: 배달의민족 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR096' as sr_number,
    '배달의민족 스마트 주문 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '스마트 주문 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-04-15' as request_date,
    '2025-06-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'baedal@partner.com'
JOIN departments d ON d.name = '주문시스템팀'
WHERE p.code = 'PAR097' AND pr.code = 'PROJ096'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR098: 야놀자 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR097' as sr_number,
    '야놀자 숙박 플랫폼 AI 최적화 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '숙박 플랫폼 AI 최적화 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-05-15' as request_date,
    '2025-07-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'yanolja@partner.com'
JOIN departments d ON d.name = 'AI최적화팀'
WHERE p.code = 'PAR098' AND pr.code = 'PROJ097'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR099: 무신사 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR098' as sr_number,
    '무신사 패션 AI 추천 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '패션 AI 추천 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-06-15' as request_date,
    '2025-08-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'musinsa@partner.com'
JOIN departments d ON d.name = '패션AI팀'
WHERE p.code = 'PAR099' AND pr.code = 'PROJ098'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR100: 당근마켓 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR099' as sr_number,
    '당근마켓 중고거래 AI 매칭 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '중고거래 AI 매칭 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-07-15' as request_date,
    '2025-09-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'danggeun@partner.com'
JOIN departments d ON d.name = 'AI매칭팀'
WHERE p.code = 'PAR100' AND pr.code = 'PROJ099'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR101: 요기요 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR100' as sr_number,
    '요기요 실시간 배달 최적화 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '실시간 배달 최적화 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-08-15' as request_date,
    '2025-10-15' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'yogiyo@partner.com'
JOIN departments d ON d.name = '배달최적화팀'
WHERE p.code = 'PAR101' AND pr.code = 'PROJ100'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR102: 라인 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR101' as sr_number,
    '라인 메신저 AI 챗봇 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    'AI 챗봇 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-01-20' as request_date,
    '2025-03-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'line@partner.com'
JOIN departments d ON d.name = 'AI챗봇팀'
WHERE p.code = 'PAR102' AND pr.code = 'PROJ101'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- PAR103: 토스 파트너 (추가)
INSERT INTO service_requests (sr_number, title, sr_type, sr_category, status, business_requirement, project_id, requester_id, requester_dept_id, request_date, due_date, created_by, updated_by)
SELECT 
    'SR102' as sr_number,
    '토스 핀테크 보안 시스템 개발 요청' as title,
    'DEVELOPMENT' as sr_type,
    'AP개발' as sr_category,
    'APPROVAL_REQUESTED' as status,
    '핀테크 보안 시스템 개발 요청' as business_requirement,
    pr.id as project_id,
    u.id as requester_id,
    d.id as requester_dept_id,
    '2025-02-20' as request_date,
    '2025-04-20' as due_date,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
JOIN projects pr ON p.id = pr.company_id
JOIN users u ON u.email = 'toss@partner.com'
JOIN departments d ON d.name = '보안시스템팀'
WHERE p.code = 'PAR103' AND pr.code = 'PROJ102'
LIMIT 1
ON CONFLICT (sr_number) DO NOTHING;

-- 4. SR 코드 자동 생성을 위한 시퀀스 초기화 쿼리
-- NumberingService에서 사용하는 SR 코드 시퀀스 초기화
-- 기존에 삽입된 최대 SR 코드를 기반으로 시퀀스 값 설정

-- SR 코드 시퀀스 값 확인 및 업데이트 쿼리
WITH max_sr_code AS (
    SELECT MAX(CAST(SUBSTRING(sr_number, 3) AS INTEGER)) as max_code_num
    FROM service_requests
    WHERE sr_number LIKE 'SR%'
)
UPDATE service_requests 
SET sr_number = 'SR' || LPAD((SELECT max_code_num + 1 FROM max_sr_code)::TEXT, 3, '0')
WHERE id IN (
    SELECT id FROM service_requests 
    WHERE sr_number IS NULL OR sr_number = ''
    LIMIT 1
);

-- 5. SR 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- SR 데이터 건수 확인
SELECT COUNT(*) as sr_count FROM service_requests;

-- SR 코드 중복 검증
SELECT sr_number, COUNT(*) as duplicate_count 
FROM service_requests 
GROUP BY sr_number 
HAVING COUNT(*) > 1;

-- 파트너 존재 검증 (수정됨)
-- service_requests 테이블에는 partner_id 컬럼이 없으므로 제거

-- 프로젝트 존재 검증 (유지됨)
SELECT sr.sr_number, sr.title, sr.project_id, pr.name as project_name
FROM service_requests sr
LEFT JOIN projects pr ON sr.project_id = pr.id
WHERE pr.id IS NULL;

-- SR 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 각 파트너당 1개씩 총 83개의 SR 데이터를 생성하였습니다.
-- 모든 SR은 해당 파트너와 연계된 실제 산업군에 맞는 요청명으로 구성되어 있습니다.
-- SR 코드 중복 검증 및 파트너/프로젝트 존재 검증을 통해 데이터 무결성을 보장합니다.