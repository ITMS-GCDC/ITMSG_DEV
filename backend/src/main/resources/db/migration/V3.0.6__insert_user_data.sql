-- 파트너 회사 데이터 삽입 (파트너 기업들을 별도의 회사로 등록)
-- 파트너 기업들을 companies 테이블에 등록합니다.

-- 1. 삼성그룹 계열사 (Samsung Group Affiliates)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP002', '삼성전자', '123-99-67890', '김현석', '서울특별시 영등포구 여의도동 60', '02-2222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP003', '삼성물산', '123-99-67891', '오세철', '서울특별시 중구 을지로 30', '02-3333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP004', '삼성생명', '123-99-67892', '이명우', '서울특별시 중구 남대문로 5가 1-1', '02-4444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP005', '삼성화재', '123-99-67893', '박동훈', '서울특별시 중구 퇴계로 30', '02-5555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP006', '삼성전기', '123-99-67895', '전동수', '경기도 수원시 영통구 삼성로 129', '031-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP007', '삼성SDI', '123-99-67896', '전동수', '경기도 용인시 기흥구 삼성로 1', '031-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP008', '삼성바이오로직스', '123-99-67897', '김태한', '인천광역시 연수구 컨벤시아로 117', '032-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP009', '삼성엔지니어링', '123-99-67898', '윤석금', '서울특별시 영등포구 여의도동 3', '02-6666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 2. 현대자동차그룹 계열사 (Hyundai Auto Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP010', '현대자동차', '234-56-78901', '장재훈', '서울특별시 서초구 서초대로 148', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP011', '기아', '234-56-78902', '바이오', '서울특별시 양천구 염창동 403-3', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP012', '현대모비스', '234-56-78903', '이원희', '서울특별시 강남구 영동대로 511', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP013', '현대위아', '234-56-78904', '이인식', '서울특별시 영등포구 여의도동 3', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP014', '현대글로비스', '234-56-78905', '이언오', '서울특별시 중구 청계천로 10', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP015', '현대건설', '234-56-78906', '박동욱', '서울특별시 종로구 종로 4', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP016', '현대제철', '234-56-78907', '채병길', '인천광역시 남동구 논고동 53-2', '032-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP017', '현대오토에버', '234-56-78908', '김기남', '서울특별시 영등포구 여의도동 3', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP018', '현대케피코', '234-56-78909', '이병철', '대전광역시 유성구 가정북로 100', '042-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 3. SK그룹 계열사 (SK Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP019', 'SK하이닉스', '345-67-89012', '구본무', '경기도 이천시 모현읍 모현로 1', '031-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP020', 'SK이노베이션', '345-67-89013', '김준', '서울특별시 중구 퇴계로 30', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP021', 'SK텔레콤', '345-67-89014', '유영상', '서울특별시 중구 퇴계로 111', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP022', 'SK스퀘어', '345-67-89015', '박정호', '서울특별시 중구 퇴계로 30', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP023', 'SK디스커버리', '345-67-89016', '이석채', '서울특별시 중구 퇴계로 30', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP024', 'SKC', '345-67-89017', '이형희', '서울특별시 중구 퇴계로 30', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP025', 'SK가스', '345-67-89018', '이형희', '서울특별시 중구 퇴계로 30', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP026', 'SK엔무브', '345-67-89019', '이형희', '서울특별시 중구 퇴계로 30', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP027', 'SK바이오팜', '345-67-89020', '이형희', '서울특별시 중구 퇴계로 30', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP028', 'SK쉴더스', '345-67-89021', '이형희', '서울특별시 중구 퇴계로 30', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 4. LG그룹 계열사 (LG Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP029', 'LG전자', '456-78-90123', '권봉석', '서울특별시 영등포구 여의도동 128', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP030', 'LG화학', '456-78-90124', '신학철', '서울특별시 영등포구 여의도동 128', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP031', 'LG디스플레이', '456-78-90125', '정호영', '서울특별시 영등포구 여의도동 128', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP032', 'LG이노텍', '456-78-90126', '정철동', '서울특별시 영등포구 여의도동 128', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP033', 'LG유플러스', '456-78-90127', '황현식', '서울특별시 영등포구 여의도동 128', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP034', 'LG생활건강', '456-78-90128', '차석용', '서울특별시 영등포구 여의도동 128', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP035', 'LG CNS', '456-78-90129', '김영섭', '서울특별시 영등포구 여의도동 128', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP036', 'LG상사', '456-78-90130', '이동식', '서울특별시 영등포구 여의도동 128', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP037', 'LG하우시스', '456-78-90131', '이동식', '서울특별시 영등포구 여의도동 128', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP038', 'LG에너지솔루션', '456-78-90132', '김종현', '서울특별시 영등포구 여의도동 128', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 5. 롯데그룹 계열사 (Lotte Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP039', '롯데제과', '567-89-01234', '민명기', '서울특별시 중구 남대문로 120', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP040', '롯데칠성음료', '567-89-01235', '이영호', '서울특별시 중구 남대문로 120', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP041', '롯데마트', '567-89-01236', '장선욱', '서울특별시 중구 남대문로 120', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP042', '롯데백화점', '567-89-01237', '장선욱', '서울특별시 중구 남대문로 120', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP043', '롯데호텔', '567-89-01238', '김형욱', '서울특별시 중구 남대문로 120', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP044', '롯데푸드', '567-89-01239', '이명구', '서울특별시 중구 남대문로 120', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP045', '롯데렌탈', '567-89-01240', '이명구', '서울특별시 중구 남대문로 120', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP046', '롯데손해보험', '567-89-01241', '이명구', '서울특별시 중구 남대문로 120', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP047', '롯데글로벌로지스', '567-89-01242', '이명구', '서울특별시 중구 남대문로 120', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP048', '롯데케미칼', '567-89-01243', '신종훈', '서울특별시 중구 남대문로 120', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 6. 신세계그룹 계열사 (Shinsegae Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP049', '신세계', '678-90-12345', '정용진', '서울특별시 중구 중앙로 88', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP050', '이마트', '678-90-12346', '장동훈', '서울특별시 중구 중앙로 88', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP051', '신세계푸드', '678-90-12347', '이희권', '서울특별시 중구 중앙로 88', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP052', '신세계건설', '678-90-12348', '이희권', '서울특별시 중구 중앙로 88', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP053', '신세계프라퍼티', '678-90-12349', '이희권', '서울특별시 중구 중앙로 88', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP054', '신세계조선호텔', '678-90-12350', '이희권', '서울특별시 중구 중앙로 88', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP055', '신세계라이브러리', '678-90-12351', '이희권', '서울특별시 중구 중앙로 88', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP056', '신세계I&C', '678-90-12352', '이희권', '서울특별시 중구 중앙로 88', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 7. GS그룹 계열사 (GS Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP057', 'GS칼텍스', '789-01-23456', '송재호', '서울특별시 중구 소공로 106', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP058', 'GS리테일', '789-01-23457', '허연수', '서울특별시 중구 소공로 106', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP059', 'GS건설', '789-01-23458', ' 허윤홍', '서울특별시 중구 소공로 106', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP060', 'GS글로벌', '789-01-23459', ' 허연수', '서울특별시 중구 소공로 106', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP061', 'GS EPS', '789-01-23460', ' 허연수', '서울특별시 중구 소공로 106', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP062', 'GS네오텍', '789-01-23461', ' 허연수', '서울특별시 중구 소공로 106', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP063', 'GS수퍼마켓', '789-01-23462', ' 허연수', '서울특별시 중구 소공로 106', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP064', 'GS홈쇼핑', '789-01-23463', ' 허연수', '서울특별시 중구 소공로 106', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP065', 'GS파워', '789-01-23464', ' 허연수', '서울특별시 중구 소공로 106', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 8. 한화그룹 계열사 (Hanwha Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP066', '한화솔루션', '890-12-34567', '김동관', '서울특별시 중구 세종대로 134', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP067', '한화에어로스페이스', '890-12-34568', '김동관', '서울특별시 중구 세종대로 134', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP068', '한화시스템', '890-12-34569', '김동관', '서울특별시 중구 세종대로 134', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP069', '한화에너지', '890-12-34570', '김동관', '서울특별시 중구 세종대로 134', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP070', '한화생명', '890-12-34571', '이동명', '서울특별시 중구 세종대로 134', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP071', '한화손해보험', '890-12-34572', '이동명', '서울특별시 중구 세종대로 134', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP072', '한화투자증권', '890-12-34573', '이동명', '서울특별시 중구 세종대로 134', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP073', '한화자산운용', '890-12-34574', '이동명', '서울특별시 중구 세종대로 134', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP074', '한화캐피탈', '890-12-34575', '이동명', '서울특별시 중구 세종대로 134', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 9. 대우그룹 계열사 (Daewoo Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP075', '대우조선해양', '901-23-45678', '이성근', '경상남도 거제시 고현동 100', '055-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP076', '대우건설', '901-23-45679', '박영준', '서울특별시 영등포구 여의도동 10', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP077', '대우산업', '901-23-45680', '박영준', '서울특별시 영등포구 여의도동 10', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP078', '대우중공업', '901-23-45681', '박영준', '서울특별시 영등포구 여의도동 10', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP079', '대우조선', '901-23-45682', '박영준', '경상남도 거제시 고현동 100', '055-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP080', '대우해양', '901-23-45683', '박영준', '경상남도 거제시 고현동 100', '055-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 10. 한진그룹 계열사 (Hanjin Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP081', '대한항공', '012-34-56789', '우기홍', '서울특별시 강서구 공항로 209', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP082', '한진', '012-34-56790', '조현민', '서울특별시 중구 퇴계로 111', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP083', '한진칼', '012-34-56791', '조현민', '서울특별시 중구 퇴계로 111', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP084', '대한통운', '012-34-56792', '박연호', '서울특별시 중구 퇴계로 111', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP085', '한진중공업', '012-34-56793', '박연호', '서울특별시 중구 퇴계로 111', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP086', '한진해운', '012-34-56794', '박연호', '서울특별시 중구 퇴계로 111', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 11. 기타 파트너 기업
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP087', 'GCDC', '012-34-56795', '김영실', '서울특별시 강남구 테헤란로 151', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP088', '디플럭스', '012-34-56796', '김회석', '서울특별시 강남구 테헤란로 151', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP089', '잔소프트', '012-34-56797', '김지환', '서울특별시 강남구 테헤란로 151', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP090', '진커뮤니케이션', '012-34-56798', '이명호', '서울특별시 강남구 테헤란로 151', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 12. 추가 파트너 기업 (COMP091-COMP100)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP091', '네이버', '123-45-67899', '최수연', '경기도 성남시 분당구 정자동 1781', '031-908-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP092', '카카오', '234-56-78900', '홍은택', '서울특별시 서초구 서초대로 77길 55', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP093', '쿠팡', '345-67-89011', '김범석', '서울특별시 송파구 올림픽로 35', '02-123-4567', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP094', '배달의민족', '456-78-90122', '김봉진', '서울특별시 강남구 테헤란로 14길 6', '02-2108-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP095', '야놀자', '567-89-01233', '이수영', '서울특별시 강남구 영동대로 511', '02-2108-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP096', '무신사', '678-90-12344', '강준영', '서울특별시 강남구 영동대로 511', '02-2108-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP097', '당근마켓', '789-01-23455', '김용현', '서울특별시 서초구 서초대로 77길 55', '02-2108-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP098', '요기요', '890-12-34566', '이정욱', '서울특별시 강남구 영동대로 511', '02-2108-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP099', '라인', '901-23-45677', '신중호', '서울특별시 강남구 영동대로 511', '02-2108-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP100', '토스', '012-34-56788', '이승건', '서울특별시 강남구 영동대로 511', '02-2108-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 파트너별 담당자(사용자) 데이터 삽입
-- 각 파트너당 1명의 담당자를 생성합니다.
-- 비밀번호: admin1234 (BCrypt 해시: $2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa)

-- 1. 삼성그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-electronics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성전자 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP002'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-cnt@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성물산 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP003'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성생명 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP004'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-fire@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성화재 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP005'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-electro@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성전기 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP006'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-sdi@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성SDI 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP007'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-bio@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성바이오로직스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP008'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-engineering@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성엔지니어링 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP009'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung-cnt2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성물산 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP003'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 2. 현대자동차그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-motor@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대자동차 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP010'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('kia@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '기아 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP011'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-mobis@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대모비스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP012'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-wia@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대위아 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP013'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-glovis@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대글로비스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP014'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP015'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-steel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대제철 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP016'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-ever@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대오토에버 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP017'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-kefico@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대케피코 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP018'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-wia2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대위아 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP013'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 3. SK그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-hynix@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK하이닉스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP019'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-innovation@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK이노베이션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP020'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-telecom@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK텔레콤 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP021'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-square@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK스퀘어 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP022'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-discovery@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK디스커버리 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP023'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('skc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SKC 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP024'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-gas@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK가스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP025'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-move@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK엔무브 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP026'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-biopharm@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK바이오팜 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP027'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-shields@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK쉴더스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP028'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 4. LG그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-electronics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG전자 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP029'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-chemical@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG화학 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP030'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-display@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG디스플레이 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP031'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-innotek@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG이노텍 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP032'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-uplus@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG유플러스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP033'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG생활건강 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP034'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-cns@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG CNS 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP035'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-trading@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG상사 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP036'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-house@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG하우시스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP037'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-energy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG에너지솔루션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP038'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 5. 롯데그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-confectionery@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데제과 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP039'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-chilsung@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데칠성음료 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP040'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-mart@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데마트 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP041'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-department@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데백화점 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP042'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-hotel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데호텔 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP043'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-food@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데푸드 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP044'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-rental@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데렌탈 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP045'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-insurance@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데손해보험 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP046'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-logistics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데글로벌로지스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP047'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-chemical@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데케미칼 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP048'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 6. 신세계그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP049'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('emart@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '이마트 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP050'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-food@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계푸드 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP051'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP052'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-property@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계프라퍼티 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP053'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-hotel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계조선호텔 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP054'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-library@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계라이브러리 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP055'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-nc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계I&C 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP056'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-property2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계프라퍼티 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP053'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae-food2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계푸드 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP051'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 7. GS그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-calnex@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS칼텍스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP057'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-retail@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS리테일 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP058'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP059'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-global@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS글로벌 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP060'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-eps@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS EPS 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP061'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-neotech@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS네오텍 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP062'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-supermarket@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS수퍼마켓 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP063'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-homeshopping@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS홈쇼핑 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP064'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-power@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS파워 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP065'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-retail2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS리테일 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP058'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 8. 한화그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-solution@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화솔루션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP066'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-aerospace@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화에어로스페이스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP067'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-system@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화시스템 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP068'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-energy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화에너지 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP069'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화생명 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP070'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-insurance@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화손해보험 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP071'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-securities@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화투자증권 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP072'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-asset@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화자산운용 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP073'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-capital@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화캐피탈 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP074'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-life2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화생명 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP070'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 9. 대우그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-shipbuilding@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우조선해양 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP075'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP076'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-industry@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우산업 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP077'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-heavy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우중공업 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP078'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-ship@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우조선 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP079'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-ocean@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우해양 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP080'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-industry2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우산업 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP077'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-heavy2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우중공업 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP078'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-ship2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우조선 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP079'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-ocean2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우해양 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP080'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 10. 한진그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('korean-air@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대한항공 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP081'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjin@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP082'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjin-kal@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진칼 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP083'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('korean-express@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대한통운 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP084'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjin-heavy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진중공업 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP085'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjin-shipping@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진해운 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP086'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 11. 기타 파트너 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gcdc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GCDC 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('dflux@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '디플럭스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP088'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('jansoft@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '잔소프트 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP089'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('jinkomm@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '진커뮤니케이션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP090'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 12. 추가 파트너 기업 담당자 (COMP091-COMP100)
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('naver@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '네이버 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP091'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('kakao@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '카카오 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP092'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('coupang@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '쿠팡 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP093'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('baedal@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '배달의민족 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP094'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('yanolja@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '야놀자 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP095'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('musinsa@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '무신사 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP096'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('danggeun@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '당근마켓 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP097'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('yogiyo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '요기요 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP098'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('line@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '라인 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP099'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('toss@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '토스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP100'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();
