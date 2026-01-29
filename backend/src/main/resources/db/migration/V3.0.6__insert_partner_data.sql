-- 파트너 데이터 삽입 (국내기업 top100 + 접두어)
-- 100개의 파트너 데이터를 삽입합니다.

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

-- 파트너 데이터 삽입 (국내기업 top100 + 접두어)
-- 100개의 파트너 데이터를 삽입합니다.

-- 1. 삼성그룹 계열사 (Samsung Group Affiliates)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR002', '삼성전자 파트너', '123-45-67890', '김현석', (SELECT id FROM users WHERE email = 'samsung-electronics@partner.com'), 'system', 'system'),
('PAR003', '삼성물산 파트너', '123-45-67891', '오세철', (SELECT id FROM users WHERE email = 'samsung-cnt@partner.com'), 'system', 'system'),
('PAR004', '삼성생명 파트너', '123-45-67892', '이명우', (SELECT id FROM users WHERE email = 'samsung-life@partner.com'), 'system', 'system'),
('PAR005', '삼성화재 파트너', '123-45-67893', '박동훈', (SELECT id FROM users WHERE email = 'samsung-fire@partner.com'), 'system', 'system'),
('PAR006', '삼성물산 파트너', '123-45-67894', '오세철', (SELECT id FROM users WHERE email = 'samsung-cnt2@partner.com'), 'system', 'system'),
('PAR007', '삼성전기 파트너', '123-45-67895', '전동수', (SELECT id FROM users WHERE email = 'samsung-electro@partner.com'), 'system', 'system'),
('PAR008', '삼성SDI 파트너', '123-45-67896', '전동수', (SELECT id FROM users WHERE email = 'samsung-sdi@partner.com'), 'system', 'system'),
('PAR009', '삼성바이오로직스 파트너', '123-45-67897', '김태한', (SELECT id FROM users WHERE email = 'samsung-bio@partner.com'), 'system', 'system'),
('PAR010', '삼성엔지니어링 파트너', '123-45-67898', '윤석금', (SELECT id FROM users WHERE email = 'samsung-engineering@partner.com'), 'system', 'system'),
('PAR011', '삼성물산 파트너', '123-45-67899', '오세철', (SELECT id FROM users WHERE email = 'samsung-cnt@partner.com'), 'system', 'system');

