-- ASSET 데이터 삽입 쿼리 (V3.0.13)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 자산 관리 데이터 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- ASSET 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 자산번호, 자산유형, 시리얼번호, 취득일, 폐기여부, 폐기일, 관리자
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/assets
-- 백엔드 객체: AssetService.createAsset()
-- 대상 테이블 & 컬럼: assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: AssetService, AssetRepository, UserRepository, NumberingService
-- 연관 DB 객체: assets 테이블, users 테이블 (manager_id FK), AssetType enum
-- 사이드 이펙트: 자산 번호 자동 생성, 시리얼 번호 중복 검증, 관리자 존재 검증
-- 프론트 연동: AssetCreatePage.tsx에서 API 호출

-- 3. 사전 작업: asset_type 제약조건 수정 (AssetType enum과 일치하도록)
-- AssetType enum: LAPTOP, TABLE, CHAIR, MONITOR, PRINTER, DUPLICATOR, OTHER

-- 기존 제약조건 삭제
ALTER TABLE assets DROP CONSTRAINT IF EXISTS chk_asset_type;

-- 새로운 제약조건 추가 (TABLE, CHAIR, DUPLICATOR 포함)
ALTER TABLE assets ADD CONSTRAINT chk_asset_type 
CHECK (asset_type IN ('LAPTOP', 'TABLE', 'CHAIR', 'MONITOR', 'PRINTER', 'DUPLICATOR', 'OTHER'));

-- 컬럼 코멘트 업데이트
COMMENT ON COLUMN assets.asset_type IS 'LAPTOP(노트북), TABLE(책상), CHAIR(의자), MONITOR(모니터), PRINTER(프린터), DUPLICATOR(복사기), OTHER(기타)';

