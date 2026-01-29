-- 파트너 데이터 삽입 (국내기업 top100 + 접두어)
-- 100개의 파트너 데이터를 삽입합니다.

-- 1. 삼성그룹 계열사 (Samsung Group Affiliates)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR002', '삼성전자 파트너', '123-45-67890', '김현석', 1, 'system', 'system'),
('PAR003', '삼성물산 파트너', '123-45-67891', '오세철', 1, 'system', 'system'),
('PAR004', '삼성생명 파트너', '123-45-67892', '이명우', 1, 'system', 'system'),
('PAR005', '삼성화재 파트너', '123-45-67893', '박동훈', 1, 'system', 'system'),
('PAR006', '삼성물산 파트너', '123-45-67894', '오세철', 1, 'system', 'system'),
('PAR007', '삼성전기 파트너', '123-45-67895', '전동수', 1, 'system', 'system'),
('PAR008', '삼성SDI 파트너', '123-45-67896', '전동수', 1, 'system', 'system'),
('PAR009', '삼성바이오로직스 파트너', '123-45-67897', '김태한', 1, 'system', 'system'),
('PAR010', '삼성엔지니어링 파트너', '123-45-67898', '윤석금', 1, 'system', 'system'),
('PAR011', '삼성물산 파트너', '123-45-67899', '오세철', 1, 'system', 'system');