-- 2. 현대자동차그룹 계열사 (Hyundai Auto Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR012', '현대자동차 파트너', '234-56-78901', '장재훈', (SELECT id FROM users WHERE email = 'hyundai-motor@partner.com'), 'system', 'system'),
('PAR013', '기아 파트너', '234-56-78902', '바이오', (SELECT id FROM users WHERE email = 'kia@partner.com'), 'system', 'system'),
('PAR014', '현대모비스 파트너', '234-56-78903', '이원희', (SELECT id FROM users WHERE email = 'hyundai-mobis@partner.com'), 'system', 'system'),
('PAR015', '현대위아 파트너', '234-56-78904', '이인식', (SELECT id FROM users WHERE email = 'hyundai-wia@partner.com'), 'system', 'system'),
('PAR016', '현대글로비스 파트너', '234-56-78905', '이언오', (SELECT id FROM users WHERE email = 'hyundai-glovis@partner.com'), 'system', 'system'),
('PAR017', '현대건설 파트너', '234-56-78906', '박동욱', (SELECT id FROM users WHERE email = 'hyundai-construction@partner.com'), 'system', 'system'),
('PAR018', '현대제철 파트너', '234-56-78907', '채병길', (SELECT id FROM users WHERE email = 'hyundai-steel@partner.com'), 'system', 'system'),
('PAR019', '현대오토에버 파트너', '234-56-78908', '김기남', (SELECT id FROM users WHERE email = 'hyundai-ever@partner.com'), 'system', 'system'),
('PAR020', '현대케피코 파트너', '234-56-78909', '이병철', (SELECT id FROM users WHERE email = 'hyundai-kefico@partner.com'), 'system', 'system'),
('PAR021', '현대위아 파트너', '234-56-78910', '이인식', (SELECT id FROM users WHERE email = 'hyundai-wia2@partner.com'), 'system', 'system');

-- 3. SK그룹 계열사 (SK Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR022', 'SK하이닉스 파트너', '345-67-89012', '구본무', (SELECT id FROM users WHERE email = 'sk-hynix@partner.com'), 'system', 'system'),
('PAR023', 'SK이노베이션 파트너', '345-67-89013', '김준', (SELECT id FROM users WHERE email = 'sk-innovation@partner.com'), 'system', 'system'),
('PAR024', 'SK텔레콤 파트너', '345-67-89014', '유영상', (SELECT id FROM users WHERE email = 'sk-telecom@partner.com'), 'system', 'system'),
('PAR025', 'SK스퀘어 파트너', '345-67-89015', '박정호', (SELECT id FROM users WHERE email = 'sk-square@partner.com'), 'system', 'system'),
('PAR026', 'SK디스커버리 파트너', '345-67-89016', '이석채', (SELECT id FROM users WHERE email = 'sk-discovery@partner.com'), 'system', 'system'),
('PAR027', 'SKC 파트너', '345-67-89017', '이형희', (SELECT id FROM users WHERE email = 'skc@partner.com'), 'system', 'system'),
('PAR028', 'SK가스 파트너', '345-67-89018', '이형희', (SELECT id FROM users WHERE email = 'sk-gas@partner.com'), 'system', 'system'),
('PAR029', 'SK엔무브 파트너', '345-67-89019', '이형희', (SELECT id FROM users WHERE email = 'sk-move@partner.com'), 'system', 'system'),
('PAR030', 'SK바이오팜 파트너', '345-67-89020', '이형희', (SELECT id FROM users WHERE email = 'sk-biopharm@partner.com'), 'system', 'system'),
('PAR031', 'SK쉴더스 파트너', '345-67-89021', '이형희', (SELECT id FROM users WHERE email = 'sk-shields@partner.com'), 'system', 'system');

-- 4. LG그룹 계열사 (LG Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR032', 'LG전자 파트너', '456-78-90123', '권봉석', (SELECT id FROM users WHERE email = 'lg-electronics@partner.com'), 'system', 'system'),
('PAR033', 'LG화학 파트너', '456-78-90124', '신학철', (SELECT id FROM users WHERE email = 'lg-chemical@partner.com'), 'system', 'system'),
('PAR034', 'LG디스플레이 파트너', '456-78-90125', '정호영', (SELECT id FROM users WHERE email = 'lg-display@partner.com'), 'system', 'system'),
('PAR035', 'LG이노텍 파트너', '456-78-90126', '정철동', (SELECT id FROM users WHERE email = 'lg-innotek@partner.com'), 'system', 'system'),
('PAR036', 'LG유플러스 파트너', '456-78-90127', '황현식', (SELECT id FROM users WHERE email = 'lg-uplus@partner.com'), 'system', 'system'),
('PAR037', 'LG생활건강 파트너', '456-78-90128', '차석용', (SELECT id FROM users WHERE email = 'lg-life@partner.com'), 'system', 'system'),
('PAR038', 'LG CNS 파트너', '456-78-90129', '김영섭', (SELECT id FROM users WHERE email = 'lg-cns@partner.com'), 'system', 'system'),
('PAR039', 'LG상사 파트너', '456-78-90130', '이동식', (SELECT id FROM users WHERE email = 'lg-trading@partner.com'), 'system', 'system'),
('PAR040', 'LG하우시스 파트너', '456-78-90131', '이동식', (SELECT id FROM users WHERE email = 'lg-house@partner.com'), 'system', 'system'),
('PAR041', 'LG에너지솔루션 파트너', '456-78-90132', '김종현', (SELECT id FROM users WHERE email = 'lg-energy@partner.com'), 'system', 'system');

-- 5. 롯데그룹 계열사 (Lotte Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR042', '롯데제과 파트너', '567-89-01234', '민명기', (SELECT id FROM users WHERE email = 'lotte-confectionery@partner.com'), 'system', 'system'),
('PAR043', '롯데칠성음료 파트너', '567-89-01235', '이영호', (SELECT id FROM users WHERE email = 'lotte-chilsung@partner.com'), 'system', 'system'),
('PAR044', '롯데마트 파트너', '567-89-01236', '장선욱', (SELECT id FROM users WHERE email = 'lotte-mart@partner.com'), 'system', 'system'),
('PAR045', '롯데백화점 파트너', '567-89-01237', '장선욱', (SELECT id FROM users WHERE email = 'lotte-department@partner.com'), 'system', 'system'),
('PAR046', '롯데호텔 파트너', '567-89-01238', '김형욱', (SELECT id FROM users WHERE email = 'lotte-hotel@partner.com'), 'system', 'system'),
('PAR047', '롯데푸드 파트너', '567-89-01239', '이명구', (SELECT id FROM users WHERE email = 'lotte-food@partner.com'), 'system', 'system'),
('PAR048', '롯데렌탈 파트너', '567-89-01240', '이명구', (SELECT id FROM users WHERE email = 'lotte-rental@partner.com'), 'system', 'system'),
('PAR049', '롯데손해보험 파트너', '567-89-01241', '이명구', (SELECT id FROM users WHERE email = 'lotte-insurance@partner.com'), 'system', 'system'),
('PAR050', '롯데글로벌로지스 파트너', '567-89-01242', '이명구', (SELECT id FROM users WHERE email = 'lotte-logistics@partner.com'), 'system', 'system'),
('PAR051', '롯데케미칼 파트너', '567-89-01243', '신종훈', (SELECT id FROM users WHERE email = 'lotte-chemical@partner.com'), 'system', 'system');

-- 6. 신세계그룹 계열사 (Shinsegae Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR052', '신세계 파트너', '678-90-12345', '정용진', (SELECT id FROM users WHERE email = 'shinsegae@partner.com'), 'system', 'system'),
('PAR053', '이마트 파트너', '678-90-12346', '장동훈', (SELECT id FROM users WHERE email = 'emart@partner.com'), 'system', 'system'),
('PAR054', '신세계푸드 파트너', '678-90-12347', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-food@partner.com'), 'system', 'system'),
('PAR055', '신세계건설 파트너', '678-90-12348', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-construction@partner.com'), 'system', 'system'),
('PAR056', '신세계프라퍼티 파트너', '678-90-12349', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-property@partner.com'), 'system', 'system'),
('PAR057', '신세계조선호텔 파트너', '678-90-12350', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-hotel@partner.com'), 'system', 'system'),
('PAR058', '신세계라이브러리 파트너', '678-90-12351', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-library@partner.com'), 'system', 'system'),
('PAR059', '신세계I&C 파트너', '678-90-12352', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-nc@partner.com'), 'system', 'system'),
('PAR060', '신세계프라퍼티 파트너', '678-90-12353', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-property2@partner.com'), 'system', 'system'),
('PAR061', '신세계푸드 파트너', '678-90-12354', '이희권', (SELECT id FROM users WHERE email = 'shinsegae-food2@partner.com'), 'system', 'system');

-- 7. GS그룹 계열사 (GS Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR062', 'GS칼텍스 파트너', '789-01-23456', '송재호', (SELECT id FROM users WHERE email = 'gs-calnex@partner.com'), 'system', 'system'),
('PAR063', 'GS리테일 파트너', '789-01-23457', '허연수', (SELECT id FROM users WHERE email = 'gs-retail@partner.com'), 'system', 'system'),
('PAR064', 'GS건설 파트너', '789-01-23458', ' 허윤홍', (SELECT id FROM users WHERE email = 'gs-construction@partner.com'), 'system', 'system'),
('PAR065', 'GS글로벌 파트너', '789-01-23459', ' 허연수', (SELECT id FROM users WHERE email = 'gs-global@partner.com'), 'system', 'system'),
('PAR066', 'GS EPS 파트너', '789-01-23460', ' 허연수', (SELECT id FROM users WHERE email = 'gs-eps@partner.com'), 'system', 'system'),
('PAR067', 'GS네오텍 파트너', '789-01-23461', ' 허연수', (SELECT id FROM users WHERE email = 'gs-neotech@partner.com'), 'system', 'system'),
('PAR068', 'GS수퍼마켓 파트너', '789-01-23462', ' 허연수', (SELECT id FROM users WHERE email = 'gs-supermarket@partner.com'), 'system', 'system'),
('PAR069', 'GS홈쇼핑 파트너', '789-01-23463', ' 허연수', (SELECT id FROM users WHERE email = 'gs-homeshopping@partner.com'), 'system', 'system'),
('PAR070', 'GS파워 파트너', '789-01-23464', ' 허연수', (SELECT id FROM users WHERE email = 'gs-power@partner.com'), 'system', 'system'),
('PAR071', 'GS리테일 파트너', '789-01-23465', ' 허연수', (SELECT id FROM users WHERE email = 'gs-retail2@partner.com'), 'system', 'system');

-- 8. 한화그룹 계열사 (Hanwha Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR072', '한화솔루션 파트너', '890-12-34567', '김동관', (SELECT id FROM users WHERE email = 'hanwha-solution@partner.com'), 'system', 'system'),
('PAR073', '한화에어로스페이스 파트너', '890-12-34568', '김동관', (SELECT id FROM users WHERE email = 'hanwha-aerospace@partner.com'), 'system', 'system'),
('PAR074', '한화시스템 파트너', '890-12-34569', '김동관', (SELECT id FROM users WHERE email = 'hanwha-system@partner.com'), 'system', 'system'),
('PAR075', '한화에너지 파트너', '890-12-34570', '김동관', (SELECT id FROM users WHERE email = 'hanwha-energy@partner.com'), 'system', 'system'),
('PAR076', '한화생명 파트너', '890-12-34571', '이동명', (SELECT id FROM users WHERE email = 'hanwha-life@partner.com'), 'system', 'system'),
('PAR077', '한화손해보험 파트너', '890-12-34572', '이동명', (SELECT id FROM users WHERE email = 'hanwha-insurance@partner.com'), 'system', 'system'),
('PAR078', '한화투자증권 파트너', '890-12-34573', '이동명', (SELECT id FROM users WHERE email = 'hanwha-securities@partner.com'), 'system', 'system'),
('PAR079', '한화자산운용 파트너', '890-12-34574', '이동명', (SELECT id FROM users WHERE email = 'hanwha-asset@partner.com'), 'system', 'system'),
('PAR080', '한화캐피탈 파트너', '890-12-34575', '이동명', (SELECT id FROM users WHERE email = 'hanwha-capital@partner.com'), 'system', 'system'),
('PAR081', '한화생명 파트너', '890-12-34576', '이동명', (SELECT id FROM users WHERE email = 'hanwha-life2@partner.com'), 'system', 'system');

-- 9. 대우그룹 계열사 (Daewoo Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR082', '대우조선해양 파트너', '901-23-45678', '이성근', (SELECT id FROM users WHERE email = 'daewoo-shipbuilding@partner.com'), 'system', 'system'),
('PAR083', '대우건설 파트너', '901-23-45679', '박영준', (SELECT id FROM users WHERE email = 'daewoo-construction@partner.com'), 'system', 'system'),
('PAR084', '대우산업 파트너', '901-23-45680', '박영준', (SELECT id FROM users WHERE email = 'daewoo-industry@partner.com'), 'system', 'system'),
('PAR085', '대우중공업 파트너', '901-23-45681', '박영준', (SELECT id FROM users WHERE email = 'daewoo-heavy@partner.com'), 'system', 'system'),
('PAR086', '대우조선 파트너', '901-23-45682', '박영준', (SELECT id FROM users WHERE email = 'daewoo-ship@partner.com'), 'system', 'system'),
('PAR087', '대우해양 파트너', '901-23-45683', '박영준', (SELECT id FROM users WHERE email = 'daewoo-ocean@partner.com'), 'system', 'system'),
('PAR088', '대우산업 파트너', '901-23-45684', '박영준', (SELECT id FROM users WHERE email = 'daewoo-industry2@partner.com'), 'system', 'system'),
('PAR089', '대우중공업 파트너', '901-23-45685', '박영준', (SELECT id FROM users WHERE email = 'daewoo-heavy2@partner.com'), 'system', 'system'),
('PAR090', '대우조선 파트너', '901-23-45686', '박영준', (SELECT id FROM users WHERE email = 'daewoo-ship2@partner.com'), 'system', 'system'),
('PAR091', '대우해양 파트너', '901-23-45687', '박영준', (SELECT id FROM users WHERE email = 'daewoo-ocean2@partner.com'), 'system', 'system');

-- 10. 한진그룹 계열사 (Hanjin Group)
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR092', '대한항공 파트너', '012-34-56789', '우기홍', (SELECT id FROM users WHERE email = 'korean-air@partner.com'), 'system', 'system'),
('PAR093', '한진 파트너', '012-34-56790', '조현민', (SELECT id FROM users WHERE email = 'hanjin@partner.com'), 'system', 'system'),
('PAR094', '한진칼 파트너', '012-34-56791', '조현민', (SELECT id FROM users WHERE email = 'hanjin-kal@partner.com'), 'system', 'system'),
('PAR095', '대한통운 파트너', '012-34-56792', '박연호', (SELECT id FROM users WHERE email = 'korean-express@partner.com'), 'system', 'system'),
('PAR096', '한진중공업 파트너', '012-34-56793', '박연호', (SELECT id FROM users WHERE email = 'hanjin-heavy@partner.com'), 'system', 'system'),
('PAR097', '한진해운 파트너', '012-34-56794', '박연호', (SELECT id FROM users WHERE email = 'hanjin-shipping@partner.com'), 'system', 'system');

-- 11. 기타 파트너
INSERT INTO partners (code, name, business_number, ceo_name, manager_id, created_by, updated_by) VALUES
('PAR098', 'GCDC 파트너', '012-34-56795', '김영실', (SELECT id FROM users WHERE email = 'gcdc@partner.com'), 'system', 'system'),
('PAR099', '디플럭스 파트너', '012-34-56796', '김회석', (SELECT id FROM users WHERE email = 'dflux@partner.com'), 'system', 'system'),
('PAR100', '잔소프트 파트너', '012-34-56797', '김지환', (SELECT id FROM users WHERE email = 'jansoft@partner.com'), 'system', 'system'),
('PAR101', '진커뮤니케이션 파트너', '012-34-56798', '이명호', (SELECT id FROM users WHERE email = 'jinkomm@partner.com'), 'system', 'system');

-- 파트너 데이터 및 담당자 데이터 삽입 완료
-- 총 100개의 파트너 데이터와 각 파트너당 1명의 담당자(사용자) 데이터가 삽입되었습니다.
-- 모든 담당자는 ARIS 본사 소속이며, 기본적으로 활성화된 상태입니다.
-- 파트너와 담당자는 manager_id로 연결되어 있습니다.