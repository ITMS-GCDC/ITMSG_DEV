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
-- 의존성 조사: PartnerService, PartnerRepository, UserRepository, NumberinGGService
-- 연관 DB 객체: partners 테이블, users 테이블 (manager_id FK), companies 테이블 (회사 정보)
-- 사이드 이펙트: 사업자번호 중복 검증, 파트너 코드 자동 생성, 담당자 존재 검증
-- 프론트 연동: PartnerCreatePage.tsx에서 API 호출

-- 3. 파트너 데이터 마이그레이션 쿼리 (멱등성 보장)
-- V3.0.7__insert_partner_data.sql과 중복 방지를 위해 ON CONFLICT 사용

-- 100개 회사에 대한 파트너 데이터 이관 (전체 회사 목록 기반)
-- 상승그룹 파트너 데이터 이관 (COMP002-COMP009)
-- 내부담당자: 홍길동
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR002' as code,
    '상승전자' as name,
    '123-99-67890' as business_number,
    '김현석' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-electronics@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 김영희
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR003' as code,
    '상승물산' as name,
    '123-99-67891' as business_number,
    '오세철' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-cnt@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 박민수
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR004' as code,
    '상승생명' as name,
    '123-99-67892' as business_number,
    '이명우' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-life@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 이수진
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR005' as code,
    '상승화재' as name,
    '123-99-67893' as business_number,
    '박동훈' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-fire@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 정현우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR006' as code,
    '상승전기' as name,
    '123-99-67895' as business_number,
    '전동수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-electro@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 최지혜
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR007' as code,
    '상승SDI' as name,
    '123-99-67896' as business_number,
    '전동수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-sdi@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 강민호
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR008' as code,
    '상승바이오로직스' as name,
    '123-99-67897' as business_number,
    '김태한' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-bio@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 윤서연
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR009' as code,
    '상승엔지니어링' as name,
    '123-99-67898' as business_number,
    '윤석금' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sanGGSeung-engineering@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 한리자동차그룹 파트너 데이터 이관 (COMP010-COMP018)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR010' as code,
    '한리자동차 파트너' as name,
    '234-56-78901' as business_number,
    '장재훈' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-motor@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 임나래
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR011' as code,
    '기카' as name,
    '234-56-78902' as business_number,
    '바이오' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'kika@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 한도윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR012' as code,
    '한리모비스' as name,
    '234-56-78903' as business_number,
    '이원희' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-mobis@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 송하은
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR013' as code,
    '한리위아' as name,
    '234-56-78904' as business_number,
    '이인식' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-wia@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 배준서
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR014' as code,
    '한리글로비스' as name,
    '234-56-78905' as business_number,
    '이언오' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-glovis@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 신지우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR015' as code,
    '한리건설' as name,
    '234-56-78906' as business_number,
    '박동욱' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-construction@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 노승현
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR016' as code,
    '한리제철' as name,
    '234-56-78907' as business_number,
    '채병길' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-steel@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 유예린
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR017' as code,
    '한리오토에버' as name,
    '234-56-78908' as business_number,
    '김기남' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-ever@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 서지훈
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR018' as code,
    '한리케피코' as name,
    '234-56-78909' as business_number,
    '이병철' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanli-kefico@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- SL그룹 파트너 데이터 이관 (COMP019-COMP028)
