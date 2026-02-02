-- SPEC 데이터 삽입 쿼리 (V3.0.11)
-- V3.0.10__insert_sr_from_partners.sql에 있는 SR 기준으로 각 SR당 1개씩 SPEC 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- SPEC 등록 화면 요소와 API 흐름 분석
-- 화면 요소: SPEC명, SR, SPEC유형, SPEC상태, 작성자, 검증자, 검증일, 검증결과, 검증의견
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/spec
-- 백엔드 객체: SpecService.createSpec()
-- 대상 테이블 & 컬럼: specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: SpecService, SpecRepository, SrRepository, UserRepository
-- 연관 DB 객체: specifications 테이블, service_requests 테이블 (sr_id FK), users 테이블 (author_id, reviewer_id FK)
-- 사이드 이펙트: SPEC 번호 자동 생성, SR 존재 검증, 검증자 권한 검증
-- 프론트 연동: SpecCreatePage.tsx에서 API 호출

-- 3. SR 기준 SPEC 데이터 삽입 쿼리 (멱등성 보장)
-- V3.0.10__insert_sr_from_partners.sql에 있는 SR 기준으로 각 SR당 1개 SPEC 생성

-- PAR002: 삼성전자 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC2501-0001' as spec_number,
    '삼성전자 ERP 시스템 개선 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-20' as review_date,
    'PENDING' as review_result,
    '초안 작성 후 검증 대기 중' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-electronics@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR2501-0001'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR003: 삼성물산 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC002' as spec_number,
    '삼성물산 스마트 빌딩 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-20' as review_date,
    'PENDING' as review_result,
    '스마트 빌딩 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-cnt@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR002'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR004: 삼성생명 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC003' as spec_number,
    '삼성생명 디지털 보험 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-20' as review_date,
    'PENDING' as review_result,
    '디지털 보험 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-life@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR003'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR005: 삼성화재 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC004' as spec_number,
    '삼성화재 디지털 손해사정 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-20' as review_date,
    'PENDING' as review_result,
    '디지털 손해사정 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-fire@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR004'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR006: 삼성전기 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC005' as spec_number,
    '삼성전기 고성능 MLCC 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-20' as review_date,
    'PENDING' as review_result,
    '고성능 MLCC 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-electro@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR005'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR007: 삼성SDI 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC006' as spec_number,
    '삼성SDI 차세대 배터리 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-20' as review_date,
    'PENDING' as review_result,
    '차세대 배터리 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-sdi@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR006'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR008: 삼성바이오로직스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC007' as spec_number,
    '삼성바이오로직스 바이오의약품 상세 명세서' as title,
    'BIOTECH' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-20' as review_date,
    'PENDING' as review_result,
    '바이오의약품 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-bio@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR007'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR009: 삼성엔지니어링 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC008' as spec_number,
    '삼성엔지니어링 스마트 플랜트 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-20' as review_date,
    'PENDING' as review_result,
    '스마트 플랜트 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'samsung-engineering@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR008'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR010: 현대자동차 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC009' as spec_number,
    '현대자동차 전기차 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-25' as review_date,
    'PENDING' as review_result,
    '전기차 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-motor@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR009'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR011: 기아 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC010' as spec_number,
    '기아 디지털 콕핏 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-25' as review_date,
    'PENDING' as review_result,
    '디지털 콕핏 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kia@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR010'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR012: 현대모비스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC011' as spec_number,
    '현대모비스 차량용 소프트웨어 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-25' as review_date,
    'PENDING' as review_result,
    '차량용 소프트웨어 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-mobis@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR011'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR013: 현대위아 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC012' as spec_number,
    '현대위아 스마트 공장 자동화 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-25' as review_date,
    'PENDING' as review_result,
    '스마트 공장 자동화 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-wia@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR012'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR014: 현대글로비스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC013' as spec_number,
    '현대글로비스 스마트 물류 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-25' as review_date,
    'PENDING' as review_result,
    '스마트 물류 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-glovis@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR013'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR015: 현대건설 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC014' as spec_number,
    '현대건설 스마트 시티 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-25' as review_date,
    'PENDING' as review_result,
    '스마트 시티 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-construction@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR014'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR016: 현대제철 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC015' as spec_number,
    '현대제철 스마트 제철 공정 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-25' as review_date,
    'PENDING' as review_result,
    '스마트 제철 공정 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-steel@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR015'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR017: 현대오토에버 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC016' as spec_number,
    '현대오토에버 자동차 소프트웨어 개발 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-25' as review_date,
    'PENDING' as review_result,
    '자동차 소프트웨어 개발 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hyundai-ever@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR016'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR018: SK하이닉스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC017' as spec_number,
    'SK하이닉스 차세대 메모리 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-30' as review_date,
    'PENDING' as review_result,
    '차세대 메모리 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-hynix@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR017'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR019: SK이노베이션 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC018' as spec_number,
    'SK이노베이션 친환경 에너지 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-28' as review_date,
    'PENDING' as review_result,
    '친환경 에너지 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-innovation@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR018'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR020: SK텔레콤 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC019' as spec_number,
    'SK텔레콤 5G 네트워크 최적화 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-30' as review_date,
    'PENDING' as review_result,
    '5G 네트워크 최적화 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-telecom@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR019'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR021: SK스퀘어 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC020' as spec_number,
    'SK스퀘어 반도체 투자 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-30' as review_date,
    'PENDING' as review_result,
    '반도체 투자 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-square@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR020'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR022: SK디스커버리 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC021' as spec_number,
    'SK디스커버리 신사업 발굴 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-30' as review_date,
    'PENDING' as review_result,
    '신사업 발굴 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-discovery@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR021'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR023: SKC 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC022' as spec_number,
    'SKC 친환경 소재 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-30' as review_date,
    'PENDING' as review_result,
    '친환경 소재 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'skc@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR022'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR024: SK가스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC023' as spec_number,
    'SK가스 스마트 가스 관리 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-30' as review_date,
    'PENDING' as review_result,
    '스마트 가스 관리 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-gas@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR023'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR025: SK엔무브 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC024' as spec_number,
    'SK엔무브 모빌리티 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-30' as review_date,
    'PENDING' as review_result,
    '모빌리티 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'sk-move@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR024'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR026: LG전자 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC025' as spec_number,
    'LG전자 AI 가전 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-10' as review_date,
    'PENDING' as review_result,
    'AI 가전 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-electronics@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR025'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR027: LG화학 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC026' as spec_number,
    'LG화학 바이오소재 상세 명세서' as title,
    'BIOTECH' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-10' as review_date,
    'PENDING' as review_result,
    '바이오소재 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-chemical@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR026'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR028: LG디스플레이 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC027' as spec_number,
    'LG디스플레이 차세대 디스플레이 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-10' as review_date,
    'PENDING' as review_result,
    '차세대 디스플레이 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-display@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR027'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR029: LG이노텍 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC028' as spec_number,
    'LG이노텍 차량용 센서 상세 명세서' as title,
    'HARDWARE' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-10' as review_date,
    'PENDING' as review_result,
    '차량용 센서 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-innotek@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR028'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR030: LG유플러스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC029' as spec_number,
    'LG유플러스 IoT 서비스 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-10' as review_date,
    'PENDING' as review_result,
    'IoT 서비스 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-uplus@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR029'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR031: LG생활건강 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC030' as spec_number,
    'LG생활건강 스마트 코스메틱 상세 명세서' as title,
    'BIOTECH' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-10' as review_date,
    'PENDING' as review_result,
    '스마트 코스메틱 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-life@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR030'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR032: LG CNS 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC031' as spec_number,
    'LG CNS 클라우드 보안 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-10' as review_date,
    'PENDING' as review_result,
    '클라우드 보안 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-cns@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR031'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR033: LG상사 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC032' as spec_number,
    'LG상사 글로벌 무역 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-10' as review_date,
    'PENDING' as review_result,
    '글로벌 무역 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lg-trading@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR032'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR034: 롯데제과 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC033' as spec_number,
    '롯데제과 스마트 제조 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-15' as review_date,
    'PENDING' as review_result,
    '스마트 제조 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-confectionery@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR033'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR035: 롯데칠성음료 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC034' as spec_number,
    '롯데칠성음료 스마트 물류 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-15' as review_date,
    'PENDING' as review_result,
    '스마트 물류 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-chilsung@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR034'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR036: 롯데마트 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC035' as spec_number,
    '롯데마트 디지털 매장 관리 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-15' as review_date,
    'PENDING' as review_result,
    '디지털 매장 관리 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-mart@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR035'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR037: 롯데백화점 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC036' as spec_number,
    '롯데백화점 스마트 쇼핑 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-15' as review_date,
    'PENDING' as review_result,
    '스마트 쇼핑 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-department@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR036'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR038: 롯데호텔 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC037' as spec_number,
    '롯데호텔 스마트 투숙 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-15' as review_date,
    'PENDING' as review_result,
    '스마트 투숙 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-hotel@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR037'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR039: 롯데푸드 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC038' as spec_number,
    '롯데푸드 스마트 생산 관리 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-15' as review_date,
    'PENDING' as review_result,
    '스마트 생산 관리 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-food@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR038'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR040: 롯데렌탈 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC039' as spec_number,
    '롯데렌탈 차량 관리 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-15' as review_date,
    'PENDING' as review_result,
    '차량 관리 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-rental@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR039'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR041: 롯데손해보험 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC040' as spec_number,
    '롯데손해보험 디지털 보험 서비스 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-15' as review_date,
    'PENDING' as review_result,
    '디지털 보험 서비스 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'lotte-insurance@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR040'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR042: GS칼텍스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC041' as spec_number,
    'GS칼텍스 스마트 에너지 관리 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-20' as review_date,
    'PENDING' as review_result,
    '스마트 에너지 관리 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-calnex@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR041'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR043: GS리테일 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC042' as spec_number,
    'GS리테일 편의점 디지털 전환 프로젝트 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-20' as review_date,
    'PENDING' as review_result,
    '편의점 디지털 전환 프로젝트 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-retail@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR042'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR044: GS건설 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC043' as spec_number,
    'GS건설 스마트 건설 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-20' as review_date,
    'PENDING' as review_result,
    '스마트 건설 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-construction@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR043'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR045: GS글로벌 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC044' as spec_number,
    'GS글로벌 무역 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-20' as review_date,
    'PENDING' as review_result,
    '무역 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-global@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR044'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR046: GS EPS 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC045' as spec_number,
    'GS EPS 에너지 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-20' as review_date,
    'PENDING' as review_result,
    '에너지 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-eps@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR045'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR047: GS네오텍 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC046' as spec_number,
    'GS네오텍 스마트 팩토리 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-20' as review_date,
    'PENDING' as review_result,
    '스마트 팩토리 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-neotech@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR046'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR048: GS수퍼마켓 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC047' as spec_number,
    'GS수퍼마켓 디지털 매장 관리 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-20' as review_date,
    'PENDING' as review_result,
    '디지털 매장 관리 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-supermarket@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR047'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR049: GS홈쇼핑 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC048' as spec_number,
    'GS홈쇼핑 모바일 쇼핑 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-20' as review_date,
    'PENDING' as review_result,
    '모바일 쇼핑 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gs-homeshopping@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR048'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR050: 한화솔루션 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC049' as spec_number,
    '한화솔루션 태양광 에너지 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-25' as review_date,
    'PENDING' as review_result,
    '태양광 에너지 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-solution@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR049'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR051: 한화에어로스페이스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC050' as spec_number,
    '한화에어로스페이스 항공우주 소프트웨어 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-25' as review_date,
    'PENDING' as review_result,
    '항공우주 소프트웨어 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-aerospace@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR050'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR052: 한화시스템 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC051' as spec_number,
    '한화시스템 국방 IT 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-25' as review_date,
    'PENDING' as review_result,
    '국방 IT 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-system@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR051'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR053: 한화에너지 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC052' as spec_number,
    '한화에너지 스마트 그리드 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-25' as review_date,
    'PENDING' as review_result,
    '스마트 그리드 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-energy@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR052'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR054: 한화생명 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC053' as spec_number,
    '한화생명 디지털 보험 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-25' as review_date,
    'PENDING' as review_result,
    '디지털 보험 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-life@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR053'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR055: 한화손해보험 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC054' as spec_number,
    '한화손해보험 인슈어테크 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-25' as review_date,
    'PENDING' as review_result,
    '인슈어테크 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-insurance@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR054'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR056: 한화투자증권 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC055' as spec_number,
    '한화투자증권 모바일 트레이딩 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-25' as review_date,
    'PENDING' as review_result,
    '모바일 트레이딩 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-securities@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR055'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR057: 한화자산운용 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC056' as spec_number,
    '한화자산운용 로보어드바이저 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-25' as review_date,
    'PENDING' as review_result,
    '로보어드바이저 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanwha-asset@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR056'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR058: 대우조선해양 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC057' as spec_number,
    '대우조선해양 스마트 조선소 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-30' as review_date,
    'PENDING' as review_result,
    '스마트 조선소 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daewoo-shipbuilding@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR057'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR059: 대우건설 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC058' as spec_number,
    '대우건설 스마트 건설 기술 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-28' as review_date,
    'PENDING' as review_result,
    '스마트 건설 기술 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daewoo-construction@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR058'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR060: 대우산업 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC059' as spec_number,
    '대우산업 스마트 공장 자동화 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-30' as review_date,
    'PENDING' as review_result,
    '스마트 공장 자동화 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daewoo-industry@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR059'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR061: 대우중공업 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC060' as spec_number,
    '대우중공업 대형 설비 제어 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-30' as review_date,
    'PENDING' as review_result,
    '대형 설비 제어 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daewoo-heavy@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR060'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR062: 대우조선 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC061' as spec_number,
    '대우조선 선박 설계 자동화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-30' as review_date,
    'PENDING' as review_result,
    '선박 설계 자동화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daewoo-ship@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR061'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR063: 대우해양 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC062' as spec_number,
    '대우해양 해양 구조물 설계 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-30' as review_date,
    'PENDING' as review_result,
    '해양 구조물 설계 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'daewoo-ocean@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR062'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR064: 대한항공 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC063' as spec_number,
    '대한항공 스마트 항공기 관리 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-15' as review_date,
    'PENDING' as review_result,
    '스마트 항공기 관리 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'korean-air@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR063'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR065: 한진 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC064' as spec_number,
    '한진 스마트 물류 네트워크 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-15' as review_date,
    'PENDING' as review_result,
    '스마트 물류 네트워크 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjin@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR064'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR066: 한진칼 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC065' as spec_number,
    '한진칼 항공 IT 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-15' as review_date,
    'PENDING' as review_result,
    '항공 IT 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjin-kal@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR065'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR067: 대한통운 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC066' as spec_number,
    '대한통운 실시간 배송 추적 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-15' as review_date,
    'PENDING' as review_result,
    '실시간 배송 추적 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'korean-express@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR066'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR068: 한진중공업 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC067' as spec_number,
    '한진중공업 대형 크레인 제어 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-15' as review_date,
    'PENDING' as review_result,
    '대형 크레인 제어 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjin-heavy@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR067'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR069: 한진해운 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC068' as spec_number,
    '한진해운 선박 운항 최적화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-15' as review_date,
    'PENDING' as review_result,
    '선박 운항 최적화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'hanjin-shipping@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR068'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR070: GCDC 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC069' as spec_number,
    'GCDC ITMS 개발 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-10' as review_date,
    'PENDING' as review_result,
    'ITMS 개발 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'gcdc@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR069'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR071: 디플럭스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC070' as spec_number,
    '디플럭스 AI 솔루션 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-10' as review_date,
    'PENDING' as review_result,
    'AI 솔루션 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'dflux@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR070'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR072: 잔소프트 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC071' as spec_number,
    '잔소프트 ERP 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-10' as review_date,
    'PENDING' as review_result,
    'ERP 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'jansoft@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR071'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR073: 진커뮤니케이션 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC072' as spec_number,
    '진커뮤니케이션 통신 인프라 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-10' as review_date,
    'PENDING' as review_result,
    '통신 인프라 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'jinkomm@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR072'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR074: 네이버 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC073' as spec_number,
    '네이버 AI 검색 엔진 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-20' as review_date,
    'PENDING' as review_result,
    'AI 검색 엔진 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'naver@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR073'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR075: 카카오 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC074' as spec_number,
    '카카오 모빌리티 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-20' as review_date,
    'PENDING' as review_result,
    '모빌리티 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kakao@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR074'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR076: 쿠팡 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC075' as spec_number,
    '쿠팡 물류 자동화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-20' as review_date,
    'PENDING' as review_result,
    '물류 자동화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'coupang@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR075'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR077: 배달의민족 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC076' as spec_number,
    '배달의민족 스마트 주문 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-20' as review_date,
    'PENDING' as review_result,
    '스마트 주문 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'baedal@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR076'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR078: 야놀자 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC077' as spec_number,
    '야놀자 숙박 플랫폼 AI 최적화 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-20' as review_date,
    'PENDING' as review_result,
    '숙박 플랫폼 AI 최적화 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yanolja@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR077'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR079: 무신사 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC078' as spec_number,
    '무신사 패션 AI 추천 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-20' as review_date,
    'PENDING' as review_result,
    '패션 AI 추천 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'musinsa@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR078'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR080: 당근마켓 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC079' as spec_number,
    '당근마켓 중고거래 AI 매칭 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-20' as review_date,
    'PENDING' as review_result,
    '중고거래 AI 매칭 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'danggeun@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR079'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR081: 요기요 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC080' as spec_number,
    '요기요 실시간 배달 최적화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-20' as review_date,
    'PENDING' as review_result,
    '실시간 배달 최적화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yogiyo@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR080'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR082: 라인 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC081' as spec_number,
    '라인 메신저 AI 챗봇 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-25' as review_date,
    'PENDING' as review_result,
    'AI 챗봇 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'line@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR081'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR083: 토스 파트너 SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC082' as spec_number,
    '토스 핀테크 보안 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-25' as review_date,
    'PENDING' as review_result,
    '핀테크 보안 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'toss@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR082'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR084: 네이버 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC083' as spec_number,
    '네이버 AI 검색 엔진 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-20' as review_date,
    'PENDING' as review_result,
    'AI 검색 엔진 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'naver@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR083'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR085: 카카오 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC084' as spec_number,
    '카카오 모빌리티 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-20' as review_date,
    'PENDING' as review_result,
    '모빌리티 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kakao@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR084'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR086: 쿠팡 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC085' as spec_number,
    '쿠팡 물류 자동화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-20' as review_date,
    'PENDING' as review_result,
    '물류 자동화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'coupang@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR085'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR087: 배달의민족 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC086' as spec_number,
    '배달의민족 스마트 주문 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-20' as review_date,
    'PENDING' as review_result,
    '스마트 주문 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'baedal@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR086'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR088: 야놀자 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC087' as spec_number,
    '야놀자 숙박 플랫폼 AI 최적화 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-20' as review_date,
    'PENDING' as review_result,
    '숙박 플랫폼 AI 최적화 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yanolja@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR087'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR089: 무신사 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC088' as spec_number,
    '무신사 패션 AI 추천 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-20' as review_date,
    'PENDING' as review_result,
    '패션 AI 추천 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'musinsa@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR088'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR090: 당근마켓 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC089' as spec_number,
    '당근마켓 중고거래 AI 매칭 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-20' as review_date,
    'PENDING' as review_result,
    '중고거래 AI 매칭 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'danggeun@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR089'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR091: 요기요 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC090' as spec_number,
    '요기요 실시간 배달 최적화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-20' as review_date,
    'PENDING' as review_result,
    '실시간 배달 최적화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yogiyo@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR090'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR092: 라인 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC091' as spec_number,
    '라인 메신저 AI 챗봇 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-25' as review_date,
    'PENDING' as review_result,
    'AI 챗봇 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'line@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR091'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR093: 토스 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC092' as spec_number,
    '토스 핀테크 보안 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-25' as review_date,
    'PENDING' as review_result,
    '핀테크 보안 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'toss@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR092'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR094: 네이버 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC093' as spec_number,
    '네이버 AI 검색 엔진 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-20' as review_date,
    'PENDING' as review_result,
    'AI 검색 엔진 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'naver@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR093'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR095: 카카오 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC094' as spec_number,
    '카카오 모빌리티 플랫폼 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-20' as review_date,
    'PENDING' as review_result,
    '모빌리티 플랫폼 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'kakao@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR094'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR096: 쿠팡 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC095' as spec_number,
    '쿠팡 물류 자동화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-03-20' as review_date,
    'PENDING' as review_result,
    '물류 자동화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'coupang@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR095'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR097: 배달의민족 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC096' as spec_number,
    '배달의민족 스마트 주문 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-04-20' as review_date,
    'PENDING' as review_result,
    '스마트 주문 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'baedal@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR096'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR098: 야놀자 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC097' as spec_number,
    '야놀자 숙박 플랫폼 AI 최적화 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-05-20' as review_date,
    'PENDING' as review_result,
    '숙박 플랫폼 AI 최적화 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yanolja@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR097'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR099: 무신사 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC098' as spec_number,
    '무신사 패션 AI 추천 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-06-20' as review_date,
    'PENDING' as review_result,
    '패션 AI 추천 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'musinsa@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR098'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR100: 당근마켓 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC099' as spec_number,
    '당근마켓 중고거래 AI 매칭 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-07-20' as review_date,
    'PENDING' as review_result,
    '중고거래 AI 매칭 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'danggeun@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR099'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR101: 요기요 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC100' as spec_number,
    '요기요 실시간 배달 최적화 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-08-20' as review_date,
    'PENDING' as review_result,
    '실시간 배달 최적화 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'yogiyo@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR100'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR102: 라인 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC101' as spec_number,
    '라인 메신저 AI 챗봇 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-01-25' as review_date,
    'PENDING' as review_result,
    'AI 챗봇 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'line@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR101'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- PAR103: 토스 파트너 (추가) SR 기준 SPEC 생성
