-- 프로젝트 데이터 삽입 쿼리 (V3.0.11)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 프로젝트 1개씩 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- 프로젝트 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 프로젝트명, 프로젝트코드, 파트너, 시작일, 종료일, 상태, 유형
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/projects
-- 백엔드 객체: ProjectService.createProject()
-- 대상 테이블 & 컬럼: projects (name, code, project_type, status, start_date, end_date, company_id, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: ProjectService, ProjectRepository, PartnerRepository, NumberingService
-- 연관 DB 객체: projects 테이블, partners 테이블 (company_id FK)
-- 사이드 이펙트: 프로젝트 코드 자동 생성, 파트너 존재 검증
-- 프론트 연동: ProjectCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 프로젝트 데이터 삽입 쿼리 (멱등성 보장)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 각 파트너당 1개씩 총 83개의 프로젝트 데이터를 생성하였습니다.

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- 프로젝트 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 프로젝트명, 프로젝트코드, 파트너, 시작일, 종료일, 상태, 유형
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/projects
-- 백엔드 객체: ProjectService.createProject()
-- 대상 테이블 & 컬럼: projects (name, code, project_type, status, start_date, end_date, company_id, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: ProjectService, ProjectRepository, PartnerRepository, NumberingService
-- 연관 DB 객체: projects 테이블, partners 테이블 (company_id FK)
-- 사이드 이펙트: 프로젝트 코드 자동 생성, 파트너 존재 검증
-- 프론트 연동: ProjectCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 프로젝트 데이터 삽입 쿼리 (멱등성 보장)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 각 파트너당 1개씩 총 83개의 프로젝트 데이터를 생성하였습니다.

-- 삼성그룹 파트너 기준 프로젝트 생성
-- PAR002: 삼성전자 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ001' as code,
    '삼성전자 반도체 공정 개선 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-01' as start_date,
    '2025-12-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR002'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR004: 삼성생명 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ003' as code,
    '삼성생명 디지털 보험 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-01' as start_date,
    '2025-10-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR004'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR005: 삼성화재 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ004' as code,
    '삼성화재 디지털 손해사정 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-01' as start_date,
    '2025-09-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR005'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR006: 삼성전기 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ005' as code,
    '삼성전기 고성능 MLCC 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-01' as start_date,
    '2025-08-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR006'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR007: 삼성SDI 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ006' as code,
    '삼성SDI 차세대 배터리 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-01' as start_date,
    '2025-07-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR007'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR008: 삼성바이오로직스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ007' as code,
    '삼성바이오로직스 바이오의약품 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-01' as start_date,
    '2025-06-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR008'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR009: 삼성엔지니어링 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ008' as code,
    '삼성엔지니어링 스마트 플랜트 구축 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-01' as start_date,
    '2025-05-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR009'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 현대자동차그룹 파트너 기준 프로젝트 생성
-- PAR010: 현대자동차 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ009' as code,
    '현대자동차 전기차 플랫폼 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-15' as start_date,
    '2025-12-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR010'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR011: 기아 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ010' as code,
    '기아 디지털 콕핏 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-15' as start_date,
    '2025-11-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR011'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR012: 현대모비스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ011' as code,
    '현대모비스 차량용 소프트웨어 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-15' as start_date,
    '2025-10-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR012'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR013: 현대위아 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ012' as code,
    '현대위아 스마트 공장 자동화 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-15' as start_date,
    '2025-09-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR013'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR014: 현대글로비스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ013' as code,
    '현대글로비스 스마트 물류 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-15' as start_date,
    '2025-08-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR014'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR015: 현대건설 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ014' as code,
    '현대건설 스마트 시티 구축 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-15' as start_date,
    '2025-07-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR015'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR016: 현대제철 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ015' as code,
    '현대제철 스마트 제철 공정 개선 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-15' as start_date,
    '2025-06-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR016'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR017: 현대오토에버 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ016' as code,
    '현대오토에버 자동차 소프트웨어 개발 플랫폼' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-15' as start_date,
    '2025-05-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR017'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- SK그룹 파트너 기준 프로젝트 생성
-- PAR018: SK하이닉스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ017' as code,
    'SK하이닉스 차세대 메모리 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-20' as start_date,
    '2025-12-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR018'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR019: SK이노베이션 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ018' as code,
    'SK이노베이션 친환경 에너지 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-20' as start_date,
    '2025-11-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR019'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR020: SK텔레콤 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ019' as code,
    'SK텔레콤 5G 네트워크 최적화 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-20' as start_date,
    '2025-10-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR020'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR021: SK스퀘어 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ020' as code,
    'SK스퀘어 반도체 투자 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-20' as start_date,
    '2025-09-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR021'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR022: SK디스커버리 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ021' as code,
    'SK디스커버리 신사업 발굴 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-20' as start_date,
    '2025-08-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR022'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR023: SKC 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ022' as code,
    'SKC 친환경 소재 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-20' as start_date,
    '2025-07-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR023'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR024: SK가스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ023' as code,
    'SK가스 스마트 가스 관리 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-20' as start_date,
    '2025-06-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR024'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR025: SK엔무브 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ024' as code,
    'SK엔무브 모빌리티 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-20' as start_date,
    '2025-05-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR025'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- LG그룹 파트너 기준 프로젝트 생성
-- PAR026: LG전자 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ025' as code,
    'LG전자 AI 가전 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-25' as start_date,
    '2025-12-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR026'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR027: LG화학 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ026' as code,
    'LG화학 바이오소재 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-25' as start_date,
    '2025-11-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR027'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR028: LG디스플레이 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ027' as code,
    'LG디스플레이 차세대 디스플레이 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-25' as start_date,
    '2025-10-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR028'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR029: LG이노텍 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ028' as code,
    'LG이노텍 차량용 센서 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-25' as start_date,
    '2025-09-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR029'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR030: LG유플러스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ029' as code,
    'LG유플러스 IoT 서비스 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-25' as start_date,
    '2025-08-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR030'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR031: LG생활건강 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ030' as code,
    'LG생활건강 스마트 코스메틱 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-25' as start_date,
    '2025-07-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR031'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR032: LG CNS 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ031' as code,
    'LG CNS 클라우드 보안 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-25' as start_date,
    '2025-06-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR032'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR033: LG상사 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ032' as code,
    'LG상사 글로벌 무역 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-25' as start_date,
    '2025-05-25' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR033'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 롯데그룹 파트너 기준 프로젝트 생성
-- PAR034: 롯데제과 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ033' as code,
    '롯데제과 스마트 제조 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-30' as start_date,
    '2025-12-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR034'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR035: 롯데칠성음료 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ034' as code,
    '롯데칠성음료 스마트 물류 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-01' as start_date,
    '2025-11-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR035'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR036: 롯데마트 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ035' as code,
    '롯데마트 디지털 매장 관리 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-30' as start_date,
    '2025-10-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR036'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR037: 롯데백화점 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ036' as code,
    '롯데백화점 스마트 쇼핑 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-01' as start_date,
    '2025-09-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR037'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR038: 롯데호텔 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ037' as code,
    '롯데호텔 스마트 투숙 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-30' as start_date,
    '2025-08-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR038'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR039: 롯데푸드 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ038' as code,
    '롯데푸드 스마트 생산 관리 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-30' as start_date,
    '2025-07-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR039'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR040: 롯데렌탈 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ039' as code,
    '롯데렌탈 차량 관리 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-30' as start_date,
    '2025-06-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR040'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR041: 롯데손해보험 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ040' as code,
    '롯데손해보험 디지털 보험 서비스 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-30' as start_date,
    '2025-05-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR041'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- GS그룹 파트너 기준 프로젝트 생성
-- PAR042: GS칼텍스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ041' as code,
    'GS칼텍스 스마트 에너지 관리 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-10' as start_date,
    '2025-12-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR042'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR043: GS리테일 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ042' as code,
    'GS리테일 편의점 디지털 전환 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-10' as start_date,
    '2025-11-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR043'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR044: GS건설 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ043' as code,
    'GS건설 스마트 건설 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-10' as start_date,
    '2025-10-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR044'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR045: GS글로벌 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ044' as code,
    'GS글로벌 무역 플랫폼 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-10' as start_date,
    '2025-09-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR045'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR046: GS EPS 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ045' as code,
    'GS EPS 에너지 솔루션 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-10' as start_date,
    '2025-08-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR046'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR047: GS네오텍 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ046' as code,
    'GS네오텍 스마트 팩토리 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-10' as start_date,
    '2025-07-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR047'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR048: GS수퍼마켓 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ047' as code,
    'GS수퍼마켓 디지털 매장 관리 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-10' as start_date,
    '2025-06-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR048'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR049: GS홈쇼핑 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ048' as code,
    'GS홈쇼핑 모바일 쇼핑 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-10' as start_date,
    '2025-05-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR049'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 한화그룹 파트너 기준 프로젝트 생성
-- PAR050: 한화솔루션 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ049' as code,
    '한화솔루션 태양광 에너지 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-05' as start_date,
    '2025-12-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR050'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR051: 한화에어로스페이스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ050' as code,
    '한화에어로스페이스 항공우주 소프트웨어 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-05' as start_date,
    '2025-11-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR051'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR052: 한화시스템 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ051' as code,
    '한화시스템 국방 IT 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-05' as start_date,
    '2025-10-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR052'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR053: 한화에너지 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ052' as code,
    '한화에너지 스마트 그리드 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-05' as start_date,
    '2025-09-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR053'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR054: 한화생명 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ053' as code,
    '한화생명 디지털 보험 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-05' as start_date,
    '2025-08-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR054'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR055: 한화손해보험 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ054' as code,
    '한화손해보험 인슈어테크 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-05' as start_date,
    '2025-07-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR055'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR056: 한화투자증권 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ055' as code,
    '한화투자증권 모바일 트레이딩 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-05' as start_date,
    '2025-06-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR056'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR057: 한화자산운용 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ056' as code,
    '한화자산운용 로보어드바이저 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-05' as start_date,
    '2025-05-05' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR057'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 대우그룹 파트너 기준 프로젝트 생성
-- PAR058: 대우조선해양 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ057' as code,
    '대우조선해양 스마트 조선소 구축 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-12' as start_date,
    '2025-12-12' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR058'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR059: 대우건설 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ058' as code,
    '대우건설 스마트 건설 기술 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-12' as start_date,
    '2025-11-12' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR059'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR060: 대우산업 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ059' as code,
    '대우산업 스마트 공장 자동화 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-12' as start_date,
    '2025-10-12' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR060'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR061: 대우중공업 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ060' as code,
    '대우중공업 대형 설비 제어 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-12' as start_date,
    '2025-09-12' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR061'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR062: 대우조선 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ061' as code,
    '대우조선 선박 설계 자동화 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-12' as start_date,
    '2025-08-12' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR062'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR063: 대우해양 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ062' as code,
    '대우해양 해양 구조물 설계 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-12' as start_date,
    '2025-07-12' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR063'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 한진그룹 파트너 기준 프로젝트 생성
-- PAR064: 대한항공 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ063' as code,
    '대한항공 스마트 항공기 관리 시스템 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-08' as start_date,
    '2025-12-08' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR064'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR065: 한진 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ064' as code,
    '한진 스마트 물류 네트워크 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-08' as start_date,
    '2025-11-08' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR065'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR066: 한진칼 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ065' as code,
    '한진칼 항공 IT 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-08' as start_date,
    '2025-10-08' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR066'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR067: 대한통운 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ066' as code,
    '대한통운 실시간 배송 추적 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-08' as start_date,
    '2025-09-08' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR067'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR068: 한진중공업 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ067' as code,
    '한진중공업 대형 크레인 제어 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-08' as start_date,
    '2025-08-08' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR068'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR069: 한진해운 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ068' as code,
    '한진해운 선박 운항 최적화 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-08' as start_date,
    '2025-07-08' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR069'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 기타 파트너 기준 프로젝트 생성
-- PAR070: GCDC 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ069' as code,
    'GCDC ITMS 개발 플랫폼 구축' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-01' as start_date,
    '2025-12-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR070'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR071: 디플럭스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ070' as code,
    '디플럭스 AI 솔루션 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-01' as start_date,
    '2025-11-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR071'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR072: 잔소프트 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ071' as code,
    '잔소프트 ERP 시스템 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-01' as start_date,
    '2025-10-31' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR072'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR073: 진커뮤니케이션 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ072' as code,
    '진커뮤니케이션 통신 인프라 구축 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-01' as start_date,
    '2025-09-30' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR073'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 12. 추가 파트너 기업 기준 프로젝트 생성
-- PAR074: 네이버 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ073' as code,
    '네이버 AI 검색 엔진 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-15' as start_date,
    '2025-12-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR074'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR075: 카카오 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ074' as code,
    '카카오 모빌리티 플랫폼 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-15' as start_date,
    '2025-11-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR075'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR076: 쿠팡 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ075' as code,
    '쿠팡 물류 자동화 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-15' as start_date,
    '2025-10-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR076'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR077: 배달의민족 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ076' as code,
    '배달의민족 스마트 주문 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-15' as start_date,
    '2025-09-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR077'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR078: 야놀자 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ077' as code,
    '야놀자 숙박 플랫폼 AI 최적화 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-15' as start_date,
    '2025-08-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR078'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR079: 무신사 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ078' as code,
    '무신사 패션 AI 추천 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-15' as start_date,
    '2025-07-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR079'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR080: 당근마켓 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ079' as code,
    '당근마켓 중고거래 AI 매칭 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-15' as start_date,
    '2025-06-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR080'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR081: 요기요 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ080' as code,
    '요기요 실시간 배달 최적화 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-15' as start_date,
    '2025-05-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR081'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR082: 라인 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ081' as code,
    '라인 메신저 AI 챗봇 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-20' as start_date,
    '2025-12-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR082'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR083: 토스 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ082' as code,
    '토스 핀테크 보안 시스템 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-20' as start_date,
    '2025-11-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR083'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 추가 파트너 기업 기준 프로젝트 생성 (18개)
-- PAR084: 애플 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ083' as code,
    '애플 차세대 iOS 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-10' as start_date,
    '2025-12-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR084'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR085: 마이크로소프트 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ084' as code,
    '마이크로소프트 Azure 클라우드 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-10' as start_date,
    '2025-11-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR085'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR086: 아마존 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ085' as code,
    '아마존 AWS 인프라 최적화 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-10' as start_date,
    '2025-10-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR086'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR087: 구글 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ086' as code,
    '구글 안드로이드 AI 기능 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-10' as start_date,
    '2025-09-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR087'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR088: 메타 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ087' as code,
    '메타 메타버스 플랫폼 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-10' as start_date,
    '2025-08-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR088'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR089: IBM 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ088' as code,
    'IBM 왓슨 AI 비즈니스 솔루션 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-10' as start_date,
    '2025-07-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR089'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR090: 오라클 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ089' as code,
    '오라클 데이터베이스 클라우드 전환 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-10' as start_date,
    '2025-06-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR090'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR091: 인텔 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ090' as code,
    '인텔 차세대 프로세서 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-10' as start_date,
    '2025-05-10' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR091'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR092: AMD 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ091' as code,
    'AMD GPU 성능 최적화 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-15' as start_date,
    '2025-12-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR092'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR093: NVIDIA 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ092' as code,
    'NVIDIA AI 가속기 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-02-15' as start_date,
    '2025-11-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR093'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR094: 퀄컴 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ093' as code,
    '퀄컴 5G 모뎀 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-03-15' as start_date,
    '2025-10-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR094'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR095: 소니 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ094' as code,
    '소니 게임 콘솔 차세대 엔진 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-04-15' as start_date,
    '2025-09-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR095'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR096: 닌텐도 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ095' as code,
    '닌텐도 모바일 게임 플랫폼 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-05-15' as start_date,
    '2025-08-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR096'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR097: 마이크로소프트 게임 스튜디오 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ096' as code,
    'MS 게임 스튜디오 클라우드 게임 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-06-15' as start_date,
    '2025-07-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR097'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR098: EA 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ097' as code,
    'EA 스포츠 게임 AI 개선 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-07-15' as start_date,
    '2025-06-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR098'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR099: 유비소프트 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ098' as code,
    '유비소프트 오픈월드 게임 엔진 개발' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-08-15' as start_date,
    '2025-05-15' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR099'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- PAR100: 블리자드 파트너
INSERT INTO projects (code, name, project_type, status, start_date, end_date, company_id, created_by, updated_by)
SELECT 
    'PROJ099' as code,
    '블리자드 e스포츠 플랫폼 개발 프로젝트' as name,
    'SI' as project_type,
    'IN_PROGRESS' as status,
    '2025-01-20' as start_date,
    '2025-12-20' as end_date,
    p.id as company_id,
    'system' as created_by,
    'system' as updated_by
FROM partners p 
WHERE p.code = 'PAR100'
LIMIT 1
ON CONFLICT (code) DO NOTHING;

-- 4. 프로젝트 코드 자동 생성을 위한 시퀀스 초기화 쿼리
-- NumberingService에서 사용하는 프로젝트 코드 시퀀스 초기화
-- 기존에 삽입된 최대 프로젝트 코드를 기반으로 시퀀스 값 설정

-- 프로젝트 코드 시퀀스 값 확인 및 업데이트 쿼리
WITH max_project_code AS (
    SELECT MAX(CAST(SUBSTRING(code, 5) AS INTEGER)) as max_code_num
    FROM projects
    WHERE code LIKE 'PROJ%'
)
UPDATE projects 
SET code = 'PROJ' || LPAD((SELECT max_code_num + 1 FROM max_project_code)::TEXT, 3, '0')
WHERE id IN (
    SELECT id FROM projects 
    WHERE code IS NULL OR code = ''
    LIMIT 1
);

-- 5. 프로젝트 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- 프로젝트 데이터 건수 확인
SELECT COUNT(*) as project_count FROM projects;

-- 프로젝트 코드 중복 검증
SELECT code, COUNT(*) as duplicate_count 
FROM projects 
GROUP BY code 
HAVING COUNT(*) > 1;

-- 파트너 존재 검증
SELECT p.code, p.name, p.company_id, par.name as partner_name
FROM projects p
LEFT JOIN partners par ON p.company_id = par.id
WHERE par.id IS NULL;

-- 프로젝트 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 각 파트너당 1개씩 총 83개의 프로젝트 데이터를 생성하였습니다.
-- 모든 프로젝트는 해당 파트너와 연계된 실제 산업군에 맞는 프로젝트명으로 구성되어 있습니다.
-- 프로젝트 코드 중복 검증 및 파트너 존재 검증을 통해 데이터 무결