-- 2. 현대자동차그룹 계열사 (Hyundai Auto Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR012', '현대자동차 파트너', '234-56-78901', '장재훈', 1, 'system', 'system'),
('PAR013', '기아 파트너', '234-56-78902', '바이오', 1, 'system', 'system'),
('PAR014', '현대모비스 파트너', '234-56-78903', '이원희', 1, 'system', 'system'),
('PAR015', '현대위아 파트너', '234-56-78904', '이인식', 1, 'system', 'system'),
('PAR016', '현대글로비스 파트너', '234-56-78905', '이언오', 1, 'system', 'system'),
('PAR017', '현대건설 파트너', '234-56-78906', '박동욱', 1, 'system', 'system'),
('PAR018', '현대제철 파트너', '234-56-78907', '채병길', 1, 'system', 'system'),
('PAR019', '현대오토에버 파트너', '234-56-78908', '김기남', 1, 'system', 'system'),
('PAR020', '현대케피코 파트너', '234-56-78909', '이병철', 1, 'system', 'system'),
('PAR021', '현대위아 파트너', '234-56-78910', '이인식', 1, 'system', 'system');

-- 3. SK그룹 계열사 (SK Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR022', 'SK하이닉스 파트너', '345-67-89012', '구본무', 1, 'system', 'system'),
('PAR023', 'SK이노베이션 파트너', '345-67-89013', '김준', 1, 'system', 'system'),
('PAR024', 'SK텔레콤 파트너', '345-67-89014', '유영상', 1, 'system', 'system'),
('PAR025', 'SK스퀘어 파트너', '345-67-89015', '박정호', 1, 'system', 'system'),
('PAR026', 'SK디스커버리 파트너', '345-67-89016', '이석채', 1, 'system', 'system'),
('PAR027', 'SKC 파트너', '345-67-89017', '이형희', 1, 'system', 'system'),
('PAR028', 'SK가스 파트너', '345-67-89018', '이형희', 1, 'system', 'system'),
('PAR029', 'SK엔무브 파트너', '345-67-89019', '이형희', 1, 'system', 'system'),
('PAR030', 'SK바이오팜 파트너', '345-67-89020', '이형희', 1, 'system', 'system'),
('PAR031', 'SK쉴더스 파트너', '345-67-89021', '이형희', 1, 'system', 'system');

-- 4. LG그룹 계열사 (LG Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR032', 'LG전자 파트너', '456-78-90123', '권봉석', 1, 'system', 'system'),
('PAR033', 'LG화학 파트너', '456-78-90124', '신학철', 1, 'system', 'system'),
('PAR034', 'LG디스플레이 파트너', '456-78-90125', '정호영', 1, 'system', 'system'),
('PAR035', 'LG이노텍 파트너', '456-78-90126', '정철동', 1, 'system', 'system'),
('PAR036', 'LG유플러스 파트너', '456-78-90127', '황현식', 1, 'system', 'system'),
('PAR037', 'LG생활건강 파트너', '456-78-90128', '차석용', 1, 'system', 'system'),
('PAR038', 'LG CNS 파트너', '456-78-90129', '김영섭', 1, 'system', 'system'),
('PAR039', 'LG상사 파트너', '456-78-90130', '이동식', 1, 'system', 'system'),
('PAR040', 'LG하우시스 파트너', '456-78-90131', '이동식', 1, 'system', 'system'),
('PAR041', 'LG에너지솔루션 파트너', '456-78-90132', '김종현', 1, 'system', 'system');

-- 5. 롯데그룹 계열사 (Lotte Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR042', '롯데제과 파트너', '567-89-01234', '민명기', 1, 'system', 'system'),
('PAR043', '롯데칠성음료 파트너', '567-89-01235', '이영호', 1, 'system', 'system'),
('PAR044', '롯데마트 파트너', '567-89-01236', '장선욱', 1, 'system', 'system'),
('PAR045', '롯데백화점 파트너', '567-89-01237', '장선욱', 1, 'system', 'system'),
('PAR046', '롯데호텔 파트너', '567-89-01238', '김형욱', 1, 'system', 'system'),
('PAR047', '롯데푸드 파트너', '567-89-01239', '이명구', 1, 'system', 'system'),
('PAR048', '롯데렌탈 파트너', '567-89-01240', '이명구', 1, 'system', 'system'),
('PAR049', '롯데손해보험 파트너', '567-89-01241', '이명구', 1, 'system', 'system'),
('PAR050', '롯데글로벌로지스 파트너', '567-89-01242', '이명구', 1, 'system', 'system'),
('PAR051', '롯데케미칼 파트너', '567-89-01243', '신종훈', 1, 'system', 'system');

-- 6. 신세계그룹 계열사 (Shinsegae Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR052', '신세계 파트너', '678-90-12345', '정용진', 1, 'system', 'system'),
('PAR053', '이마트 파트너', '678-90-12346', '장동훈', 1, 'system', 'system'),
('PAR054', '신세계푸드 파트너', '678-90-12347', '이희권', 1, 'system', 'system'),
('PAR055', '신세계건설 파트너', '678-90-12348', '이희권', 1, 'system', 'system'),
('PAR056', '신세계프라퍼티 파트너', '678-90-12349', '이희권', 1, 'system', 'system'),
('PAR057', '신세계조선호텔 파트너', '678-90-12350', '이희권', 1, 'system', 'system'),
('PAR058', '신세계라이브러리 파트너', '678-90-12351', '이희권', 1, 'system', 'system'),
('PAR059', '신세계I&C 파트너', '678-90-12352', '이희권', 1, 'system', 'system'),
('PAR060', '신세계프라퍼티 파트너', '678-90-12353', '이희권', 1, 'system', 'system'),
('PAR061', '신세계푸드 파트너', '678-90-12354', '이희권', 1, 'system', 'system');

-- 7. GS그룹 계열사 (GS Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR062', 'GS칼텍스 파트너', '789-01-23456', '송재호', 1, 'system', 'system'),
('PAR063', 'GS리테일 파트너', '789-01-23457', '허연수', 1, 'system', 'system'),
('PAR064', 'GS건설 파트너', '789-01-23458', ' 허윤홍', 1, 'system', 'system'),
('PAR065', 'GS글로벌 파트너', '789-01-23459', ' 허연수', 1, 'system', 'system'),
('PAR066', 'GS EPS 파트너', '789-01-23460', ' 허연수', 1, 'system', 'system'),
('PAR067', 'GS네오텍 파트너', '789-01-23461', ' 허연수', 1, 'system', 'system'),
('PAR068', 'GS수퍼마켓 파트너', '789-01-23462', ' 허연수', 1, 'system', 'system'),
('PAR069', 'GS홈쇼핑 파트너', '789-01-23463', ' 허연수', 1, 'system', 'system'),
('PAR070', 'GS파워 파트너', '789-01-23464', ' 허연수', 1, 'system', 'system'),
('PAR071', 'GS리테일 파트너', '789-01-23465', ' 허연수', 1, 'system', 'system');

-- 8. 한화그룹 계열사 (Hanwha Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR072', '한화솔루션 파트너', '890-12-34567', '김동관', 1, 'system', 'system'),
('PAR073', '한화에어로스페이스 파트너', '890-12-34568', '김동관', 1, 'system', 'system'),
('PAR074', '한화시스템 파트너', '890-12-34569', '김동관', 1, 'system', 'system'),
('PAR075', '한화에너지 파트너', '890-12-34570', '김동관', 1, 'system', 'system'),
('PAR076', '한화생명 파트너', '890-12-34571', '이동명', 1, 'system', 'system'),
('PAR077', '한화손해보험 파트너', '890-12-34572', '이동명', 1, 'system', 'system'),
('PAR078', '한화투자증권 파트너', '890-12-34573', '이동명', 1, 'system', 'system'),
('PAR079', '한화자산운용 파트너', '890-12-34574', '이동명', 1, 'system', 'system'),
('PAR080', '한화캐피탈 파트너', '890-12-34575', '이동명', 1, 'system', 'system'),
('PAR081', '한화생명 파트너', '890-12-34576', '이동명', 1, 'system', 'system');

-- 9. 대우그룹 계열사 (Daewoo Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR082', '대우조선해양 파트너', '901-23-45678', '이성근', 1, 'system', 'system'),
('PAR083', '대우건설 파트너', '901-23-45679', '박영준', 1, 'system', 'system'),
('PAR084', '대우산업 파트너', '901-23-45680', '박영준', 1, 'system', 'system'),
('PAR085', '대우중공업 파트너', '901-23-45681', '박영준', 1, 'system', 'system'),
('PAR086', '대우조선 파트너', '901-23-45682', '박영준', 1, 'system', 'system'),
('PAR087', '대우해양 파트너', '901-23-45683', '박영준', 1, 'system', 'system'),
('PAR088', '대우산업 파트너', '901-23-45684', '박영준', 1, 'system', 'system'),
('PAR089', '대우중공업 파트너', '901-23-45685', '박영준', 1, 'system', 'system'),
('PAR090', '대우조선 파트너', '901-23-45686', '박영준', 1, 'system', 'system'),
('PAR091', '대우해양 파트너', '901-23-45687', '박영준', 1, 'system', 'system');

-- 10. 한진그룹 계열사 (Hanjin Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR092', '대한항공 파트너', '012-34-56789', '우기홍', 1, 'system', 'system'),
('PAR093', '한진 파트너', '012-34-56790', '조현민', 1, 'system', 'system'),
('PAR094', '한진칼 파트너', '012-34-56791', '조현민', 1, 'system', 'system'),
('PAR095', '대한통운 파트너', '012-34-56792', '박연호', 1, 'system', 'system'),
('PAR096', '한진중공업 파트너', '012-34-56793', '박연호', 1, 'system', 'system'),
('PAR097', '한진해운 파트너', '012-34-56794', '박연호', 1, 'system', 'system');

INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR098', 'GCDC 파트너', '012-34-56795', '김영실', 1, 'system', 'system'),
('PAR099', '디플럭스 파트너', '012-34-56796', '김회석', 1, 'system', 'system'),
('PAR100', '잔소프트 파트너', '012-34-56797', '김지환', 1, 'system', 'system'),
('PAR101', '진커뮤니케이션 파트너', '012-34-56798', '이명호', 1, 'system', 'system');

-- 파트너 데이터 삽입 완료
-- 총 100개의 파트너 데이터가 삽입되었습니다.
-- 각 파트너는 회사명 뒤에 '파트너'라는 접두어가 추가되었습니다.
-- 모든 파트너는 기본적으로 운영중(is_closed = false) 상태이며, manager_id는 1로 설정되었습니다.

-- 파트너별 담당자(사용자) 데이터 삽입
-- 각 파트너당 1명의 담당자를 생성합니다.
-- 비밀번호: admin1234 (BCrypt 해시: $2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa)

-- 1. 삼성그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('samsung@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-electronics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성전자 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-cnt@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성물산 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성생명 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-fire@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성화재 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-electro@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성전기 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-sdi@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성SDI 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-bio@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성바이오로직스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-engineering@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성엔지니어링 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('samsung-cnt2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '삼성물산 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 2. 현대자동차그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hyundai-motor@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대자동차 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('kia@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '기아 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-mobis@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대모비스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-wia@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대위아 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-glovis@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대글로비스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-steel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대제철 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-ever@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대오토에버 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-kefico@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대케피코 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hyundai-wia2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '현대위아 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 3. SK그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('sk-hynix@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK하이닉스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-innovation@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK이노베이션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-telecom@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK텔레콤 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-square@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK스퀘어 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-discovery@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK디스커버리 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('skc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SKC 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-gas@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK가스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-move@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK엔무브 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-biopharm@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK바이오팜 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('sk-shields@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'SK쉴더스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 4. LG그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lg-electronics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG전자 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-chemical@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG화학 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-display@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG디스플레이 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-innotek@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG이노텍 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-uplus@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG유플러스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG생활건강 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-cns@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG CNS 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-trading@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG상사 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-house@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG하우시스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lg-energy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'LG에너지솔루션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 5. 롯데그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('lotte-confectionery@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데제과 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-chilsung@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데칠성음료 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-mart@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데마트 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-department@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데백화점 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-hotel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데호텔 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-food@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데푸드 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-rental@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데렌탈 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-insurance@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데손해보험 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-logistics@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데글로벌로지스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('lotte-chemical@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '롯데케미칼 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 6. 신세계그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('shinsegae@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('emart@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '이마트 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-food@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계푸드 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-property@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계프라퍼티 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-hotel@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계조선호텔 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-library@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계라이브러리 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-nc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계I&C 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-property2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계프라퍼티 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('shinsegae-food2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '신세계푸드 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 7. GS그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gs-calnex@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS칼텍스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-retail@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS리테일 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-global@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS글로벌 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-eps@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS EPS 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-neotech@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS네오텍 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-supermarket@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS수퍼마켓 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-homeshopping@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS홈쇼핑 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-power@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS파워 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('gs-retail2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GS리테일 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 8. 한화그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('hanwha-solution@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화솔루션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-aerospace@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화에어로스페이스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-system@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화시스템 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-energy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화에너지 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-life@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화생명 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-insurance@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화손해보험 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-securities@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화투자증권 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-asset@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화자산운용 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-capital@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화캐피탈 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanwha-life2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한화생명 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 9. 대우그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('daewoo-shipbuilding@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우조선해양 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-construction@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우건설 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-industry@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우산업 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-heavy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우중공업 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-ship@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우조선 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-ocean@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우해양 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-industry2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우산업 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-heavy2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우중공업 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-ship2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우조선 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('daewoo-ocean2@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대우해양 파트너 담당자2', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 10. 한진그룹 계열사 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('korean-air@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대한항공 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanjin@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanjin-kal@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진칼 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('korean-express@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '대한통운 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanjin-heavy@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진중공업 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('hanjin-shipping@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '한진해운 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 11. 기타 파트너 담당자
INSERT INTO users (email, password, name, company_id, is_active, is_approved, created_by, updated_by) VALUES
('gcdc@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', 'GCDC 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('dflux@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '디플럭스 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('jansoft@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '잔소프트 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system'),
('jinkomm@partner.com', '$2a$10$RSih82WGdPGHLKwNmBKFAeIEc69TebIajf97uZh8Ziq0X05V1SRqa', '진커뮤니케이션 파트너 담당자', (SELECT id FROM companies WHERE code = 'COMP001'), true, true, 'system', 'system');

-- 파트너와 담당자 연결 (partners 테이블의 manager_id 업데이트)
-- 파트너와 해당 담당자 매핑
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung@partner.com') WHERE code = 'PAR002';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-electronics@partner.com') WHERE code = 'PAR003';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-cnt@partner.com') WHERE code = 'PAR004';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-life@partner.com') WHERE code = 'PAR005';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-fire@partner.com') WHERE code = 'PAR006';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-electro@partner.com') WHERE code = 'PAR007';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-sdi@partner.com') WHERE code = 'PAR008';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-bio@partner.com') WHERE code = 'PAR009';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-engineering@partner.com') WHERE code = 'PAR010';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'samsung-cnt2@partner.com') WHERE code = 'PAR011';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-motor@partner.com') WHERE code = 'PAR012';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'kia@partner.com') WHERE code = 'PAR013';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-mobis@partner.com') WHERE code = 'PAR014';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-wia@partner.com') WHERE code = 'PAR015';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-glovis@partner.com') WHERE code = 'PAR016';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-construction@partner.com') WHERE code = 'PAR017';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-steel@partner.com') WHERE code = 'PAR018';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-ever@partner.com') WHERE code = 'PAR019';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-kefico@partner.com') WHERE code = 'PAR020';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hyundai-wia2@partner.com') WHERE code = 'PAR021';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-hynix@partner.com') WHERE code = 'PAR022';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-innovation@partner.com') WHERE code = 'PAR023';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-telecom@partner.com') WHERE code = 'PAR024';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-square@partner.com') WHERE code = 'PAR025';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-discovery@partner.com') WHERE code = 'PAR026';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'skc@partner.com') WHERE code = 'PAR027';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-gas@partner.com') WHERE code = 'PAR028';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-move@partner.com') WHERE code = 'PAR029';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-biopharm@partner.com') WHERE code = 'PAR030';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'sk-shields@partner.com') WHERE code = 'PAR031';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-electronics@partner.com') WHERE code = 'PAR032';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-chemical@partner.com') WHERE code = 'PAR033';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-display@partner.com') WHERE code = 'PAR034';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-innotek@partner.com') WHERE code = 'PAR035';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-uplus@partner.com') WHERE code = 'PAR036';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-life@partner.com') WHERE code = 'PAR037';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-cns@partner.com') WHERE code = 'PAR038';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-trading@partner.com') WHERE code = 'PAR039';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-house@partner.com') WHERE code = 'PAR040';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lg-energy@partner.com') WHERE code = 'PAR041';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-confectionery@partner.com') WHERE code = 'PAR042';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-chilsung@partner.com') WHERE code = 'PAR043';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-mart@partner.com') WHERE code = 'PAR044';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-department@partner.com') WHERE code = 'PAR045';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-hotel@partner.com') WHERE code = 'PAR046';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-food@partner.com') WHERE code = 'PAR047';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-rental@partner.com') WHERE code = 'PAR048';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-insurance@partner.com') WHERE code = 'PAR049';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-logistics@partner.com') WHERE code = 'PAR050';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'lotte-chemical@partner.com') WHERE code = 'PAR051';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae@partner.com') WHERE code = 'PAR052';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'emart@partner.com') WHERE code = 'PAR053';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-food@partner.com') WHERE code = 'PAR054';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-construction@partner.com') WHERE code = 'PAR055';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-property@partner.com') WHERE code = 'PAR056';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-hotel@partner.com') WHERE code = 'PAR057';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-library@partner.com') WHERE code = 'PAR058';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-nc@partner.com') WHERE code = 'PAR059';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-property2@partner.com') WHERE code = 'PAR060';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'shinsegae-food2@partner.com') WHERE code = 'PAR061';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-calnex@partner.com') WHERE code = 'PAR062';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-retail@partner.com') WHERE code = 'PAR063';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-construction@partner.com') WHERE code = 'PAR064';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-global@partner.com') WHERE code = 'PAR065';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-eps@partner.com') WHERE code = 'PAR066';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-neotech@partner.com') WHERE code = 'PAR067';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-supermarket@partner.com') WHERE code = 'PAR068';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-homeshopping@partner.com') WHERE code = 'PAR069';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-power@partner.com') WHERE code = 'PAR070';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gs-retail2@partner.com') WHERE code = 'PAR071';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-solution@partner.com') WHERE code = 'PAR072';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-aerospace@partner.com') WHERE code = 'PAR073';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-system@partner.com') WHERE code = 'PAR074';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-energy@partner.com') WHERE code = 'PAR075';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-life@partner.com') WHERE code = 'PAR076';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-insurance@partner.com') WHERE code = 'PAR077';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-securities@partner.com') WHERE code = 'PAR078';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-asset@partner.com') WHERE code = 'PAR079';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-capital@partner.com') WHERE code = 'PAR080';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanwha-life2@partner.com') WHERE code = 'PAR081';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-shipbuilding@partner.com') WHERE code = 'PAR082';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-construction@partner.com') WHERE code = 'PAR083';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-industry@partner.com') WHERE code = 'PAR084';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-heavy@partner.com') WHERE code = 'PAR085';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-ship@partner.com') WHERE code = 'PAR086';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-ocean@partner.com') WHERE code = 'PAR087';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-industry2@partner.com') WHERE code = 'PAR088';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-heavy2@partner.com') WHERE code = 'PAR089';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-ship2@partner.com') WHERE code = 'PAR090';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'daewoo-ocean2@partner.com') WHERE code = 'PAR091';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'korean-air@partner.com') WHERE code = 'PAR092';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanjin@partner.com') WHERE code = 'PAR093';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanjin-kal@partner.com') WHERE code = 'PAR094';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'korean-express@partner.com') WHERE code = 'PAR095';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanjin-heavy@partner.com') WHERE code = 'PAR096';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'hanjin-shipping@partner.com') WHERE code = 'PAR097';

UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'gcdc@partner.com') WHERE code = 'PAR098';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'dflux@partner.com') WHERE code = 'PAR099';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'jansoft@partner.com') WHERE code = 'PAR100';
UPDATE partners SET manager_id = (SELECT id FROM users WHERE email = 'jinkomm@partner.com') WHERE code = 'PAR101';

-- 파트너 데이터 및 담당자 데이터 삽입 완료
-- 총 100개의 파트너 데이터와 각 파트너당 1명의 담당자(사용자) 데이터가 삽입되었습니다.
-- 모든 담당자는 ARIS 본사 소속이며, 기본적으로 활성화된 상태입니다.
-- 파트너와 담당자는 manager_id로 연결되어 있습니다.
