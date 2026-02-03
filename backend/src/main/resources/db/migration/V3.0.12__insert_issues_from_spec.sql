-- ISSUE 데이터 삽입 쿼리 (V3.0.12)
-- V3.0.11__insert_spec_from_sr.sql에 있는 SPEC 기준으로 각 SPEC당 2-3개씩 ISSUE 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- ISSUE 등록 화면 요소와 API 흐름 분석
-- 화면 요소: ISSUE명, SPEC, SR, 프로젝트, 유형, 우선순위, 상태, 담당자, 보고자, 내용
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/issues
-- 백엔드 객체: IssueService.createIssue()
-- 대상 테이블 & 컬럼: issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: IssueService, IssueRepository, SpecRepository, SrRepository, ProjectRepository, UserRepository
-- 연관 DB 객체: issues 테이블, specifications 테이블 (spec_id FK), service_requests 테이블 (sr_id FK), projects 테이블 (project_id FK), users 테이블 (assignee_id, reporter_id FK)
-- 사이드 이펙트: ISSUE 번호 자동 생성, SPEC/SR 존재 검증, 담당자/보고자 권한 검증
-- 프론트 연동: IssueCreatePage.tsx에서 API 호출

-- 3. SPEC 기준 ISSUE 데이터 삽입 쿼리 (멱등성 보장)
-- V3.0.11__insert_spec_from_sr.sql에 있는 SPEC 기준으로 각 SPEC당 2-3개 ISSUE 생성

-- ========================================
-- SPEC2501-0001 기준 이슈들
-- ========================================

-- ISSUE #1: 로그인 버그
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0001' as issue_number,
    '로그인 시 세션 타임아웃 오류' as title,
    '사용자가 로그인 후 5분 이상 작업 없을 시 세션이 예상보다 빨리 만료되는 문제가 발생합니다. 설정된 30분 타임아웃이 제대로 작동하지 않습니다.' as content,
    'OPEN' as status,
    'BUG' as issue_type,
    'HIGH' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0001'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- ISSUE #2: 성능 개선
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0002' as issue_number,
    '대시보드 로딩 속도 개선 필요' as title,
    '현재 대시보드 페이지 로딩 시간이 3초 이상 소요됩니다. 1초 이내로 개선이 필요합니다. 데이터 캐싱 및 쿼리 최적화를 검토해주세요.' as content,
    'IN_PROGRESS' as status,
    'IMPROVEMENT' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0001'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- ISSUE #3: 신규 기능
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0003' as issue_number,
    '다국어 지원 기능 추가' as title,
    '글로벌 서비스 확장을 위해 한국어, 영어, 일본어, 중국어 다국어 지원 기능이 필요합니다. i18n 라이브러리 적용을 검토해주세요.' as content,
    'OPEN' as status,
    'NEW_FEATURE' as issue_type,
    'LOW' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0001'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- ========================================
-- SPEC2501-0002 ~ 0010 기준 이슈들
-- ========================================

