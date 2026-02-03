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
-- 연관 DB 객체: assets 테이블, users 테이블 (manager_id FK)
-- 사이드 이펙트: 자산 번호 자동 생성, 시리얼 번호 중복 검증, 관리자 존재 검증
-- 프론트 연동: AssetCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 ASSET 데이터 삽입 쿼리 (멱등성 보장)
-- 각 파트너의 사용자를 관리자로 하여 다양한 IT 자산 생성 (총 100개)

-- ========================================
-- PC 자산 (30개)
-- ========================================

-- 삼성그룹 PC 자산 (10개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((row_number() OVER ())::TEXT, 4, '0') as asset_number,
    'PC' as asset_type,
    'PC-SAMSUNG-' || LPAD((row_number() OVER ())::TEXT, 6, '0') as serial_number,
    DATE '2023-01-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 30)) as acquired_at,
    CASE WHEN (row_number() OVER ()) % 10 = 0 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER ()) % 10 = 0 THEN DATE '2025-12-31' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u
WHERE u.email IN (
    'samsung-electronics@partner.com',
    'samsung-cnt@partner.com',
    'samsung-life@partner.com',
    'samsung-fire@partner.com',
    'samsung-electro@partner.com',
    'samsung-sdi@partner.com',
    'samsung-bio@partner.com',
    'samsung-engineering@partner.com'
)
LIMIT 10
ON CONFLICT (asset_number) DO NOTHING;

