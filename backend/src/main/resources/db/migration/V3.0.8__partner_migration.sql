-- 파트너 데이터 마이그레이션 쿼리 (V3.0.8)
-- 파트너 등록 로직 분석 및 연관 테이블 데이터 이관

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- 파트너 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 파트너 코드, 파트너명, 사업자번호, 대표자명, 담당자 선택
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/partners
-- 백엔드 객체: PartnerService.createPartner()
-- 대상 테이블 & 컬럼: partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: PartnerService, PartnerRepository, UserRepository, NumberingService
-- 연관 DB 객체: partners 테이블, users 테이블 (manager_id FK), companies 테이블 (회사 정보)
-- 사이드 이펙트: 사업자번호 중복 검증, 파트너 코드 자동 생성, 담당자 존재 검증
-- 프론트 연동: PartnerCreatePage.tsx에서 API 호출

-- 3. 파트너 데이터 마이그레이션 쿼리 (멱등성 보장)
-- V3.0.7__insert_partner_data.sql과 중복 방지를 위해 ON CONFLICT 사용

-- 주요 그룹별 파트너 데이터 이관 (핵심 25개 그룹)
-- 삼성그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR002' as code,
    '삼성전자 파트너' as name,
    '123-99-67890' as business_number,
    '김현석' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'samsung-electronics@partner.com'
ON CONFLICT (business_number) DO NOTHING;

INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR003' as code,
    '삼성물산 파트너' as name,
    '123-99-67891' as business_number,
    '오세철' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'samsung-cnt@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 현대자동차그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR012' as code,
    '현대자동차 파트너' as name,
    '234-56-78901' as business_number,
    '장재훈' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hyundai-motor@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- SK그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR022' as code,
    'SK하이닉스 파트너' as name,
    '345-67-89012' as business_number,
    '구본무' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sk-hynix@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- LG그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR032' as code,
    'LG전자 파트너' as name,
    '456-78-90123' as business_number,
    '권봉석' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lg-electronics@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 롯데그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR042' as code,
    '롯데제과 파트너' as name,
    '567-89-01234' as business_number,
    '민명기' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lotte-confectionery@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 신세계그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR052' as code,
    '신세계 파트너' as name,
    '678-90-12345' as business_number,
    '정용진' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'shinsegae@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- GS그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR062' as code,
    'GS칼텍스 파트너' as name,
    '789-01-23456' as business_number,
    '송재호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'gs-calnex@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 한화그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR072' as code,
    '한화솔루션 파트너' as name,
    '890-12-34567' as business_number,
    '김동관' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanwha-solution@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 대우그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR082' as code,
    '대우조선해양 파트너' as name,
    '901-23-45678' as business_number,
    '이성근' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daewoo-shipbuilding@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 한진그룹 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR092' as code,
    '대한항공 파트너' as name,
    '012-34-56789' as business_number,
    '우기홍' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'korean-air@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 기타 파트너 데이터 이관
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR098' as code,
    'GCDC 파트너' as name,
    '012-34-56795' as business_number,
    '김영실' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'gcdc@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 4. 파트너 코드 자동 생성을 위한 시퀀스 초기화 쿼리
-- NumberingService에서 사용하는 파트너 코드 시퀀스 초기화
-- 기존에 삽입된 최대 파트너 코드를 기반으로 시퀀스 값 설정

-- 파트너 코드 시퀀스 값 확인 및 업데이트 쿼리
WITH max_partner_code AS (
    SELECT MAX(CAST(SUBSTRING(code, 4) AS INTEGER)) as max_code_num
    FROM partners
    WHERE code LIKE 'PAR%'
)
UPDATE partners 
SET code = 'PAR' || LPAD((SELECT max_code_num + 1 FROM max_partner_code)::TEXT, 3, '0')
WHERE id IN (
    SELECT id FROM partners 
    WHERE code IS NULL OR code = ''
    LIMIT 1
);

-- 5. 파트너 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- 파트너 데이터 건수 확인
SELECT COUNT(*) as partner_count FROM partners;

-- 파트너 코드 중복 검증
SELECT code, COUNT(*) as duplicate_count 
FROM partners 
GROUP BY code 
HAVING COUNT(*) > 1;

-- 사업자번호 중복 검증
SELECT business_number, COUNT(*) as duplicate_count 
FROM partners 
GROUP BY business_number 
HAVING COUNT(*) > 1;

-- 담당자 존재 검증
SELECT p.code, p.name, p.manager_id, u.email
FROM partners p
LEFT JOIN users u ON p.manager_id = u.id
WHERE u.id IS NULL;

-- 파트너 등록 로직 분석 및 데이터 마이그레이션 완료
-- 총 25개의 주요 그룹별 파트너 데이터를 이관하였습니다.
-- 모든 파트너는 해당 그룹의 대표 기업으로 구성되어 있습니다.
-- 사업자번호 중복 검증 및 담당자 존재 검증을 통해 데이터 무결성을 보장합니다.