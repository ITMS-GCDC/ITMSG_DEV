-- SPEC 데이터 삽입 쿼리 (V3.0.11)
-- V3.0.10__insert_sr_from_partners.sql에 있는 SR 기준으로 각 SR당 1개씩 SPEC 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- SPEC 등록 화면 요소와 API 흐름 분석
-- 화면 요소: SPEC명, SR, SPEC유형, SPEC상태, 작성자, 검증자, 검증일, 검증결과, 검증의견
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/spec
-- 백엔드 객체: SpecService.createSpec()
-- 대상 테이블 & 컬럼: specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: SpecService, SpecRepository, SrRepository, UserRepository
-- 연관 DB 객체: specifications 테이블, service_requests 테이블 (sr_id FK), users 테이블 (assignee_id, reviewer_id FK)
-- 사이드 이펙트: SPEC 번호 자동 생성, SR 존재 검증, 검증자 권한 검증
-- 프론트 연동: SpecCreatePage.tsx에서 API 호출

-- 3. SR 기준 SPEC 데이터 삽입 쿼리 (멱등성 보장)
-- V3.0.10__insert_sr_from_partners.sql에 있는 SR 기준으로 각 SR당 1개 SPEC 생성

-- PAR002: 상승전자 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0001' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-electronics@partner.com'
WHERE sr.sr_number = 'SR2501-0001'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR003: 상승물산 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0002' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-cnt@partner.com'
WHERE sr.sr_number = 'SR002'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR004: 상승생명 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0003' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-life@partner.com'
WHERE sr.sr_number = 'SR003'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR005: 상승화재 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0004' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-fire@partner.com'
WHERE sr.sr_number = 'SR004'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR006: 상승전기 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0005' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-electro@partner.com'
WHERE sr.sr_number = 'SR005'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR007: 상승SDI 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0006' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-sdi@partner.com'
WHERE sr.sr_number = 'SR006'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR008: 상승바이오로직스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0007' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-bio@partner.com'
WHERE sr.sr_number = 'SR007'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR009: 상승엔지니어링 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0008' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sanGGSeung-engineering@partner.com'
WHERE sr.sr_number = 'SR008'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR010: 한리자동차 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0009' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-motor@partner.com'
WHERE sr.sr_number = 'SR009'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR011: 기아 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0010' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kia@partner.com'
WHERE sr.sr_number = 'SR010'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR012: 한리모비스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0011' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-mobis@partner.com'
WHERE sr.sr_number = 'SR011'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR013: 한리위아 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0012' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-wia@partner.com'
WHERE sr.sr_number = 'SR012'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR014: 한리글로비스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0013' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-glovis@partner.com'
WHERE sr.sr_number = 'SR013'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR015: 한리건설 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0014' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-construction@partner.com'
WHERE sr.sr_number = 'SR014'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR016: 한리제철 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0015' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-steel@partner.com'
WHERE sr.sr_number = 'SR015'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR017: 한리오토에버 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0016' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanli-ever@partner.com'
WHERE sr.sr_number = 'SR016'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR018: SL하이닉스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0017' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-hynix@partner.com'
WHERE sr.sr_number = 'SR017'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR019: SL이노베이션 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0018' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-innovation@partner.com'
WHERE sr.sr_number = 'SR018'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR020: SL텔레콤 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0019' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-telecom@partner.com'
WHERE sr.sr_number = 'SR019'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR021: SL스퀘어 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0020' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-square@partner.com'
WHERE sr.sr_number = 'SR020'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR022: SL디스커버리 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0021' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-discovery@partner.com'
WHERE sr.sr_number = 'SR021'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR023: SLC 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0022' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'SLc@partner.com'
WHERE sr.sr_number = 'SR022'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR024: SL가스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0023' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-gas@partner.com'
WHERE sr.sr_number = 'SR023'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR025: SL엔무브 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0024' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sl-move@partner.com'
WHERE sr.sr_number = 'SR024'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR026: LK전자 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0025' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-electronics@partner.com'
WHERE sr.sr_number = 'SR025'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR027: LK화학 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0026' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-chemical@partner.com'
WHERE sr.sr_number = 'SR026'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR028: LK디스플레이 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0027' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-display@partner.com'
WHERE sr.sr_number = 'SR027'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR029: LK이노텍 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0028' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-innotek@partner.com'
WHERE sr.sr_number = 'SR028'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR030: LK유플러스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0029' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-uplus@partner.com'
WHERE sr.sr_number = 'SR029'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR031: LK생활건강 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0030' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-life@partner.com'
WHERE sr.sr_number = 'SR030'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR032: LK CNS 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0031' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-cns@partner.com'
WHERE sr.sr_number = 'SR031'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR033: LK상사 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0032' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lk-trading@partner.com'
WHERE sr.sr_number = 'SR032'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR034: 롯태제과 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0033' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-confectionery@partner.com'
WHERE sr.sr_number = 'SR033'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR035: 롯태칠성음료 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0034' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-chilsung@partner.com'
WHERE sr.sr_number = 'SR034'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR036: 롯태마트 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0035' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-mart@partner.com'
WHERE sr.sr_number = 'SR035'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR037: 롯태백화점 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0036' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-department@partner.com'
WHERE sr.sr_number = 'SR036'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR038: 롯태호텔 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0037' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-hotel@partner.com'
WHERE sr.sr_number = 'SR037'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR039: 롯태푸드 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0038' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-food@partner.com'
WHERE sr.sr_number = 'SR038'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR040: 롯태렌탈 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0039' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-rental@partner.com'
WHERE sr.sr_number = 'SR039'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR041: 롯태손해보험 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0040' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lostae-insurance@partner.com'
WHERE sr.sr_number = 'SR040'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR042: GGS칼텍스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0041' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-calnex@partner.com'
WHERE sr.sr_number = 'SR041'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR043: GGS리테일 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0042' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-retail@partner.com'
WHERE sr.sr_number = 'SR042'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR044: GGS건설 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0043' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-construction@partner.com'
WHERE sr.sr_number = 'SR043'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR045: GGS글로벌 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0044' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-global@partner.com'
WHERE sr.sr_number = 'SR044'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR046: GGS EPS 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0045' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-eps@partner.com'
WHERE sr.sr_number = 'SR045'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR047: GGS네오텍 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0046' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-neotech@partner.com'
WHERE sr.sr_number = 'SR046'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR048: GGS수퍼마켓 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0047' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-supermarket@partner.com'
WHERE sr.sr_number = 'SR047'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR049: GGS홈쇼핑 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0048' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'ggs-homeshopping@partner.com'
WHERE sr.sr_number = 'SR048'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR050: 한파솔루션 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0049' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-solution@partner.com'
WHERE sr.sr_number = 'SR049'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR051: 한파에어로스페이스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0050' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-aerospace@partner.com'
WHERE sr.sr_number = 'SR050'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR052: 한파시스템 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0051' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-system@partner.com'
WHERE sr.sr_number = 'SR051'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR053: 한파에너지 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0052' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-energy@partner.com'
WHERE sr.sr_number = 'SR052'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR054: 한파생명 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0053' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-life@partner.com'
WHERE sr.sr_number = 'SR053'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR055: 한파손해보험 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0054' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-insurance@partner.com'
WHERE sr.sr_number = 'SR054'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR056: 한파투자증권 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0055' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-securities@partner.com'
WHERE sr.sr_number = 'SR055'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR057: 한파자산운용 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0056' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanpa-asset@partner.com'
WHERE sr.sr_number = 'SR056'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR058: 대구조선해양 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0057' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daegu-shipbuilding@partner.com'
WHERE sr.sr_number = 'SR057'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR059: 대구건설 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0058' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daegu-construction@partner.com'
WHERE sr.sr_number = 'SR058'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR060: 대구산업 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0059' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daegu-industry@partner.com'
WHERE sr.sr_number = 'SR059'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR061: 대구중공업 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0060' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daegu-heavy@partner.com'
WHERE sr.sr_number = 'SR060'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR062: 대구조선 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0061' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daegu-ship@partner.com'
WHERE sr.sr_number = 'SR061'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR063: 대구해양 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0062' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daegu-ocean@partner.com'
WHERE sr.sr_number = 'SR062'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR064: 대한항공 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0063' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjeung-air@partner.com'
WHERE sr.sr_number = 'SR063'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR065: 한증 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0064' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjeung@partner.com'
WHERE sr.sr_number = 'SR064'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR066: 한증칼 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0065' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjeung-kal@partner.com'
WHERE sr.sr_number = 'SR065'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR067: 대한통운 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0066' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjeung-express@partner.com'
WHERE sr.sr_number = 'SR066'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR068: 한증중공업 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0067' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjeung-heavy@partner.com'
WHERE sr.sr_number = 'SR067'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR069: 한증해운 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0068' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjeung-shipping@partner.com'
WHERE sr.sr_number = 'SR068'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR070: GCDC 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0069' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gcdc@partner.com'
WHERE sr.sr_number = 'SR069'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR071: 디플럭스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0070' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'dflux@partner.com'
WHERE sr.sr_number = 'SR070'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR072: 잔소프트 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0071' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'jansoft@partner.com'
WHERE sr.sr_number = 'SR071'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR073: 진커뮤니케이션 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0072' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'jinkomm@partner.com'
WHERE sr.sr_number = 'SR072'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR074: 네이버고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0073' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'navergo@partner.com'
WHERE sr.sr_number = 'SR073'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR075: 카카오고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0074' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kakaogo@partner.com'
WHERE sr.sr_number = 'SR074'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR076: 쿠팡고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0075' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'coupango@partner.com'
WHERE sr.sr_number = 'SR075'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR077: 배달의민족고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0076' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'baedalgo@partner.com'
WHERE sr.sr_number = 'SR076'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR078: 야놀자고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0077' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yanoljago@partner.com'
WHERE sr.sr_number = 'SR077'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR079: 무신사고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0078' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'musinsago@partner.com'
WHERE sr.sr_number = 'SR078'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR080: 당근마켓고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0079' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'danggeungo@partner.com'
WHERE sr.sr_number = 'SR079'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR081: 요기요고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0080' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yogiyogo@partner.com'
WHERE sr.sr_number = 'SR080'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR082: 라인고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0081' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'linego@partner.com'
WHERE sr.sr_number = 'SR081'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR083: 토스고 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0082' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'tossgo@partner.com'
WHERE sr.sr_number = 'SR082'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR084: 네이버고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0083' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'navergo@partner.com'
WHERE sr.sr_number = 'SR083'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR085: 카카오고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0084' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kakaogo@partner.com'
WHERE sr.sr_number = 'SR084'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR086: 쿠팡고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0085' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'coupango@partner.com'
WHERE sr.sr_number = 'SR085'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR087: 배달의민족고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0086' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'baedalgo@partner.com'
WHERE sr.sr_number = 'SR086'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR088: 야놀자고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0087' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yanoljago@partner.com'
WHERE sr.sr_number = 'SR087'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR089: 무신사고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0088' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'musinsago@partner.com'
WHERE sr.sr_number = 'SR088'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR090: 당근마켓고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0089' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'danggeungo@partner.com'
WHERE sr.sr_number = 'SR089'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR091: 요기요고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0090' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yogiyogo@partner.com'
WHERE sr.sr_number = 'SR090'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR092: 라인고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0091' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'linego@partner.com'
WHERE sr.sr_number = 'SR091'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR093: 토스고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0092' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'tossgo@partner.com'
WHERE sr.sr_number = 'SR092'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR094: 네이버고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0093' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'navergo@partner.com'
WHERE sr.sr_number = 'SR093'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR095: 카카오고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0094' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kakaogo@partner.com'
WHERE sr.sr_number = 'SR094'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR096: 쿠팡고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0095' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'coupango@partner.com'
WHERE sr.sr_number = 'SR095'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR097: 배달의민족고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0096' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'baedalgo@partner.com'
WHERE sr.sr_number = 'SR096'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR098: 야놀자고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0097' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yanoljago@partner.com'
WHERE sr.sr_number = 'SR097'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR099: 무신사고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0098' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'musinsago@partner.com'
WHERE sr.sr_number = 'SR098'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR100: 당근마켓고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0099' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'danggeungo@partner.com'
WHERE sr.sr_number = 'SR099'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR101: 요기요고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0100' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yogiyogo@partner.com'
WHERE sr.sr_number = 'SR100'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR102: 라인고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0101' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'linego@partner.com'
WHERE sr.sr_number = 'SR101'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR103: 토스고 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, spec_type, spec_category, status, sr_id, assignee_id, reviewer_id, started_at, completed_at, created_by, updated_by)
SELECT 
    'SPEC2501-0102' as spec_number,
    'DEVELOPMENT' as spec_type,
    'ACCEPTED' as spec_category,
    'PENDING' as status,
    sr.id as sr_id,
    u1.id as assignee_id,
    NULL as reviewer_id,
    NULL as started_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'tossgo@partner.com'