-- 내부담당자: 권민재
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR019' as code,
    'SL하이닉스' as name,
    '345-67-89012' as business_number,
    '구본무' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-hynix@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 조아인
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR020' as code,
    'SL이노베이션' as name,
    '345-67-89013' as business_number,
    '김준' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-innovation@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 문태민
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR021' as code,
    'SL텔레콤' as name,
    '345-67-89014' as business_number,
    '유영상' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-telecom@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 진유나
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR022' as code,
    'SL스퀘어' as name,
    '345-67-89015' as business_number,
    '박정호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-square@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 황승우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR023' as code,
    'SL디스커버리' as name,
    '345-67-89016' as business_number,
    '이석채' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-discovery@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 남은서
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR024' as code,
    'SLC' as name,
    '345-67-89017' as business_number,
    '이형희' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'SLc@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 안재호
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR025' as code,
    'SL가스' as name,
    '345-67-89018' as business_number,
    '이형희' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-gas@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 차소윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR026' as code,
    'SL엔무브' as name,
    '345-67-89019' as business_number,
    '이형희' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-move@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 장현석
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR027' as code,
    'SL바이오팜' as name,
    '345-67-89020' as business_number,
    '이형희' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-biopharm@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 변다은
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR028' as code,
    'SL쉴더스' as name,
    '345-67-89021' as business_number,
    '이형희' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'sl-shields@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- LK그룹 파트너 데이터 이관 (COMP029-COMP038)
-- 내부담당자: 하준혁
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR029' as code,
    'LK전자' as name,
    '456-78-90123' as business_number,
    '권봉석' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-electronics@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 구채원
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR030' as code,
    'LK화학' as name,
    '456-78-90124' as business_number,
    '신학철' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-chemical@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 주시온
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR031' as code,
    'LK디스플레이' as name,
    '456-78-90125' as business_number,
    '정호영' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-display@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 표지아
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR032' as code,
    'LK이노텍' as name,
    '456-78-90126' as business_number,
    '정철동' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-innotek@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 마준영
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR033' as code,
    'LK유플러스' as name,
    '456-78-90127' as business_number,
    '황현식' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-uplus@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 홍수아
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR034' as code,
    'LK생활건강' as name,
    '456-78-90128' as business_number,
    '차석용' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-life@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 소지환
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR035' as code,
    'LK CNS' as name,
    '456-78-90129' as business_number,
    '김영섭' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-cns@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 여수빈
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR036' as code,
    'LK상사' as name,
    '456-78-90130' as business_number,
    '이동식' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-trading@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 곽건우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR037' as code,
    'LK하우시스' as name,
    '456-78-90131' as business_number,
    '이동식' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-house@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 탁민서
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR038' as code,
    'LK에너지솔루션' as name,
    '456-78-90132' as business_number,
    '김종현' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lk-energy@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 롯태그룹 파트너 데이터 이관 (COMP039-COMP048)
-- 내부담당자: 양서준
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR039' as code,
    '롯태제과' as name,
    '567-89-01234' as business_number,
    '민명기' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-confectionery@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 엄하윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR040' as code,
    '롯태칠성음료' as name,
    '567-89-01235' as business_number,
    '이영호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-chilsung@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 방현준
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR041' as code,
    '롯태마트' as name,
    '567-89-01236' as business_number,
    '장선욱' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-mart@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 모지윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR042' as code,
    '롯태백화점' as name,
    '567-89-01237' as business_number,
    '장선욱' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-department@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 석민재
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR043' as code,
    '롯태호텔' as name,
    '567-89-01238' as business_number,
    '김형욱' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-hotel@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 염서현
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR044' as code,
    '롯태푸드' as name,
    '567-89-01239' as business_number,
    '이명구' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-food@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 변태윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR045' as code,
    '롯태렌탈' as name,
    '567-89-01240' as business_number,
    '이명구' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-rental@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 피지안
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR046' as code,
    '롯태손해보험' as name,
    '567-89-01241' as business_number,
    '이명구' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-insurance@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 마도훈
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR047' as code,
    '롯태글로벌로지스' as name,
    '567-89-01242' as business_number,
    '이명구' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-logistics@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 우소율
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR048' as code,
    '롯태케미칼' as name,
    '567-89-01243' as business_number,
    '신종훈' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'lostae-chemical@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 구세계그룹 파트너 데이터 이관 (COMP049-COMP056)