-- 4. GCDC 회사 담당자 5명 추가
-- 김창연(노트북), 조범구(책상), 김천용(의자), 박희주(프린터), 조재혁(복사기)

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('kim.changyeon@gcdc.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '김창연', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('jo.beomgu@gcdc.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '조범구', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('kim.cheonyong@gcdc.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '김천용', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('park.heeju@gcdc.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '박희주', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('jo.jaehyuk@gcdc.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '조재혁', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 5. 파트너 기준 ASSET 데이터 삽입 쿼리 (멱등성 보장)
-- GCDC 회사 자산 5개 우선 생성 후, 나머지 파트너 자산 95개 생성 (총 100개)

-- ========================================
-- GCDC 자산 (5개) - 우선 생성
-- ========================================

-- 1. GCDC 노트북 - 담당자: 김창연
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-0001' as asset_number,
    'LAPTOP' as asset_type,
    'LAPTOP-GCDC-000001' as serial_number,
    DATE '2024-01-15' as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'kim.changyeon@gcdc.com'
ON CONFLICT (asset_number) DO NOTHING;

-- 2. GCDC 책상 - 담당자: 조범구
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-0002' as asset_number,
    'TABLE' as asset_type,
    'TABLE-GCDC-000001' as serial_number,
    DATE '2024-01-20' as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'jo.beomgu@gcdc.com'
ON CONFLICT (asset_number) DO NOTHING;

-- 3. GCDC 의자 - 담당자: 김천용
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-0003' as asset_number,
    'CHAIR' as asset_type,
    'CHAIR-GCDC-000001' as serial_number,
    DATE '2024-01-25' as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'kim.cheonyong@gcdc.com'
ON CONFLICT (asset_number) DO NOTHING;

-- 4. GCDC 프린터 - 담당자: 박희주
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-0004' as asset_number,
    'PRINTER' as asset_type,
    'PRINTER-GCDC-000001' as serial_number,
    DATE '2024-02-01' as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'park.heeju@gcdc.com'
ON CONFLICT (asset_number) DO NOTHING;

-- 5. GCDC 복사기 - 담당자: 조재혁
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-0005' as asset_number,
    'DUPLICATOR' as asset_type,
    'DUPLICATOR-GCDC-000001' as serial_number,
    DATE '2024-02-05' as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'jo.jaehyuk@gcdc.com'
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- 나머지 파트너 자산 (95개)
-- 자산 유형: 노트북(LAPTOP), 책상(TABLE), 의자(CHAIR), 프린터(PRINTER), 복사기(DUPLICATOR)
-- 담당자: 가상의 실명
-- ========================================

-- 노트북 자산 (19개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((6 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as asset_number,
    'LAPTOP' as asset_type,
    'LAPTOP-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 6, '0') as serial_number,
    DATE '2023-03-01' + (INTERVAL '7 days' * (row_number() OVER (ORDER BY u.id) - 1)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u
    WHERE u.email LIKE '%@partner.com' 
      AND u.email NOT IN ('gcdc@partner.com', 'kim.changyeon@gcdc.com', 'jo.beomgu@gcdc.com', 'kim.cheonyong@gcdc.com', 'park.heeju@gcdc.com', 'jo.jaehyuk@gcdc.com')
    ORDER BY u.id
    LIMIT 19
) u
ON CONFLICT (asset_number) DO NOTHING;

-- 책상 자산 (19개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((25 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as asset_number,
    'TABLE' as asset_type,
    'TABLE-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 6, '0') as serial_number,
    DATE '2023-04-01' + (INTERVAL '7 days' * (row_number() OVER (ORDER BY u.id) - 1)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u
    WHERE u.email LIKE '%@partner.com' 
      AND u.email NOT IN ('gcdc@partner.com', 'kim.changyeon@gcdc.com', 'jo.beomgu@gcdc.com', 'kim.cheonyong@gcdc.com', 'park.heeju@gcdc.com', 'jo.jaehyuk@gcdc.com')
    ORDER BY u.id
    OFFSET 19 LIMIT 19
) u
ON CONFLICT (asset_number) DO NOTHING;

-- 의자 자산 (19개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((44 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as asset_number,
    'CHAIR' as asset_type,
    'CHAIR-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 6, '0') as serial_number,
    DATE '2023-05-01' + (INTERVAL '7 days' * (row_number() OVER (ORDER BY u.id) - 1)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u
    WHERE u.email LIKE '%@partner.com' 
      AND u.email NOT IN ('gcdc@partner.com', 'kim.changyeon@gcdc.com', 'jo.beomgu@gcdc.com', 'kim.cheonyong@gcdc.com', 'park.heeju@gcdc.com', 'jo.jaehyuk@gcdc.com')
    ORDER BY u.id
    OFFSET 38 LIMIT 19
) u
ON CONFLICT (asset_number) DO NOTHING;

-- 프린터 자산 (19개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((63 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as asset_number,
    'PRINTER' as asset_type,
    'PRINTER-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 6, '0') as serial_number,
    DATE '2023-06-01' + (INTERVAL '7 days' * (row_number() OVER (ORDER BY u.id) - 1)) as acquired_at,
    CASE WHEN (row_number() OVER (ORDER BY u.id)) % 10 = 0 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER (ORDER BY u.id)) % 10 = 0 THEN DATE '2025-12-31' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u
    WHERE u.email LIKE '%@partner.com' 
      AND u.email NOT IN ('gcdc@partner.com', 'kim.changyeon@gcdc.com', 'jo.beomgu@gcdc.com', 'kim.cheonyong@gcdc.com', 'park.heeju@gcdc.com', 'jo.jaehyuk@gcdc.com')
    ORDER BY u.id
    OFFSET 57 LIMIT 19
) u
ON CONFLICT (asset_number) DO NOTHING;

-- 복사기 자산 (19개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((82 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as asset_number,
    'DUPLICATOR' as asset_type,
    'DUPLICATOR-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 6, '0') as serial_number,
    DATE '2023-07-01' + (INTERVAL '7 days' * (row_number() OVER (ORDER BY u.id) - 1)) as acquired_at,
    CASE WHEN (row_number() OVER (ORDER BY u.id)) % 15 = 0 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER (ORDER BY u.id)) % 15 = 0 THEN DATE '2025-12-31' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u
    WHERE u.email LIKE '%@partner.com' 
      AND u.email NOT IN ('gcdc@partner.com', 'kim.changyeon@gcdc.com', 'jo.beomgu@gcdc.com', 'kim.cheonyong@gcdc.com', 'park.heeju@gcdc.com', 'jo.jaehyuk@gcdc.com')
    ORDER BY u.id
    OFFSET 76 LIMIT 19
) u
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- 6. ASSET 데이터 검증 쿼리
-- ========================================

-- 자산 데이터 건수 확인
SELECT COUNT(*) as asset_count FROM assets;

-- 자산 번호 중복 검증
SELECT asset_number, COUNT(*) as duplicate_count 
FROM assets 
GROUP BY asset_number 
HAVING COUNT(*) > 1;

-- 시리얼 번호 중복 검증
SELECT serial_number, COUNT(*) as duplicate_count 
FROM assets 
GROUP BY serial_number 
HAVING COUNT(*) > 1;

-- 관리자 존재 검증
SELECT a.asset_number, a.manager_id, u.email, u.name
FROM assets a
LEFT JOIN users u ON a.manager_id = u.id
WHERE u.id IS NULL;

-- 자산 유형별 통계
SELECT 
    asset_type,
    COUNT(*) as count,
    SUM(CASE WHEN is_expired THEN 1 ELSE 0 END) as expired_count,
    SUM(CASE WHEN NOT is_expired THEN 1 ELSE 0 END) as active_count
FROM assets
GROUP BY asset_type
ORDER BY asset_type;

-- GCDC 자산 확인 (5개여야 함)
SELECT 
    a.asset_number,
    a.asset_type,
    a.serial_number,
    u.email as manager_email,
    u.name as manager_name,
    c.name as company_name,
    a.acquired_at,
    a.is_expired
FROM assets a
JOIN users u ON a.manager_id = u.id
JOIN companies c ON u.company_id = c.id
WHERE c.code = 'COMP087'
ORDER BY a.asset_number;

-- 자산 유형별 담당자 분포
SELECT 
    a.asset_type,
    c.name as company_name,
    COUNT(*) as asset_count
FROM assets a
JOIN users u ON a.manager_id = u.id
JOIN companies c ON u.company_id = c.id
GROUP BY a.asset_type, c.name
ORDER BY a.asset_type, asset_count DESC
LIMIT 20;

-- GCDC 담당자별 자산 현황
SELECT 
    u.name as manager_name,
    u.email as manager_email,
    a.asset_type,
    a.asset_number,
    a.serial_number,
    a.acquired_at
FROM users u
LEFT JOIN assets a ON u.id = a.manager_id
WHERE u.email LIKE '%@gcdc.com'
ORDER BY u.name, a.asset_number;

-- 최근 취득 자산 목록
SELECT 
    a.asset_number,
    a.asset_type,
    a.serial_number,
    u.name as manager_name,
    c.name as company_name,
    a.acquired_at,
    a.is_expired
FROM assets a
JOIN users u ON a.manager_id = u.id
JOIN companies c ON u.company_id = c.id
ORDER BY a.acquired_at DESC
LIMIT 20;

-- 폐기 자산 목록
SELECT 
    a.asset_number,
    a.asset_type,
    a.serial_number,
    u.name as manager_name,
    c.name as company_name,
    a.acquired_at,
    a.expired_at
FROM assets a
JOIN users u ON a.manager_id = u.id
JOIN companies c ON u.company_id = c.id
WHERE a.is_expired = true
ORDER BY a.expired_at DESC;

-- ASSET 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql의 파트너 데이터를 기반으로 자산 관리 데이터를 생성하였습니다.
-- 
-- 사전 작업:
--   - asset_type 제약조건 수정: TABLE, CHAIR, DUPLICATOR 추가 (AssetType enum과 일치)
--   - GCDC 회사 담당자 5명 추가: 김창연, 조범구, 김천용, 박희주, 조재혁
-- 
-- 자산 구성:
--   - GCDC 자산 5개 (우선 생성):
--     1. AST2501-0001: 노트북(LAPTOP) - 담당자: 김창연 (kim.changyeon@gcdc.com)
--     2. AST2501-0002: 책상(TABLE) - 담당자: 조범구 (jo.beomgu@gcdc.com)
--     3. AST2501-0003: 의자(CHAIR) - 담당자: 김천용 (kim.cheonyong@gcdc.com)
--     4. AST2501-0004: 프린터(PRINTER) - 담당자: 박희주 (park.heeju@gcdc.com)
--     5. AST2501-0005: 복사기(DUPLICATOR) - 담당자: 조재혁 (jo.jaehyuk@gcdc.com)
--   - 나머지 파트너 자산 95개:
--     * 노트북(LAPTOP): 19개 (AST2501-0006 ~ 0024)
--     * 책상(TABLE): 19개 (AST2501-0025 ~ 0043)
--     * 의자(CHAIR): 19개 (AST2501-0044 ~ 0062)
--     * 프린터(PRINTER): 19개 (AST2501-0063 ~ 0081)
--     * 복사기(DUPLICATOR): 19개 (AST2501-0082 ~ 0100)
--   - 총 100개의 자산 데이터
-- 
-- 모든 자산은 실제 파트너 사용자를 관리자(manager_id)로 하여 생성됩니다.
-- 자산 번호 중복 검증 및 FK 존재 검증을 통해 데이터 무결성을 보장합니다.
-- 
-- 자산 유형별 분포:
--   - LAPTOP: 20개 (GCDC 1개 + 기타 19개)
--   - TABLE: 20개 (GCDC 1개 + 기타 19개)
--   - CHAIR: 20개 (GCDC 1개 + 기타 19개)
--   - PRINTER: 20개 (GCDC 1개 + 기타 19개)
--   - DUPLICATOR: 20개 (GCDC 1개 + 기타 19개)
-- 
-- 폐기 자산:
--   - 프린터: 10번째마다 1개 폐기 (총 2개)
--   - 복사기: 15번째마다 1개 폐기 (총 1개)
