-- 파트너 데이터 삽입 (국내기업 top100 + 접두어)
-- 100개의 파트너 데이터를 삽입합니다.

-- 1. 삼성그룹 계열사 (Samsung Group Affiliates)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR001', '삼성전자 파트너', '123-45-67890', '김현석', 1, 'system', 'system'),
('PAR002', '삼성물산 파트너', '123-45-67891', '오세철', 1, 'system', 'system'),
('PAR003', '삼성생명 파트너', '123-45-67892', '이명우', 1, 'system', 'system'),
('PAR004', '삼성화재 파트너', '123-45-67893', '박동훈', 1, 'system', 'system'),
('PAR005', '삼성물산 파트너', '123-45-67894', '오세철', 1, 'system', 'system'),
('PAR006', '삼성전기 파트너', '123-45-67895', '전동수', 1, 'system', 'system'),
('PAR007', '삼성SDI 파트너', '123-45-67896', '전동수', 1, 'system', 'system'),
('PAR008', '삼성바이오로직스 파트너', '123-45-67897', '김태한', 1, 'system', 'system'),
('PAR009', '삼성엔지니어링 파트너', '123-45-67898', '윤석금', 1, 'system', 'system'),
('PAR010', '삼성물산 파트너', '123-45-67899', '오세철', 1, 'system', 'system');