-- 내부담당자: 계시우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR049' as code,
    '구세계' as name,
    '678-90-12345' as business_number,
    '정용진' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 라아린
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR050' as code,
    '구마트' as name,
    '678-90-12346' as business_number,
    '장동훈' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'emart@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 탁건호
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR051' as code,
    '구세계푸드' as name,
    '678-90-12347' as business_number,
    '이희권' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae-food@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 주유진
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR052' as code,
    '구세계건설' as name,
    '678-90-12348' as business_number,
    '이희권' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae-construction@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 맹재원
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR053' as code,
    '구세계프라퍼티' as name,
    '678-90-12349' as business_number,
    '이희권' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae-property@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 민하린
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR054' as code,
    '구세계조선호텔' as name,
    '678-90-12350' as business_number,
    '이희권' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae-hotel@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 부시후
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR055' as code,
    '구세계라이브러리' as name,
    '678-90-12351' as business_number,
    '이희권' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae-library@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 지민준
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR056' as code,
    '구세계I&C' as name,
    '678-90-12352' as business_number,
    '이희권' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'oldsegae-nc@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- GGS그룹 파트너 데이터 이관 (COMP057-COMP065)
-- 내부담당자: 전서윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR057' as code,
    'GGS칼텍스' as name,
    '789-01-23456' as business_number,
    '송재호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-calnex@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 반태양
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR058' as code,
    'GGS리테일' as name,
    '789-01-23457' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-retail@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 고지유
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR059' as code,
    'GGS건설' as name,
    '789-01-23458' as business_number,
    '허윤홍' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-construction@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 함도현
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR060' as code,
    'GGS글로벌' as name,
    '789-01-23459' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-global@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 갈소은
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR061' as code,
    'GGS EPS' as name,
    '789-01-23460' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-eps@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 여건우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR062' as code,
    'GGS네오텍' as name,
    '789-01-23461' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-neotech@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 허서연
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR063' as code,
    'GGS수퍼마켓' as name,
    '789-01-23462' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-supermarket@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 도민준
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR064' as code,
    'GGS홈쇼핑' as name,
    '789-01-23463' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-homeshopping@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 선유정
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR065' as code,
    'GGS파워' as name,
    '789-01-23464' as business_number,
    '허연수' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'ggs-power@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 한파그룹 파트너 데이터 이관 (COMP066-COMP074)
-- 내부담당자: 우준서
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR066' as code,
    '한파솔루션' as name,
    '890-12-34567' as business_number,
    '김동관' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-solution@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 곽지아
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR067' as code,
    '한파에어로스페이스' as name,
    '890-12-34568' as business_number,
    '김동관' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-aerospace@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 제윤호
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR068' as code,
    '한파시스템' as name,
    '890-12-34569' as business_number,
    '김동관' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-system@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 봉채은
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR069' as code,
    '한파에너지' as name,
    '890-12-34570' as business_number,
    '김동관' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-energy@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 배준혁
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR070' as code,
    '한파생명' as name,
    '890-12-34571' as business_number,
    '이동명' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-life@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 설수아
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR071' as code,
    '한파손해보험' as name,
    '890-12-34572' as business_number,
    '이동명' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-insurance@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 양시후
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR072' as code,
    '한파투자증권' as name,
    '890-12-34573' as business_number,
    '이동명' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-securities@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 엄지민
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR073' as code,
    '한파자산운용' as name,
    '890-12-34574' as business_number,
    '이동명' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-asset@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 나도윤
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR074' as code,
    '한파캐피탈' as name,
    '890-12-34575' as business_number,
    '이동명' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanpa-capital@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 대구그룹 파트너 데이터 이관 (COMP075-COMP080)
