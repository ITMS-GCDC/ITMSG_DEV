-- 파트너 회사 데이터 삽입 (파트너 기업들을 별도의 회사로 등록)
-- 파트너 기업들을 companies 테이블에 등록합니다.

-- 1. 상승그룹 계열사 (sangseung Group Affiliates)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP002', '상승전자', '123-99-67890', '김준호', '서울특별시 영등포구 여의도동 60', '02-2222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP003', '상승물산', '123-99-67891', '박서연', '서울특별시 중구 을지로 30', '02-3333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP004', '상승생명', '123-99-67892', '이도윤', '서울특별시 중구 남대문로 5가 1-1', '02-4444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP005', '상승화재', '123-99-67893', '정하은', '서울특별시 중구 퇴계로 30', '02-5555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP006', '상승전기', '123-99-67895', '최민준', '경기도 수원시 영통구 상승로 129', '031-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP007', '상승SDI', '123-99-67896', '강지우', '경기도 용인시 기흥구 상승로 1', '031-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP008', '상승바이오로직스', '123-99-67897', '조서준', '인천광역시 연수구 컨벤시아로 117', '032-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP009', '상승엔지니어링', '123-99-67898', '윤하윤', '서울특별시 영등포구 여의도동 3', '02-6666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 2. 한리자동차그룹 계열사 (hanli Auto Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP010', '한리자동차', '234-56-78901', '임지안', '서울특별시 서초구 서초대로 148', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP011', '기카', '234-56-78902', '장시우', '서울특별시 양천구 염창동 403-3', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP012', '한리모비스', '234-56-78903', '한수아', '서울특별시 강남구 영동대로 511', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP013', '한리위아', '234-56-78904', '오건우', '서울특별시 영등포구 여의도동 3', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP014', '한리글로비스', '234-56-78905', '송예은', '서울특별시 중구 청계천로 10', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP015', '한리건설', '234-56-78906', '배준혁', '서울특별시 종로구 종로 4', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP016', '한리제철', '234-56-78907', '신지유', '인천광역시 남동구 논고동 53-2', '032-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP017', '한리오토에버', '234-56-78908', '노현준', '서울특별시 영등포구 여의도동 3', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP018', '한리케피코', '234-56-78909', '유소율', '대전광역시 유성구 가정북로 100', '042-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 3. SL그룹 계열사 (SL Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP019', 'SL하이닉스', '345-67-89012', '권서진', '경기도 이천시 모현읍 모현로 1', '031-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP020', 'SL이노베이션', '345-67-89013', '조태양', '서울특별시 중구 퇴계로 30', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP021', 'SL텔레콤', '345-67-89014', '문소은', '서울특별시 중구 퇴계로 111', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP022', 'SL스퀘어', '345-67-89015', '진하준', '서울특별시 중구 퇴계로 30', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP023', 'SL디스커버리', '345-67-89016', '황유나', '서울특별시 중구 퇴계로 30', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP024', 'SLC', '345-67-89017', '남도훈', '서울특별시 중구 퇴계로 30', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP025', 'SL가스', '345-67-89018', '안채원', '서울특별시 중구 퇴계로 30', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP026', 'SL엔무브', '345-67-89019', '차시후', '서울특별시 중구 퇴계로 30', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP027', 'SL바이오팜', '345-67-89020', '장예린', '서울특별시 중구 퇴계로 30', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP028', 'SL쉴더스', '345-67-89021', '변승우', '서울특별시 중구 퇴계로 30', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 4. LK그룹 계열사 (LK Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP029', 'LK전자', '456-78-90123', '하준혁', '서울특별시 영등포구 여의도동 128', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP030', 'LK화학', '456-78-90124', '구채원', '서울특별시 영등포구 여의도동 128', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP031', 'LK디스플레이', '456-78-90125', '정호영', '서울특별시 영등포구 여의도동 128', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP032', 'LK이노텍', '456-78-90126', '표지아', '서울특별시 영등포구 여의도동 128', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP033', 'LK유플러스', '456-78-90127', '황현식', '서울특별시 영등포구 여의도동 128', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP034', 'LK생활건강', '456-78-90128', '홍수아', '서울특별시 영등포구 여의도동 128', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP035', 'LK CNS', '456-78-90129', '김영섭', '서울특별시 영등포구 여의도동 128', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP036', 'LK상사', '456-78-90130', '여수빈', '서울특별시 영등포구 여의도동 128', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP037', 'LK하우시스', '456-78-90131', '이동식', '서울특별시 영등포구 여의도동 128', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP038', 'LK에너지솔루션', '456-78-90132', '탁민서', '서울특별시 영등포구 여의도동 128', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 5. 롯태그룹 계열사 (lostae Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP039', '롯태제과', '567-89-01234', '양서준', '서울특별시 중구 남대문로 120', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP040', '롯태칠성음료', '567-89-01235', '이영호', '서울특별시 중구 남대문로 120', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP041', '롯태마트', '567-89-01236', '방현준', '서울특별시 중구 남대문로 120', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP042', '롯태백화점', '567-89-01237', '모지윤', '서울특별시 중구 남대문로 120', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP043', '롯태호텔', '567-89-01238', '석민재', '서울특별시 중구 남대문로 120', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP044', '롯태푸드', '567-89-01239', '이명구', '서울특별시 중구 남대문로 120', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP045', '롯태렌탈', '567-89-01240', '변태윤', '서울특별시 중구 남대문로 120', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP046', '롯태손해보험', '567-89-01241', '이명구', '서울특별시 중구 남대문로 120', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP047', '롯태글로벌로지스', '567-89-01242', '마도훈', '서울특별시 중구 남대문로 120', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP048', '롯태케미칼', '567-89-01243', '우소율', '서울특별시 중구 남대문로 120', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 6. 구세계그룹 계열사 (oldsegae Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP049', '구세계', '678-90-12345', '계시우', '서울특별시 중구 중앙로 88', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP050', '구마트', '678-90-12346', '라아린', '서울특별시 중구 중앙로 88', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP051', '구세계푸드', '678-90-12347', '탁건호', '서울특별시 중구 중앙로 88', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP052', '구세계건설', '678-90-12348', '주유진', '서울특별시 중구 중앙로 88', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP053', '구세계프라퍼티', '678-90-12349', '이희권', '서울특별시 중구 중앙로 88', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP054', '구세계조선호텔', '678-90-12350', '민하린', '서울특별시 중구 중앙로 88', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP055', '구세계라이브러리', '678-90-12351', '이희권', '서울특별시 중구 중앙로 88', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP056', '구세계I&C', '678-90-12352', '지민준', '서울특별시 중구 중앙로 88', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 7. GGS그룹 계열사 (GGS Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP057', 'GGS칼텍스', '789-01-23456', '전서윤', '서울특별시 중구 소공로 106', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP058', 'GGS리테일', '789-01-23457', '반태양', '서울특별시 중구 소공로 106', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP059', 'GGS건설', '789-01-23458', ' 허윤홍', '서울특별시 중구 소공로 106', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP060', 'GGS글로벌', '789-01-23459', '함도현', '서울특별시 중구 소공로 106', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP061', 'GGS EPS', '789-01-23460', '갈소은', '서울특별시 중구 소공로 106', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP062', 'GGS네오텍', '789-01-23461', ' 허연수', '서울특별시 중구 소공로 106', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP063', 'GGS수퍼마켓', '789-01-23462', '허서연', '서울특별시 중구 소공로 106', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP064', 'GGS홈쇼핑', '789-01-23463', ' 허연수', '서울특별시 중구 소공로 106', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP065', 'GGS파워', '789-01-23464', '선유정', '서울특별시 중구 소공로 106', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 8. 한파그룹 계열사 (hanpa Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP066', '한파솔루션', '890-12-34567', '우준서', '서울특별시 중구 세종대로 134', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP067', '한파에어로스페이스', '890-12-34568', '곽지아', '서울특별시 중구 세종대로 134', '02-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP068', '한파시스템', '890-12-34569', '제윤호', '서울특별시 중구 세종대로 134', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP069', '한파에너지', '890-12-34570', '김동관', '서울특별시 중구 세종대로 134', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP070', '한파생명', '890-12-34571', '배준혁', '서울특별시 중구 세종대로 134', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP071', '한파손해보험', '890-12-34572', '설수아', '서울특별시 중구 세종대로 134', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP072', '한파투자증권', '890-12-34573', '양시후', '서울특별시 중구 세종대로 134', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP073', '한파자산운용', '890-12-34574', '엄지민', '서울특별시 중구 세종대로 134', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP074', '한파캐피탈', '890-12-34575', '나도윤', '서울특별시 중구 세종대로 134', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 9. 대구그룹 계열사 (daegu Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP075', '대구조선해양', '901-23-45678', '진유하', '경상남도 거제시 고현동 100', '055-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP076', '대구건설', '901-23-45679', '문현우', '서울특별시 영등포구 여의도동 10', '02-777-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP077', '대구산업', '901-23-45680', '박영준', '서울특별시 영등포구 여의도동 10', '02-888-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP078', '대구중공업', '901-23-45681', '차승민', '서울특별시 영등포구 여의도동 10', '02-999-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP079', '대구조선', '901-23-45682', '박영준', '경상남도 거제시 고현동 100', '055-111-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP080', '대구해양', '901-23-45683', '방지훈', '경상남도 거제시 고현동 100', '055-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 10. 한증그룹 계열사 (hanjeung Group)
INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP081', '한증항공', '012-34-56789', '노지원', '서울특별시 강서구 공항로 209', '02-222-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP082', '한증', '012-34-56790', '안재민', '서울특별시 중구 퇴계로 111', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP083', '한증칼', '012-34-56791', '조현민', '서울특별시 중구 퇴계로 111', '02-444-4444', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP084', '한증통운', '012-34-56792', '임서진', '서울특별시 중구 퇴계로 111', '02-555-5555', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP085', '한증중공업', '012-34-56793', '박연호', '서울특별시 중구 퇴계로 111', '02-666-6666', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP086', '한증해운', '012-34-56794', '하지수', '서울특별시 중구 퇴계로 111', '02-777-7777', 'system', 'system')
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
('COMP088', '디플럭스', '012-34-56796', '공수연', '서울특별시 강남구 테헤란로 151', '02-999-9999', 'system', 'system')
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
('COMP090', '진커뮤니케이션', '012-34-56798', '표지후', '서울특별시 강남구 테헤란로 151', '02-222-2222', 'system', 'system')
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
('COMP091', '네이버고', '123-45-67899', '차시아', '경기도 성남시 분당구 정자동 1781', '031-908-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP092', '카카오고', '234-56-78900', '마준우', '서울특별시 서초구 서초대로 77길 55', '02-333-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP093', '쿠팡고', '345-67-89011', '서예원', '서울특별시 송파구 올림픽로 35', '02-123-4567', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP094', '배달의민족고', '456-78-90122', '강태오', '서울특별시 강남구 테헤란로 14길 6', '02-2108-7777', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP095', '야놀자고', '567-89-01233', '윤하영', '서울특별시 강남구 영동대로 511', '02-2108-8888', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP096', '무신사고', '678-90-12344', '전은우', '서울특별시 강남구 영동대로 511', '02-2108-9999', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP097', '당근마켓고', '789-01-23455', '류채영', '서울특별시 서초구 서초대로 77길 55', '02-2108-1111', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP098', '요기요고', '890-12-34566', '주승준', '서울특별시 강남구 영동대로 511', '02-2108-2222', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP099', '라인고', '901-23-45677', '신중호', '서울특별시 강남구 영동대로 511', '02-2108-3333', 'system', 'system')
ON CONFLICT (code) DO UPDATE SET
    name = EXCLUDED.name,
    business_number = EXCLUDED.business_number,
    ceo_name = EXCLUDED.ceo_name,
    address = EXCLUDED.address,
    phone_number = EXCLUDED.phone_number,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO companies (code, name, business_number, ceo_name, address, phone_number, created_by, updated_by) VALUES
('COMP100', '토스고', '012-34-56788', '양지율', '서울특별시 강남구 영동대로 511', '02-2108-4444', 'system', 'system')
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

-- 1. 상승그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-electronics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '홍길동', (SELECT id FROM companies WHERE code = 'COMP002'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-cnt@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '김영희', (SELECT id FROM companies WHERE code = 'COMP003'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '박민수', (SELECT id FROM companies WHERE code = 'COMP004'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-fire@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '이수진', (SELECT id FROM companies WHERE code = 'COMP005'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-electro@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '정현우', (SELECT id FROM companies WHERE code = 'COMP006'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-sdi@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '최지혜', (SELECT id FROM companies WHERE code = 'COMP007'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-bio@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '강민호', (SELECT id FROM companies WHERE code = 'COMP008'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-engineering@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '윤서연', (SELECT id FROM companies WHERE code = 'COMP009'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sangseung-cnt2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '서민재', (SELECT id FROM companies WHERE code = 'COMP003'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 2. 한리자동차그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-motor@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '오태양', (SELECT id FROM companies WHERE code = 'COMP010'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('kika@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '임나래', (SELECT id FROM companies WHERE code = 'COMP011'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-mobis@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '조은별', (SELECT id FROM companies WHERE code = 'COMP012'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-wia@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '송하은', (SELECT id FROM companies WHERE code = 'COMP013'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-glovis@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '배준서', (SELECT id FROM companies WHERE code = 'COMP014'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신지우', (SELECT id FROM companies WHERE code = 'COMP015'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-steel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '노승현', (SELECT id FROM companies WHERE code = 'COMP016'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-ever@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '유예린', (SELECT id FROM companies WHERE code = 'COMP017'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-kefico@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '서지훈', (SELECT id FROM companies WHERE code = 'COMP018'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanli-wia2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '문수진', (SELECT id FROM companies WHERE code = 'COMP013'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 3. SL그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-hynix@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '권민재', (SELECT id FROM companies WHERE code = 'COMP019'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-innovation@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '조아인', (SELECT id FROM companies WHERE code = 'COMP020'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-telecom@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '문태민', (SELECT id FROM companies WHERE code = 'COMP021'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-square@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '진유나', (SELECT id FROM companies WHERE code = 'COMP022'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-discovery@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '황승우', (SELECT id FROM companies WHERE code = 'COMP023'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('SLc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '남은서', (SELECT id FROM companies WHERE code = 'COMP024'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-gas@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '안재호', (SELECT id FROM companies WHERE code = 'COMP025'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-move@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '임채윤', (SELECT id FROM companies WHERE code = 'COMP026'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-biopharm@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '장현석', (SELECT id FROM companies WHERE code = 'COMP027'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sl-shields@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '변다은', (SELECT id FROM companies WHERE code = 'COMP028'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 4. LK그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-electronics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '하준혁', (SELECT id FROM companies WHERE code = 'COMP029'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-chemical@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '구채원', (SELECT id FROM companies WHERE code = 'COMP030'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-display@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '주시온', (SELECT id FROM companies WHERE code = 'COMP031'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-innotek@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '표지아', (SELECT id FROM companies WHERE code = 'COMP032'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-uplus@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '마준영', (SELECT id FROM companies WHERE code = 'COMP033'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '홍수아', (SELECT id FROM companies WHERE code = 'COMP034'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-cns@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '소지환', (SELECT id FROM companies WHERE code = 'COMP035'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-trading@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '여수빈', (SELECT id FROM companies WHERE code = 'COMP036'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-house@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '곽건우', (SELECT id FROM companies WHERE code = 'COMP037'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lk-energy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '탁민서', (SELECT id FROM companies WHERE code = 'COMP038'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 5. 롯태그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-confectionery@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '양서준', (SELECT id FROM companies WHERE code = 'COMP039'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-chilsung@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '엄하윤', (SELECT id FROM companies WHERE code = 'COMP040'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-mart@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '방현준', (SELECT id FROM companies WHERE code = 'COMP041'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-department@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '모지윤', (SELECT id FROM companies WHERE code = 'COMP042'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-hotel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '석민재', (SELECT id FROM companies WHERE code = 'COMP043'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-food@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '염서현', (SELECT id FROM companies WHERE code = 'COMP044'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-rental@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '황민석', (SELECT id FROM companies WHERE code = 'COMP045'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-insurance@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '피지안', (SELECT id FROM companies WHERE code = 'COMP046'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-logistics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '마도훈', (SELECT id FROM companies WHERE code = 'COMP047'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lostae-chemical@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '우소율', (SELECT id FROM companies WHERE code = 'COMP048'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 6. 구세계그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '계시우', (SELECT id FROM companies WHERE code = 'COMP049'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldmart@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '라아린', (SELECT id FROM companies WHERE code = 'COMP050'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-food@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '탁건호', (SELECT id FROM companies WHERE code = 'COMP051'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '주유진', (SELECT id FROM companies WHERE code = 'COMP052'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-property@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '맹재원', (SELECT id FROM companies WHERE code = 'COMP053'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-hotel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '민하린', (SELECT id FROM companies WHERE code = 'COMP054'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-library@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '부시후', (SELECT id FROM companies WHERE code = 'COMP055'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-nc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '지민준', (SELECT id FROM companies WHERE code = 'COMP056'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-property2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '편지수', (SELECT id FROM companies WHERE code = 'COMP053'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('oldsegae-food2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '성도윤', (SELECT id FROM companies WHERE code = 'COMP051'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 7. GGS그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-calnex@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '전서윤', (SELECT id FROM companies WHERE code = 'COMP057'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-retail@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '반태양', (SELECT id FROM companies WHERE code = 'COMP058'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '고지유', (SELECT id FROM companies WHERE code = 'COMP059'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-global@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '함도현', (SELECT id FROM companies WHERE code = 'COMP060'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-eps@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '갈소은', (SELECT id FROM companies WHERE code = 'COMP061'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-neotech@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '여건우', (SELECT id FROM companies WHERE code = 'COMP062'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-supermarket@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '허서연', (SELECT id FROM companies WHERE code = 'COMP063'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-homeshopping@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '도민준', (SELECT id FROM companies WHERE code = 'COMP064'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-power@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '선유정', (SELECT id FROM companies WHERE code = 'COMP065'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('ggs-retail2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '배시윤', (SELECT id FROM companies WHERE code = 'COMP058'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 8. 한파그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-solution@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '우준서', (SELECT id FROM companies WHERE code = 'COMP066'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-aerospace@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '곽지아', (SELECT id FROM companies WHERE code = 'COMP067'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-system@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '제윤호', (SELECT id FROM companies WHERE code = 'COMP068'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-energy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '봉채은', (SELECT id FROM companies WHERE code = 'COMP069'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '배준혁', (SELECT id FROM companies WHERE code = 'COMP070'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-insurance@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '설수아', (SELECT id FROM companies WHERE code = 'COMP071'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-securities@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '양시후', (SELECT id FROM companies WHERE code = 'COMP072'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-asset@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '엄지민', (SELECT id FROM companies WHERE code = 'COMP073'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-capital@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '나도윤', (SELECT id FROM companies WHERE code = 'COMP074'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanpa-life2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '유하준', (SELECT id FROM companies WHERE code = 'COMP070'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 9. 대구그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-shipbuilding@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '진유하', (SELECT id FROM companies WHERE code = 'COMP075'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '문현우', (SELECT id FROM companies WHERE code = 'COMP076'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-industry@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '탁지율', (SELECT id FROM companies WHERE code = 'COMP077'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-heavy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '차승민', (SELECT id FROM companies WHERE code = 'COMP078'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-ship@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신유나', (SELECT id FROM companies WHERE code = 'COMP079'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-ocean@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '방지훈', (SELECT id FROM companies WHERE code = 'COMP080'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-industry2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '명태준', (SELECT id FROM companies WHERE code = 'COMP077'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-heavy2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '서유리', (SELECT id FROM companies WHERE code = 'COMP078'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-ship2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '길지환', (SELECT id FROM companies WHERE code = 'COMP079'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daegu-ocean2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '정소율', (SELECT id FROM companies WHERE code = 'COMP080'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

-- 10. 한증그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjeung-air@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '노지원', (SELECT id FROM companies WHERE code = 'COMP081'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjeung@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '안재민', (SELECT id FROM companies WHERE code = 'COMP082'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjeung-kal@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '최다현', (SELECT id FROM companies WHERE code = 'COMP083'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjeung-express@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '임서진', (SELECT id FROM companies WHERE code = 'COMP084'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjeung-heavy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '손민석', (SELECT id FROM companies WHERE code = 'COMP085'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanjeung-shipping@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '하지수', (SELECT id FROM companies WHERE code = 'COMP086'), true, true, 'system', 'system')
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
('gcdc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '류도영', (SELECT id FROM companies WHERE code = 'COMP087'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('dflux@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '공수연', (SELECT id FROM companies WHERE code = 'COMP088'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('jansoft@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '진하준', (SELECT id FROM companies WHERE code = 'COMP089'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('jinkomm@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '표지후', (SELECT id FROM companies WHERE code = 'COMP090'), true, true, 'system', 'system')
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
('navergo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '차시아', (SELECT id FROM companies WHERE code = 'COMP091'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('kakaogo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '마준우', (SELECT id FROM companies WHERE code = 'COMP092'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('coupango@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '서예원', (SELECT id FROM companies WHERE code = 'COMP093'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('baedalgo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '강태오', (SELECT id FROM companies WHERE code = 'COMP094'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('yanoljago@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '윤하영', (SELECT id FROM companies WHERE code = 'COMP095'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('musinsago@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '전은우', (SELECT id FROM companies WHERE code = 'COMP096'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('danGGSeungo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '류채영', (SELECT id FROM companies WHERE code = 'COMP097'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('yogiyogo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '주승준', (SELECT id FROM companies WHERE code = 'COMP098'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('linego@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '모연우', (SELECT id FROM companies WHERE code = 'COMP099'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();

INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('tossgo@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '양지율', (SELECT id FROM companies WHERE code = 'COMP100'), true, true, 'system', 'system')
ON CONFLICT (email) DO UPDATE SET
    password = EXCLUDED.password,
    name = EXCLUDED.name,
    company_id = EXCLUDED.company_id,
    is_active = EXCLUDED.is_active,
    is_approved = EXCLUDED.is_approved,
    updated_by = EXCLUDED.updated_by,
    updated_at = NOW();