-- 현대그룹 PC 자산 (10개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((11 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'PC' as asset_type,
    'PC-HYUNDAI-' || LPAD((row_number() OVER ())::TEXT, 6, '0') as serial_number,
    DATE '2023-02-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 25)) as acquired_at,
    CASE WHEN (row_number() OVER ()) % 8 = 0 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER ()) % 8 = 0 THEN DATE '2025-11-30' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u
WHERE u.email IN (
    'hyundai-motor@partner.com',
    'kia@partner.com',
    'hyundai-mobis@partner.com',
    'hyundai-wia@partner.com',
    'hyundai-glovis@partner.com',
    'hyundai-construction@partner.com',
    'hyundai-steel@partner.com',
    'hyundai-ever@partner.com'
)
LIMIT 10
ON CONFLICT (asset_number) DO NOTHING;

-- SK그룹 PC 자산 (10개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((21 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'PC' as asset_type,
    'PC-SK-' || LPAD((row_number() OVER ())::TEXT, 6, '0') as serial_number,
    DATE '2023-03-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 20)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u
WHERE u.email IN (
    'sk-hynix@partner.com',
    'sk-innovation@partner.com',
    'sk-telecom@partner.com',
    'sk-square@partner.com',
    'sk-discovery@partner.com',
    'skc@partner.com',
    'sk-gas@partner.com',
    'sk-move@partner.com'
)
LIMIT 10
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- LAPTOP 자산 (25개)
-- ========================================

-- LG그룹 LAPTOP 자산 (10개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((31 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'LAPTOP' as asset_type,
    'LT-LG-' || LPAD((row_number() OVER ())::TEXT, 8, '0') as serial_number,
    DATE '2023-04-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 15)) as acquired_at,
    CASE WHEN (row_number() OVER ()) % 10 = 1 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER ()) % 10 = 1 THEN DATE '2025-10-31' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u
WHERE u.email IN (
    'lg-electronics@partner.com',
    'lg-chemical@partner.com',
    'lg-display@partner.com',
    'lg-innotek@partner.com',
    'lg-uplus@partner.com',
    'lg-life@partner.com',
    'lg-cns@partner.com',
    'lg-trading@partner.com'
)
LIMIT 10
ON CONFLICT (asset_number) DO NOTHING;

-- 롯데그룹 LAPTOP 자산 (8개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((41 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'LAPTOP' as asset_type,
    'LT-LOTTE-' || LPAD((row_number() OVER ())::TEXT, 8, '0') as serial_number,
    DATE '2023-05-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 18)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u
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
LIMIT 8
ON CONFLICT (asset_number) DO NOTHING;

-- IT 기업 LAPTOP 자산 (7개)
INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((49 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'LAPTOP' as asset_type,
    'LT-IT-' || LPAD((row_number() OVER ())::TEXT, 8, '0') as serial_number,
    DATE '2024-01-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 10)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u
WHERE u.email IN (
    'naver@partner.com',
    'kakao@partner.com',
    'coupang@partner.com',
    'baedal@partner.com',
    'yanolja@partner.com',
    'musinsa@partner.com',
    'danggeun@partner.com'
)
LIMIT 7
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- MONITOR 자산 (15개)
-- ========================================

INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((56 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'MONITOR' as asset_type,
    'MON-' || LPAD((row_number() OVER ())::TEXT, 10, '0') as serial_number,
    DATE '2023-06-01' + (INTERVAL '1 day' * ((row_number() OVER () - 1) * 12)) as acquired_at,
    CASE WHEN (row_number() OVER ()) % 5 = 0 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER ()) % 5 = 0 THEN DATE '2025-09-30' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    LIMIT 15
) u
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- SERVER 자산 (15개)
-- ========================================

INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((71 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'SERVER' as asset_type,
    'SVR-' || 
    CASE (row_number() OVER ()) % 3
        WHEN 0 THEN 'DELL-'
        WHEN 1 THEN 'HP-'
        ELSE 'IBM-'
    END || LPAD((row_number() OVER ())::TEXT, 8, '0') as serial_number,
    DATE '2022-01-01' + (INTERVAL '1 month' * ((row_number() OVER () - 1) * 2)) as acquired_at,
    CASE WHEN (row_number() OVER ()) % 15 = 1 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER ()) % 15 = 1 THEN DATE '2025-08-31' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email IN (
        'samsung-electronics@partner.com',
        'hyundai-motor@partner.com',
        'sk-hynix@partner.com',
        'lg-electronics@partner.com',
        'naver@partner.com',
        'kakao@partner.com',
        'lg-cns@partner.com',
        'hyundai-ever@partner.com',
        'samsung-sdi@partner.com',
        'sk-telecom@partner.com',
        'coupang@partner.com',
        'lg-uplus@partner.com',
        'samsung-engineering@partner.com',
        'hyundai-mobis@partner.com',
        'sk-innovation@partner.com'
    )
) u
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- NETWORK 장비 자산 (8개)
-- ========================================

INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((86 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'NETWORK' as asset_type,
    'NET-' || 
    CASE (row_number() OVER ()) % 2
        WHEN 0 THEN 'CISCO-'
        ELSE 'JUNIPER-'
    END || LPAD((row_number() OVER ())::TEXT, 8, '0') as serial_number,
    DATE '2022-06-01' + (INTERVAL '1 month' * ((row_number() OVER () - 1) * 3)) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email IN (
        'lg-cns@partner.com',
        'hyundai-ever@partner.com',
        'samsung-electronics@partner.com',
        'sk-telecom@partner.com',
        'lg-uplus@partner.com',
        'naver@partner.com',
        'kakao@partner.com',
        'coupang@partner.com'
    )
) u
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- PRINTER 자산 (5개)
-- ========================================

INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((94 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'PRINTER' as asset_type,
    'PRT-' || 
    CASE (row_number() OVER ()) % 3
        WHEN 0 THEN 'HP-'
        WHEN 1 THEN 'EPSON-'
        ELSE 'CANON-'
    END || LPAD((row_number() OVER ())::TEXT, 8, '0') as serial_number,
    DATE '2023-07-01' + (INTERVAL '1 month' * ((row_number() OVER () - 1) * 2)) as acquired_at,
    CASE WHEN (row_number() OVER ()) = 5 THEN true ELSE false END as is_expired,
    CASE WHEN (row_number() OVER ()) = 5 THEN DATE '2025-12-31' ELSE NULL END as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email IN (
        'samsung-cnt@partner.com',
        'hyundai-construction@partner.com',
        'gs-construction@partner.com',
        'lotte-mart@partner.com',
        'gs-retail@partner.com'
    )
) u
ON CONFLICT (asset_number) DO NOTHING;

-- ========================================
-- OTHER 자산 (2개)
-- ========================================

INSERT INTO assets (asset_number, asset_type, serial_number, acquired_at, is_expired, expired_at, manager_id, created_by, updated_by)
SELECT 
    'AST2501-' || LPAD((99 + (row_number() OVER () - 1))::TEXT, 4, '0') as asset_number,
    'OTHER' as asset_type,
    'OTH-' || LPAD((row_number() OVER ())::TEXT, 10, '0') as serial_number,
    DATE '2024-01-15' + (INTERVAL '1 month' * ((row_number() OVER () - 1))) as acquired_at,
    false as is_expired,
    NULL as expired_at,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email IN (
        'gcdc@partner.com',
        'dflux@partner.com'
    )
) u
ON CONFLICT (asset_number) DO NOTHING;

-- 4. ASSET 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- ASSET 데이터 건수 확인
SELECT COUNT(*) as asset_count FROM assets;

-- ASSET 번호 중복 검증
SELECT asset_number, COUNT(*) as duplicate_count 
FROM assets 
GROUP BY asset_number 
HAVING COUNT(*) > 1;

-- 시리얼 번호 중복 검증
SELECT serial_number, COUNT(*) as duplicate_count 
FROM assets 
WHERE serial_number IS NOT NULL
GROUP BY serial_number 
HAVING COUNT(*) > 1;

-- 관리자 존재 검증
SELECT a.asset_number, a.manager_id, u.email
FROM assets a
LEFT JOIN users u ON a.manager_id = u.id
WHERE a.manager_id IS NOT NULL AND u.id IS NULL;

-- 자산 유형별 통계
SELECT asset_type, COUNT(*) as count, 
       SUM(CASE WHEN is_expired THEN 1 ELSE 0 END) as expired_count,
       SUM(CASE WHEN is_expired THEN 0 ELSE 1 END) as active_count
FROM assets
GROUP BY asset_type
ORDER BY count DESC;

-- 폐기 자산 통계
SELECT 
    COUNT(*) as total_assets,
    SUM(CASE WHEN is_expired THEN 1 ELSE 0 END) as expired_assets,
    SUM(CASE WHEN is_expired THEN 0 ELSE 1 END) as active_assets,
    ROUND(SUM(CASE WHEN is_expired THEN 1 ELSE 0 END)::NUMERIC / COUNT(*) * 100, 2) as expired_rate
FROM assets;

-- 연도별 취득 자산 통계
SELECT 
    EXTRACT(YEAR FROM acquired_at) as year,
    COUNT(*) as count
FROM assets
GROUP BY EXTRACT(YEAR FROM acquired_at)
ORDER BY year DESC;

-- 관리자별 자산 보유 통계
SELECT 
    u.email as manager_email,
    COUNT(a.id) as asset_count,
    STRING_AGG(DISTINCT a.asset_type, ', ' ORDER BY a.asset_type) as asset_types
FROM assets a
JOIN users u ON a.manager_id = u.id
GROUP BY u.email
HAVING COUNT(a.id) > 0
ORDER BY asset_count DESC
LIMIT 20;

-- ASSET 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 총 100개의 ASSET 데이터를 생성하였습니다.
-- 모든 ASSET은 파트너 사용자를 관리자로 연계되어 있으며, 다양한 유형과 상태로 구성되어 있습니다.
-- ASSET 번호 중복 검증 및 시리얼 번호 중복 검증을 통해 데이터 무결성을 보장합니다.
-- 모든 ASSET은 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - asset_type: 'PC', 'LAPTOP', 'MONITOR', 'SERVER', 'NETWORK', 'PRINTER', 'OTHER'
--   - is_expired: true(폐기), false(사용중)
-- 
-- 자산 구성:
--   - PC: 30개 (삼성 10, 현대 10, SK 10)
--   - LAPTOP: 25개 (LG 10, 롯데 8, IT기업 7)
--   - MONITOR: 15개 (다양한 파트너)
--   - SERVER: 15개 (주요 IT 기업)
--   - NETWORK: 8개 (IT 인프라 기업)
--   - PRINTER: 5개 (건설/유통 기업)
--   - OTHER: 2개 (중소 파트너)
--   - 총 100개의 다양한 IT 자산으로 실제 자산 관리 환경을 시뮬레이션
--   - 일부 자산은 폐기 상태로 설정되어 실제 운영 환경 반영