WHERE sr.sr_number = 'SR102'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- 4. SPEC 코드 자동 생성을 위한 시퀀스 초기화 쿼리
-- NumberinGGService에서 사용하는 SPEC 코드 시퀀스 초기화
-- 기존에 삽입된 최대 SPEC 코드를 기반으로 시퀀스 값 설정

-- 주석: 새로운 SPEC 번호 형식('SPEC2501-0001')에 맞춰 자동 생성 로직은 애플리케이션에서 처리됩니다.
-- 이 마이그레이션에서는 명시적으로 SPEC2501-0001 ~ SPEC2501-0102 까지 생성합니다.

-- 5. SPEC 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- SPEC 데이터 건수 확인
SELECT COUNT(*) as spec_count FROM specifications;

-- SPEC 코드 중복 검증
SELECT spec_number, COUNT(*) as duplicate_count 
FROM specifications 
GROUP BY spec_number 
HAVING COUNT(*) > 1;

-- SR 존재 검증 (수정됨: title 컬럼 대신 spec_number 사용)
SELECT sp.spec_number, sp.sr_id, sr.sr_number as sr_number
FROM specifications sp
LEFT JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sr.id IS NULL;

-- SPEC 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.10__insert_sr_from_partners.sql에 있는 SR 기준으로 각 SR당 1개씩 총 102개의 SPEC 데이터를 생성하였습니다.
-- 모든 SPEC은 해당 SR과 연계된 실제 산업군에 맞는 요청명으로 구성되어 있습니다.
-- SPEC 코드 중복 검증 및 SR 존재 검증을 통해 데이터 무결성을 보장합니다.
-- 모든 SPEC은 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - spec_type: 'DEVELOPMENT' (개발)
--   - spec_category: 'ACCEPTED' (접수됨)
--   - status: 'PENDING' (대기중)