-- 2. 현대자동차그룹 계열사 (Hyundai Auto Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR011', '현대자동차 파트너', '234-56-78901', '장재훈', 1, 'system', 'system'),
('PAR012', '기아 파트너', '234-56-78902', '宋长祐', 1, 'system', 'system'),
('PAR013', '현대모비스 파트너', '234-56-78903', '이원희', 1, 'system', 'system'),
('PAR014', '현대위아 파트너', '234-56-78904', '이인식', 1, 'system', 'system'),
('PAR015', '현대글로비스 파트너', '234-56-78905', '이언오', 1, 'system', 'system'),
('PAR016', '현대건설 파트너', '234-56-78906', '박동욱', 1, 'system', 'system'),
('PAR017', '현대제철 파트너', '234-56-78907', '채병길', 1, 'system', 'system'),
('PAR018', '현대오토에버 파트너', '234-56-78908', '김기남', 1, 'system', 'system'),
('PAR019', '현대케피코 파트너', '234-56-78909', '이병철', 1, 'system', 'system'),
('PAR020', '현대위아 파트너', '234-56-78910', '이인식', 1, 'system', 'system');

-- 3. SK그룹 계열사 (SK Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR021', 'SK하이닉스 파트너', '345-67-89012', '구본무', 1, 'system', 'system'),
('PAR022', 'SK이노베이션 파트너', '345-67-89013', '김준', 1, 'system', 'system'),
('PAR023', 'SK텔레콤 파트너', '345-67-89014', '유영상', 1, 'system', 'system'),
('PAR024', 'SK스퀘어 파트너', '345-67-89015', '박정호', 1, 'system', 'system'),
('PAR025', 'SK디스커버리 파트너', '345-67-89016', '이석채', 1, 'system', 'system'),
('PAR026', 'SKC 파트너', '345-67-89017', '이형희', 1, 'system', 'system'),
('PAR027', 'SK가스 파트너', '345-67-89018', '이형희', 1, 'system', 'system'),
('PAR028', 'SK엔무브 파트너', '345-67-89019', '이형희', 1, 'system', 'system'),
('PAR029', 'SK바이오팜 파트너', '345-67-89020', '이형희', 1, 'system', 'system'),
('PAR030', 'SK쉴더스 파트너', '345-67-89021', '이형희', 1, 'system', 'system');

-- 4. LG그룹 계열사 (LG Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR031', 'LG전자 파트너', '456-78-90123', '권봉석', 1, 'system', 'system'),
('PAR032', 'LG화학 파트너', '456-78-90124', '신학철', 1, 'system', 'system'),
('PAR033', 'LG디스플레이 파트너', '456-78-90125', '정호영', 1, 'system', 'system'),
('PAR034', 'LG이노텍 파트너', '456-78-90126', '정철동', 1, 'system', 'system'),
('PAR035', 'LG유플러스 파트너', '456-78-90127', '황현식', 1, 'system', 'system'),
('PAR036', 'LG생활건강 파트너', '456-78-90128', '차석용', 1, 'system', 'system'),
('PAR037', 'LG CNS 파트너', '456-78-90129', '김영섭', 1, 'system', 'system'),
('PAR038', 'LG상사 파트너', '456-78-90130', '이동식', 1, 'system', 'system'),
('PAR039', 'LG하우시스 파트너', '456-78-90131', '이동식', 1, 'system', 'system'),
('PAR040', 'LG에너지솔루션 파트너', '456-78-90132', '김종현', 1, 'system', 'system');

-- 5. 롯데그룹 계열사 (Lotte Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR041', '롯데제과 파트너', '567-89-01234', '민명기', 1, 'system', 'system'),
('PAR042', '롯데칠성음료 파트너', '567-89-01235', '이영호', 1, 'system', 'system'),
('PAR043', '롯데마트 파트너', '567-89-01236', '장선욱', 1, 'system', 'system'),
('PAR044', '롯데백화점 파트너', '567-89-01237', '장선욱', 1, 'system', 'system'),
('PAR045', '롯데호텔 파트너', '567-89-01238', '김형욱', 1, 'system', 'system'),
('PAR046', '롯데푸드 파트너', '567-89-01239', '이명구', 1, 'system', 'system'),
('PAR047', '롯데렌탈 파트너', '567-89-01240', '이명구', 1, 'system', 'system'),
('PAR048', '롯데손해보험 파트너', '567-89-01241', '이명구', 1, 'system', 'system'),
('PAR049', '롯데글로벌로지스 파트너', '567-89-01242', '이명구', 1, 'system', 'system'),
('PAR050', '롯데케미칼 파트너', '567-89-01243', '신종훈', 1, 'system', 'system');

-- 6. 신세계그룹 계열사 (Shinsegae Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR051', '신세계 파트너', '678-90-12345', '정용진', 1, 'system', 'system'),
('PAR052', '이마트 파트너', '678-90-12346', '장동훈', 1, 'system', 'system'),
('PAR053', '신세계푸드 파트너', '678-90-12347', '이희권', 1, 'system', 'system'),
('PAR054', '신세계건설 파트너', '678-90-12348', '이희권', 1, 'system', 'system'),
('PAR055', '신세계프라퍼티 파트너', '678-90-12349', '이희권', 1, 'system', 'system'),
('PAR056', '신세계조선호텔 파트너', '678-90-12350', '이희권', 1, 'system', 'system'),
('PAR057', '신세계라이브러리 파트너', '678-90-12351', '이희권', 1, 'system', 'system'),
('PAR058', '신세계I&C 파트너', '678-90-12352', '이희권', 1, 'system', 'system'),
('PAR059', '신세계프라퍼티 파트너', '678-90-12353', '이희권', 1, 'system', 'system'),
('PAR060', '신세계푸드 파트너', '678-90-12354', '이희권', 1, 'system', 'system');

-- 7. GS그룹 계열사 (GS Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR061', 'GS칼텍스 파트너', '789-01-23456', '송재호', 1, 'system', 'system'),
('PAR062', 'GS리테일 파트너', '789-01-23457', '허연수', 1, 'system', 'system'),
('PAR063', 'GS건설 파트너', '789-01-23458', ' 허윤홍', 1, 'system', 'system'),
('PAR064', 'GS글로벌 파트너', '789-01-23459', ' 허연수', 1, 'system', 'system'),
('PAR065', 'GS EPS 파트너', '789-01-23460', ' 허연수', 1, 'system', 'system'),
('PAR066', 'GS네오텍 파트너', '789-01-23461', ' 허연수', 1, 'system', 'system'),
('PAR067', 'GS수퍼마켓 파트너', '789-01-23462', ' 허연수', 1, 'system', 'system'),
('PAR068', 'GS홈쇼핑 파트너', '789-01-23463', ' 허연수', 1, 'system', 'system'),
('PAR069', 'GS파워 파트너', '789-01-23464', ' 허연수', 1, 'system', 'system'),
('PAR070', 'GS리테일 파트너', '789-01-23465', ' 허연수', 1, 'system', 'system');

-- 8. 한화그룹 계열사 (Hanwha Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR071', '한화솔루션 파트너', '890-12-34567', '김동관', 1, 'system', 'system'),
('PAR072', '한화에어로스페이스 파트너', '890-12-34568', '김동관', 1, 'system', 'system'),
('PAR073', '한화시스템 파트너', '890-12-34569', '김동관', 1, 'system', 'system'),
('PAR074', '한화에너지 파트너', '890-12-34570', '김동관', 1, 'system', 'system'),
('PAR075', '한화생명 파트너', '890-12-34571', '이동명', 1, 'system', 'system'),
('PAR076', '한화손해보험 파트너', '890-12-34572', '이동명', 1, 'system', 'system'),
('PAR077', '한화투자증권 파트너', '890-12-34573', '이동명', 1, 'system', 'system'),
('PAR078', '한화자산운용 파트너', '890-12-34574', '이동명', 1, 'system', 'system'),
('PAR079', '한화캐피탈 파트너', '890-12-34575', '이동명', 1, 'system', 'system'),
('PAR080', '한화생명 파트너', '890-12-34576', '이동명', 1, 'system', 'system');

-- 9. 대우그룹 계열사 (Daewoo Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR081', '대우조선해양 파트너', '901-23-45678', '이성근', 1, 'system', 'system'),
('PAR082', '대우건설 파트너', '901-23-45679', '박영준', 1, 'system', 'system'),
('PAR083', '대우산업 파트너', '901-23-45680', '박영준', 1, 'system', 'system'),
('PAR084', '대우중공업 파트너', '901-23-45681', '박영준', 1, 'system', 'system'),
('PAR085', '대우조선 파트너', '901-23-45682', '박영준', 1, 'system', 'system'),
('PAR086', '대우해양 파트너', '901-23-45683', '박영준', 1, 'system', 'system'),
('PAR087', '대우산업 파트너', '901-23-45684', '박영준', 1, 'system', 'system'),
('PAR088', '대우중공업 파트너', '901-23-45685', '박영준', 1, 'system', 'system'),
('PAR089', '대우조선 파트너', '901-23-45686', '박영준', 1, 'system', 'system'),
('PAR090', '대우해양 파트너', '901-23-45687', '박영준', 1, 'system', 'system');

-- 10. 한진그룹 계열사 (Hanjin Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR091', '대한항공 파트너', '012-34-56789', '우기홍', 1, 'system', 'system'),
('PAR092', '한진 파트너', '012-34-56790', '조현민', 1, 'system', 'system'),
('PAR093', '한진칼 파트너', '012-34-56791', '조현민', 1, 'system', 'system'),
('PAR094', '대한통운 파트너', '012-34-56792', '박연호', 1, 'system', 'system'),
('PAR095', '한진중공업 파트너', '012-34-56793', '박연호', 1, 'system', 'system'),
('PAR096', '한진해운 파트너', '012-34-56794', '박연호', 1, 'system', 'system');

INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR097', 'GCDC 파트너', '012-34-56795', '김영실', 1, 'system', 'system'),
('PAR098', '디플럭스 파트너', '012-34-56796', '김회석', 1, 'system', 'system'),
('PAR099', '잔소프트 파트너', '012-34-56797', '김지환', 1, 'system', 'system'),
('PAR100', '진커뮤니케이션 파트너', '012-34-56798', '이명호', 1, 'system', 'system');

-- 파트너 데이터 삽입 완료
-- 총 100개의 파트너 데이터가 삽입되었습니다.
-- 각 파트너는 회사명 뒤에 '파트너'라는 접두어가 추가되었습니다.
-- 모든 파트너는 기본적으로 운영중(is_closed = false) 상태이며, manager_id는 1로 설정되었습니다.