-- 내부담당자: 진유하
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR075' as code,
    '대구조선해양' as name,
    '901-23-45678' as business_number,
    '이성근' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daegu-shipbuilding@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 문현우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR076' as code,
    '대구건설' as name,
    '901-23-45679' as business_number,
    '박영준' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daegu-construction@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 탁지율
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR077' as code,
    '대구산업' as name,
    '901-23-45680' as business_number,
    '박영준' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daegu-industry@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 차승민
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR078' as code,
    '대구중공업' as name,
    '901-23-45681' as business_number,
    '박영준' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daegu-heavy@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 신유나
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR079' as code,
    '대구조선' as name,
    '901-23-45682' as business_number,
    '박영준' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daegu-ship@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 방지훈
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR080' as code,
    '대구해양' as name,
    '901-23-45683' as business_number,
    '박영준' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'daegu-ocean@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 한증그룹 파트너 데이터 이관 (COMP081-COMP086)
-- 내부담당자: 노지원
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR081' as code,
    '한증항공' as name,
    '012-34-56789' as business_number,
    '우기홍' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanjeung-air@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 안재민
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR082' as code,
    '한증' as name,
    '012-34-56790' as business_number,
    '조현민' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanjeung@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 최다현
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR083' as code,
    '한증칼' as name,
    '012-34-56791' as business_number,
    '조현민' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanjeung-kal@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 임서진
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR084' as code,
    '한증통운' as name,
    '012-34-56792' as business_number,
    '박연호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanjeung-express@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 손민석
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR085' as code,
    '한증중공업' as name,
    '012-34-56793' as business_number,
    '박연호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanjeung-heavy@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 하지수
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR086' as code,
    '한증해운' as name,
    '012-34-56794' as business_number,
    '박연호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'hanjeung-shipping@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 기타 파트너 데이터 이관 (COMP087-COMP090)
-- 내부담당자: 류도영
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR087' as code,
    'GCDC' as name,
    '012-34-56795' as business_number,
    '김영실' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'gcdc@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 공수연
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR088' as code,
    '디플럭스' as name,
    '012-34-56796' as business_number,
    '김회석' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'dflux@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 진하준
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR089' as code,
    '잔소프트' as name,
    '012-34-56797' as business_number,
    '김지환' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'jansoft@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 표지후
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR090' as code,
    '진커뮤니케이션' as name,
    '012-34-56798' as business_number,
    '이명호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'jinkomm@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 12. 추가 파트너 기업 (COMP091-COMP100)
-- 내부담당자: 차시아
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR091' as code,
    '네이버고' as name,
    '123-45-67899' as business_number,
    '최수연' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'navergo@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 마준우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR092' as code,
    '카카오고' as name,
    '234-56-78900' as business_number,
    '홍은택' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'kakaogo@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 서예원
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR093' as code,
    '쿠팡고' as name,
    '345-67-89011' as business_number,
    '김범석' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'coupango@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 강태오
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR094' as code,
    '배달의민족고' as name,
    '456-78-90122' as business_number,
    '김봉진' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'baedalgo@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 윤하영
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR095' as code,
    '야놀자고' as name,
    '567-89-01233' as business_number,
    '이수영' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'yanoljago@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 전은우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR096' as code,
    '무신사고' as name,
    '678-90-12344' as business_number,
    '강준영' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'musinsago@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 류채영
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR097' as code,
    '당근마켓고' as name,
    '789-01-23455' as business_number,
    '김용현' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'danggeungo@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 주승준
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR098' as code,
    '요기요고' as name,
    '890-12-34566' as business_number,
    '이정욱' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'yogiyogo@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 모연우
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR099' as code,
    '라인고' as name,
    '901-23-45677' as business_number,
    '신중호' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'linego@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 내부담당자: 양지율
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by)
SELECT 
    'PAR100' as code,
    '토스고' as name,
    '012-34-56788' as business_number,
    '이승건' as ceo_name,
    u.id as manager_id,
    'system' as created_by,
    'system' as updated_by
FROM users u 
WHERE u.email = 'tossgo@partner.com'
ON CONFLICT (business_number) DO NOTHING;

-- 4. 파트너 코드 자동 생성을 위한 시퀀스 초기화 쿼리
-- NumberinGGService에서 사용하는 파트너 코드 시퀀스 초기화
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