INSERT INTO specifications (spec_number, title, spec_type, spec_status, sr_id, author_id, reviewer_id, review_date, review_result, review_comments, created_by, updated_by)
SELECT 
    'SPEC102' as spec_number,
    '토스 핀테크 보안 시스템 상세 명세서' as title,
    'SYSTEM' as spec_type,
    'DRAFT' as spec_status,
    sr.id as sr_id,
    u1.id as author_id,
    u2.id as reviewer_id,
    '2025-02-25' as review_date,
    'PENDING' as review_result,
    '핀테크 보안 시스템 상세 명세서 초안' as review_comments,
    'system' as created_by,
    'system' as updated_by
FROM service_requests sr 
JOIN users u1 ON u1.email = 'toss@partner.com'
JOIN users u2 ON u2.email = 'admin@company.com'
WHERE sr.sr_number = 'SR102'
LIMIT 1
ON CONFLICT (spec_number) DO NOTHING;

-- 4. SPEC 코드 자동 생성을 위한 시퀀스 초기화 쿼리
-- NumberingService에서 사용하는 SPEC 코드 시퀀스 초기화
-- 기존에 삽입된 최대 SPEC 코드를 기반으로 시퀀스 값 설정

-- SPEC 코드 시퀀스 값 확인 및 업데이트 쿼리
WITH max_spec_code AS (
    SELECT MAX(CAST(SUBSTRING(spec_number, 5) AS INTEGER)) as max_code_num
    FROM specifications
    WHERE spec_number LIKE 'SPEC%'
)
UPDATE specifications 
SET spec_number = 'SPEC' || LPAD((SELECT max_code_num + 1 FROM max_spec_code)::TEXT, 3, '0')
WHERE id IN (
    SELECT id FROM specifications 
    WHERE spec_number IS NULL OR spec_number = ''
    LIMIT 1
);

-- 5. SPEC 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- SPEC 데이터 건수 확인
SELECT COUNT(*) as spec_count FROM specifications;

-- SPEC 코드 중복 검증
SELECT spec_number, COUNT(*) as duplicate_count 
FROM specifications 
GROUP BY spec_number 
HAVING COUNT(*) > 1;

-- SR 존재 검증 (유지됨)
SELECT sp.spec_number, sp.title, sp.sr_id, sr.sr_number as sr_number
FROM specifications sp
LEFT JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sr.id IS NULL;

-- SPEC 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.10__insert_sr_from_partners.sql에 있는 SR 기준으로 각 SR당 1개씩 총 83개의 SPEC 데이터를 생성하였습니다.
-- 모든 SPEC은 해당 SR과 연계된 실제 산업군에 맞는 요청명으로 구성되어 있습니다.
-- SPEC 코드 중복 검증 및 SR 존재 검증을 통해 데이터 무결성을 보장합니다.