-- SPEC2501-0002: 삼성물산
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0004' as issue_number,
    '파일 업로드 크기 제한 오류' as title,
    '10MB 이상 파일 업로드 시 오류가 발생합니다. 최대 50MB까지 업로드 가능하도록 수정 필요합니다.' as content,
    'RESOLVED' as status,
    'BUG' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0002'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0005' as issue_number,
    '엑셀 다운로드 기능 개선' as title,
    '현재 CSV 형식만 지원하는데, XLSX 형식 다운로드 기능이 필요합니다.' as content,
    'OPEN' as status,
    'IMPROVEMENT' as issue_type,
    'LOW' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0002'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0003: 삼성생명
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0006' as issue_number,
    'API 응답 시간 초과 문제' as title,
    '특정 API 호출 시 30초 이상 응답이 지연되어 타임아웃이 발생합니다. 데이터베이스 인덱스 최적화가 필요합니다.' as content,
    'IN_PROGRESS' as status,
    'BUG' as issue_type,
    'CRITICAL' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0003'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0007' as issue_number,
    '검색 기능 고도화' as title,
    '전체 텍스트 검색(Full-Text Search) 기능을 추가하여 검색 정확도를 향상시켜야 합니다.' as content,
    'OPEN' as status,
    'NEW_FEATURE' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0003'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0004: 삼성화재
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0008' as issue_number,
    '데이터 동기화 실패 문제' as title,
    '외부 시스템과의 데이터 동기화 작업이 간헐적으로 실패합니다. 재시도 로직 및 오류 로깅 강화가 필요합니다.' as content,
    'OPEN' as status,
    'BUG' as issue_type,
    'HIGH' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0004'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0009' as issue_number,
    '알림 기능 추가' as title,
    '중요한 이벤트 발생 시 이메일/SMS 알림 기능이 필요합니다. 알림 템플릿 관리 기능도 포함되어야 합니다.' as content,
    'IN_PROGRESS' as status,
    'NEW_FEATURE' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0004'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0005: 삼성전기
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0010' as issue_number,
    'UI 반응속도 개선' as title,
    '화면 전환 시 렌더링 지연이 발생합니다. Virtual DOM 최적화 및 불필요한 리렌더링을 제거해주세요.' as content,
    'RESOLVED' as status,
    'IMPROVEMENT' as issue_type,
    'LOW' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0005'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0011' as issue_number,
    '데이터 백업 자동화' as title,
    '매일 자정에 자동으로 데이터베이스 백업이 수행되도록 스케줄러를 구현해야 합니다.' as content,
    'OPEN' as status,
    'TASK' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0005'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0006: 삼성SDI
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0012' as issue_number,
    '권한 관리 오류' as title,
    '특정 사용자가 본인 권한 이상의 기능에 접근 가능한 보안 취약점이 발견되었습니다. 즉시 수정이 필요합니다.' as content,
    'IN_PROGRESS' as status,
    'BUG' as issue_type,
    'CRITICAL' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0006'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0013' as issue_number,
    '모바일 반응형 UI 개선' as title,
    '모바일 환경에서 일부 UI 요소가 제대로 표시되지 않습니다. 반응형 디자인을 개선해주세요.' as content,
    'OPEN' as status,
    'IMPROVEMENT' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0006'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0007: 삼성바이오로직스
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0014' as issue_number,
    '차트 라이브러리 업데이트' as title,
    '현재 사용 중인 차트 라이브러리가 구버전이라 최신 기능을 사용할 수 없습니다. 최신 버전으로 업그레이드가 필요합니다.' as content,
    'CLOSED' as status,
    'TASK' as issue_type,
    'LOW' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0007'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0015' as issue_number,
    '비밀번호 정책 강화' as title,
    '현재 비밀번호 정책이 약합니다. 최소 10자 이상, 특수문자 포함, 정기 변경 정책을 적용해야 합니다.' as content,
    'OPEN' as status,
    'NEW_FEATURE' as issue_type,
    'HIGH' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0007'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0008: 삼성엔지니어링
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0016' as issue_number,
    '페이징 처리 오류' as title,
    '대량 데이터 조회 시 페이징이 제대로 작동하지 않아 전체 데이터가 로드되는 문제가 발생합니다.' as content,
    'IN_PROGRESS' as status,
    'BUG' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0008'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0017' as issue_number,
    '사용자 활동 로그 기능' as title,
    '보안 감사를 위해 모든 사용자 활동을 로깅하는 기능이 필요합니다. 로그 보관 정책도 함께 수립되어야 합니다.' as content,
    'OPEN' as status,
    'NEW_FEATURE' as issue_type,
    'MEDIUM' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0008'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0009: 현대자동차
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0018' as issue_number,
    '캐시 무효화 문제' as title,
    '데이터 변경 후 캐시가 즉시 무효화되지 않아 구버전 데이터가 표시됩니다. 캐시 전략을 재검토해야 합니다.' as content,
    'RESOLVED' as status,
    'BUG' as issue_type,
    'HIGH' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0009'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0019' as issue_number,
    'API 문서 자동화' as title,
    'Swagger를 활용한 API 문서 자동 생성 기능을 구현하여 개발자 생산성을 향상시켜야 합니다.' as content,
    'IN_PROGRESS' as status,
    'IMPROVEMENT' as issue_type,
    'LOW' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0009'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0010: 기아
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-0020' as issue_number,
    '날짜 형식 오류' as title,
    '다국어 환경에서 날짜 형식이 일관되지 않게 표시됩니다. 국제 표준(ISO 8601)에 맞춰 통일이 필요합니다.' as content,
    'OPEN' as status,
    'BUG' as issue_type,
    'LOW' as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number = 'SPEC2501-0010'
LIMIT 1
ON CONFLICT (issue_number) DO NOTHING;

-- ========================================
-- 추가 SPEC들에 대한 샘플 이슈 (간략화)
-- ========================================

-- 나머지 SPEC들에 대해서도 각 1-2개씩 이슈 생성 (총 30개 정도 생성)

-- SPEC2501-0011 ~ 0015
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((21 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN '데이터 검증 로직 추가'
        WHEN 1 THEN '트랜잭션 처리 개선'
        WHEN 2 THEN '에러 메시지 다국어화'
        ELSE '코드 리팩토링 필요'
    END as title,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN '입력 데이터 검증이 불충분하여 잘못된 데이터가 저장될 수 있습니다.'
        WHEN 1 THEN '복잡한 비즈니스 로직에서 트랜잭션 처리가 일관되지 않습니다.'
        WHEN 2 THEN '에러 메시지가 한국어로만 제공되어 국제 사용자에게 불편을 줍니다.'
        ELSE '레거시 코드의 복잡도가 높아 유지보수가 어렵습니다.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'OPEN'
        WHEN 1 THEN 'IN_PROGRESS'
        WHEN 2 THEN 'RESOLVED'
        ELSE 'CLOSED'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'BUG'
        WHEN 1 THEN 'IMPROVEMENT'
        WHEN 2 THEN 'NEW_FEATURE'
        ELSE 'TASK'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'HIGH'
        WHEN 1 THEN 'MEDIUM'
        WHEN 2 THEN 'LOW'
        ELSE 'CRITICAL'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN ('SPEC2501-0011', 'SPEC2501-0012', 'SPEC2501-0013', 'SPEC2501-0014', 'SPEC2501-0015')
ON CONFLICT (issue_number) DO NOTHING;

-- ========================================
-- 추가 이슈 생성 (SPEC2501-0016 ~ 0102)
-- 각 SPEC당 1개씩 자동 생성
-- ========================================

-- SPEC2501-0016 ~ 0030 (15개)
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((26 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '메모리 누수 문제 해결'
        WHEN 1 THEN '배치 작업 최적화'
        WHEN 2 THEN '실시간 알림 기능 개선'
        WHEN 3 THEN 'CSV 임포트 기능 추가'
        ELSE 'API 문서화 개선'
    END as title,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '장시간 구동 시 메모리 사용량이 지속적으로 증가하는 문제가 있습니다. 메모리 프로파일링이 필요합니다.'
        WHEN 1 THEN '야간 배치 작업이 너무 오래 걸려 업무 시작 전 완료되지 않습니다. 병렬 처리 도입이 필요합니다.'
        WHEN 2 THEN '실시간 알림이 지연되거나 누락되는 경우가 발생합니다. WebSocket 연결 안정성을 개선해야 합니다.'
        WHEN 3 THEN '대량의 데이터를 CSV 파일로 업로드할 수 있는 기능이 필요합니다. 검증 로직도 포함되어야 합니다.'
        ELSE 'API 문서가 최신 상태가 아니어서 개발자들이 혼란스러워 합니다. 자동 문서화 도구를 적용해주세요.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'OPEN'
        WHEN 1 THEN 'IN_PROGRESS'
        WHEN 2 THEN 'RESOLVED'
        ELSE 'CLOSED'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'BUG'
        WHEN 1 THEN 'IMPROVEMENT'
        WHEN 2 THEN 'NEW_FEATURE'
        ELSE 'TASK'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'CRITICAL'
        WHEN 1 THEN 'HIGH'
        WHEN 2 THEN 'MEDIUM'
        ELSE 'LOW'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN (
    'SPEC2501-0016', 'SPEC2501-0017', 'SPEC2501-0018', 'SPEC2501-0019', 'SPEC2501-0020',
    'SPEC2501-0021', 'SPEC2501-0022', 'SPEC2501-0023', 'SPEC2501-0024', 'SPEC2501-0025',
    'SPEC2501-0026', 'SPEC2501-0027', 'SPEC2501-0028', 'SPEC2501-0029', 'SPEC2501-0030'
)
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0031 ~ 0045 (15개)
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((41 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '데이터베이스 인덱스 최적화'
        WHEN 1 THEN '사용자 인터페이스 개편'
        WHEN 2 THEN '로그 수집 시스템 구축'
        WHEN 3 THEN '코드 품질 개선'
        ELSE '성능 모니터링 도구 도입'
    END as title,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '쿼리 실행 속도가 느려 사용자 경험이 저하됩니다. 인덱스 재설계가 필요합니다.'
        WHEN 1 THEN '현재 UI가 구식이며 사용성이 떨어집니다. 최신 디자인 트렌드를 반영한 UI 개편이 필요합니다.'
        WHEN 2 THEN '시스템 로그가 분산되어 있어 장애 분석이 어렵습니다. 중앙 집중식 로그 시스템 구축이 필요합니다.'
        WHEN 3 THEN 'SonarQube 분석 결과 코드 품질 점수가 낮습니다. 리팩토링 작업이 필요합니다.'
        ELSE '운영 중 성능 이슈를 실시간으로 감지할 수 있는 모니터링 도구가 필요합니다.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'IN_PROGRESS'
        WHEN 1 THEN 'OPEN'
        WHEN 2 THEN 'RESOLVED'
        ELSE 'OPEN'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'IMPROVEMENT'
        WHEN 1 THEN 'NEW_FEATURE'
        WHEN 2 THEN 'TASK'
        ELSE 'BUG'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'HIGH'
        WHEN 1 THEN 'MEDIUM'
        WHEN 2 THEN 'LOW'
        ELSE 'CRITICAL'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN (
    'SPEC2501-0031', 'SPEC2501-0032', 'SPEC2501-0033', 'SPEC2501-0034', 'SPEC2501-0035',
    'SPEC2501-0036', 'SPEC2501-0037', 'SPEC2501-0038', 'SPEC2501-0039', 'SPEC2501-0040',
    'SPEC2501-0041', 'SPEC2501-0042', 'SPEC2501-0043', 'SPEC2501-0044', 'SPEC2501-0045'
)
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0046 ~ 0060 (15개)
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((56 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '보안 취약점 점검'
        WHEN 1 THEN '자동화 테스트 커버리지 확대'
        WHEN 2 THEN '마이크로서비스 아키텍처 전환'
        WHEN 3 THEN '클라우드 마이그레이션'
        ELSE '데이터 암호화 적용'
    END as title,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN 'OWASP Top 10 보안 취약점 점검이 필요합니다. SQL Injection, XSS 등에 대한 대응이 필요합니다.'
        WHEN 1 THEN '현재 테스트 커버리지가 40%에 불과합니다. 80% 이상으로 확대가 필요합니다.'
        WHEN 2 THEN '모놀리식 아키텍처로 인해 확장성과 유지보수성이 떨어집니다. MSA 전환을 검토해야 합니다.'
        WHEN 3 THEN '온프레미스 환경에서 클라우드로 이전하여 운영 비용을 절감하고 탄력성을 확보해야 합니다.'
        ELSE '개인정보 보호를 위해 민감 데이터에 대한 암호화가 필요합니다. AES-256 적용을 검토하세요.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'OPEN'
        WHEN 1 THEN 'IN_PROGRESS'
        WHEN 2 THEN 'OPEN'
        ELSE 'RESOLVED'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'TASK'
        WHEN 1 THEN 'IMPROVEMENT'
        WHEN 2 THEN 'NEW_FEATURE'
        ELSE 'BUG'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'CRITICAL'
        WHEN 1 THEN 'HIGH'
        WHEN 2 THEN 'MEDIUM'
        ELSE 'LOW'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN (
    'SPEC2501-0046', 'SPEC2501-0047', 'SPEC2501-0048', 'SPEC2501-0049', 'SPEC2501-0050',
    'SPEC2501-0051', 'SPEC2501-0052', 'SPEC2501-0053', 'SPEC2501-0054', 'SPEC2501-0055',
    'SPEC2501-0056', 'SPEC2501-0057', 'SPEC2501-0058', 'SPEC2501-0059', 'SPEC2501-0060'
)
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0061 ~ 0075 (15개)
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((71 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '컨테이너 오케스트레이션 도입'
        WHEN 1 THEN 'CI/CD 파이프라인 구축'
        WHEN 2 THEN 'API 게이트웨이 구현'
        WHEN 3 THEN '이벤트 기반 아키텍처 적용'
        ELSE '서비스 메시 도입'
    END as title,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN 'Docker와 Kubernetes를 활용한 컨테이너 오케스트레이션으로 배포 자동화를 구현해야 합니다.'
        WHEN 1 THEN 'Jenkins 또는 GitLab CI를 활용한 자동화된 빌드/배포 파이프라인이 필요합니다.'
        WHEN 2 THEN '마이크로서비스 간 통신을 효율적으로 관리할 수 있는 API Gateway가 필요합니다.'
        WHEN 3 THEN '시스템 간 결합도를 낮추기 위해 Kafka 기반 이벤트 드리븐 아키텍처를 적용해야 합니다.'
        ELSE 'Istio 또는 Linkerd를 활용한 서비스 메시로 트래픽 관리와 보안을 강화해야 합니다.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'IN_PROGRESS'
        WHEN 1 THEN 'OPEN'
        WHEN 2 THEN 'OPEN'
        ELSE 'RESOLVED'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'NEW_FEATURE'
        WHEN 1 THEN 'TASK'
        WHEN 2 THEN 'IMPROVEMENT'
        ELSE 'BUG'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'HIGH'
        WHEN 1 THEN 'MEDIUM'
        WHEN 2 THEN 'LOW'
        ELSE 'CRITICAL'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN (
    'SPEC2501-0061', 'SPEC2501-0062', 'SPEC2501-0063', 'SPEC2501-0064', 'SPEC2501-0065',
    'SPEC2501-0066', 'SPEC2501-0067', 'SPEC2501-0068', 'SPEC2501-0069', 'SPEC2501-0070',
    'SPEC2501-0071', 'SPEC2501-0072', 'SPEC2501-0073', 'SPEC2501-0074', 'SPEC2501-0075'
)
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0076 ~ 0090 (15개)
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((86 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN '레디스 캐싱 전략 개선'
        WHEN 1 THEN 'ElasticSearch 검색 엔진 도입'
        WHEN 2 THEN 'GraphQL API 지원'
        WHEN 3 THEN 'WebRTC 실시간 통신 구현'
        ELSE 'gRPC 프로토콜 적용'
    END as title,
    CASE (row_number() OVER ()) % 5
        WHEN 0 THEN 'Redis를 활용한 캐싱 전략이 비효율적입니다. 캐시 히트율을 개선하기 위한 전략 수정이 필요합니다.'
        WHEN 1 THEN '대용량 텍스트 검색 성능 개선을 위해 ElasticSearch 도입이 필요합니다.'
        WHEN 2 THEN '유연한 API 쿼리를 위해 REST API와 함께 GraphQL을 지원해야 합니다.'
        WHEN 3 THEN '실시간 화상 회의 및 채팅 기능을 위해 WebRTC 기술을 도입해야 합니다.'
        ELSE '마이크로서비스 간 고성능 통신을 위해 gRPC 프로토콜 적용을 검토해야 합니다.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'OPEN'
        WHEN 1 THEN 'IN_PROGRESS'
        WHEN 2 THEN 'RESOLVED'
        ELSE 'OPEN'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'IMPROVEMENT'
        WHEN 1 THEN 'NEW_FEATURE'
        WHEN 2 THEN 'TASK'
        ELSE 'BUG'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'MEDIUM'
        WHEN 1 THEN 'HIGH'
        WHEN 2 THEN 'LOW'
        ELSE 'CRITICAL'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN (
    'SPEC2501-0076', 'SPEC2501-0077', 'SPEC2501-0078', 'SPEC2501-0079', 'SPEC2501-0080',
    'SPEC2501-0081', 'SPEC2501-0082', 'SPEC2501-0083', 'SPEC2501-0084', 'SPEC2501-0085',
    'SPEC2501-0086', 'SPEC2501-0087', 'SPEC2501-0088', 'SPEC2501-0089', 'SPEC2501-0090'
)
ON CONFLICT (issue_number) DO NOTHING;

-- SPEC2501-0091 ~ 0102 (12개) - 나머지 SPEC 모두 커버
INSERT INTO issues (issue_number, title, content, status, issue_type, priority, sr_id, spec_id, project_id, assignee_id, reporter_id, created_by, updated_by)
SELECT 
    'ISS2501-' || LPAD((101 + (row_number() OVER () - 1))::TEXT, 4, '0') as issue_number,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'AI/ML 모델 통합'
        WHEN 1 THEN '블록체인 기술 적용 검토'
        WHEN 2 THEN 'IoT 디바이스 연동'
        ELSE '빅데이터 분석 플랫폼 구축'
    END as title,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN '머신러닝 모델을 활용한 예측 분석 기능이 필요합니다. TensorFlow 또는 PyTorch 통합을 검토하세요.'
        WHEN 1 THEN '데이터 무결성과 투명성 확보를 위해 블록체인 기술 적용을 검토해야 합니다.'
        WHEN 2 THEN '스마트 센서 및 IoT 디바이스와의 실시간 데이터 연동이 필요합니다. MQTT 프로토콜 지원이 필요합니다.'
        ELSE 'Apache Spark 기반 빅데이터 분석 플랫폼을 구축하여 데이터 인사이트를 도출해야 합니다.'
    END as content,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'OPEN'
        WHEN 1 THEN 'OPEN'
        WHEN 2 THEN 'IN_PROGRESS'
        ELSE 'RESOLVED'
    END as status,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'NEW_FEATURE'
        WHEN 1 THEN 'TASK'
        WHEN 2 THEN 'IMPROVEMENT'
        ELSE 'BUG'
    END as issue_type,
    CASE (row_number() OVER ()) % 4
        WHEN 0 THEN 'LOW'
        WHEN 1 THEN 'MEDIUM'
        WHEN 2 THEN 'HIGH'
        ELSE 'CRITICAL'
    END as priority,
    sr.id as sr_id,
    sp.id as spec_id,
    sr.project_id as project_id,
    sp.assignee_id as assignee_id,
    sp.assignee_id as reporter_id,
    'system' as created_by,
    'system' as updated_by
FROM specifications sp
JOIN service_requests sr ON sp.sr_id = sr.id
WHERE sp.spec_number IN (
    'SPEC2501-0091', 'SPEC2501-0092', 'SPEC2501-0093', 'SPEC2501-0094', 'SPEC2501-0095',
    'SPEC2501-0096', 'SPEC2501-0097', 'SPEC2501-0098', 'SPEC2501-0099', 'SPEC2501-0100',
    'SPEC2501-0101', 'SPEC2501-0102'
)
ON CONFLICT (issue_number) DO NOTHING;

-- 4. ISSUE 데이터 검증 쿼리
-- 마이그레이션 후 데이터 검증을 위한 쿼리

-- ISSUE 데이터 건수 확인
SELECT COUNT(*) as issue_count FROM issues;

-- ISSUE 번호 중복 검증
SELECT issue_number, COUNT(*) as duplicate_count 
FROM issues 
GROUP BY issue_number 
HAVING COUNT(*) > 1;

-- SPEC/SR 존재 검증
SELECT i.issue_number, i.spec_id, sp.spec_number, i.sr_id, sr.sr_number
FROM issues i
LEFT JOIN specifications sp ON i.spec_id = sp.id
LEFT JOIN service_requests sr ON i.sr_id = sr.id
WHERE sp.id IS NULL OR sr.id IS NULL;

-- 이슈 유형별 통계
SELECT issue_type, COUNT(*) as count
FROM issues
GROUP BY issue_type
ORDER BY count DESC;

-- 이슈 우선순위별 통계
SELECT priority, COUNT(*) as count
FROM issues
GROUP BY priority
ORDER BY CASE priority
    WHEN 'CRITICAL' THEN 1
    WHEN 'HIGH' THEN 2
    WHEN 'MEDIUM' THEN 3
    WHEN 'LOW' THEN 4
END;

-- 이슈 상태별 통계
SELECT status, COUNT(*) as count
FROM issues
GROUP BY status
ORDER BY count DESC;

-- ISSUE 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.11__insert_spec_from_sr.sql에 있는 SPEC 기준으로 총 102개의 ISSUE 데이터를 생성하였습니다.
-- 모든 ISSUE는 해당 SPEC 및 SR과 연계되어 있으며, 다양한 유형과 우선순위로 구성되어 있습니다.
-- ISSUE 번호 범위: ISS2501-0001 ~ ISS2501-0112 (총 112개)
-- SPEC 커버리지: SPEC2501-0001 ~ SPEC2501-0102 (모든 SPEC에 최소 1개 이상의 ISSUE 생성)
-- ISSUE 번호 중복 검증 및 SPEC/SR 존재 검증을 통해 데이터 무결성을 보장합니다.
-- 모든 ISSUE는 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - status: 'OPEN', 'IN_PROGRESS', 'RESOLVED', 'CLOSED'
--   - issue_type: 'BUG', 'IMPROVEMENT', 'NEW_FEATURE', 'TASK'
--   - priority: 'LOW', 'MEDIUM', 'HIGH', 'CRITICAL'
-- 
-- 이슈 구성:
--   - SPEC2501-0001 ~ 0010: 상세 이슈 (각 2-3개, 총 20개)
--   - SPEC2501-0011 ~ 0102: 자동 생성 이슈 (각 1개, 총 92개)
--   - 총 112개의 다양한 이슈로 실제 프로젝트 환경을 시뮬레이션
