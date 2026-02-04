-- APPROVAL 데이터 삽입 쿼리 (V3.0.16)
-- SR, SPEC, RELEASE에 대한 승인 요청 데이터 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- APPROVAL 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 승인번호, 승인유형, 대상ID, 상태, 현재단계, 전체단계, 요청자, 요청일시, 완료일시
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/approvals
-- 백엔드 객체: ApprovalService.createApproval()
-- 대상 테이블 & 컬럼: approvals (approval_number, approval_type, target_id, status, current_step, total_steps, requester_id, requested_at, completed_at, created_by, updated_by)
-- 연계 테이블: approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: ApprovalService, ApprovalRepository, ApprovalLineRepository, UserRepository, NotificationService
-- 연관 DB 객체: approvals 테이블, approval_lines 테이블, users 테이블 (requester_id, approver_id FK)
--              service_requests, specifications, releases 테이블 (target_id 참조)
-- 사이드 이펙트: 승인 번호 자동 생성, 승인 라인 자동 구성, 알림 발송, 상태 변경 트리거
-- 프론트 연동: ApprovalRequestPage.tsx에서 API 호출

-- 3. SR, SPEC, RELEASE 기준 APPROVAL 데이터 삽입 쿼리 (멱등성 보장)
-- SR 승인요청 30개, SPEC 승인요청 30개, 릴리즈 승인요청 40개 생성

-- ========================================
-- 사전 작업: 승인자 ID 확인 및 기본값 설정
-- ========================================

-- 승인자로 사용할 사용자 ID 조회 (파트너 사용자 중 처음 3명을 승인자로 활용)
DO $$
DECLARE
    approver1_id BIGINT;
    approver2_id BIGINT;
    approver3_id BIGINT;
BEGIN
    -- 첫 번째 승인자 (1단계 승인자)
    SELECT id INTO approver1_id FROM users WHERE email LIKE '%@partner.com' ORDER BY id LIMIT 1;
    IF approver1_id IS NULL THEN
        SELECT id INTO approver1_id FROM users ORDER BY id LIMIT 1;
    END IF;
    
    -- 두 번째 승인자 (2단계 승인자)
    SELECT id INTO approver2_id FROM users WHERE email LIKE '%@partner.com' ORDER BY id OFFSET 1 LIMIT 1;
    IF approver2_id IS NULL THEN
        SELECT id INTO approver2_id FROM users ORDER BY id OFFSET 1 LIMIT 1;
    END IF;
    
    -- 세 번째 승인자 (3단계 승인자)
    SELECT id INTO approver3_id FROM users WHERE email LIKE '%@partner.com' ORDER BY id OFFSET 2 LIMIT 1;
    IF approver3_id IS NULL THEN
        SELECT id INTO approver3_id FROM users ORDER BY id OFFSET 2 LIMIT 1;
    END IF;
    
    -- 임시 테이블에 저장
    CREATE TEMP TABLE IF NOT EXISTS temp_approvers (
        step_order INT PRIMARY KEY,
        approver_id BIGINT NOT NULL
    );
    
    TRUNCATE temp_approvers;
    
    INSERT INTO temp_approvers (step_order, approver_id) VALUES (1, approver1_id);
    INSERT INTO temp_approvers (step_order, approver_id) VALUES (2, approver2_id);
    INSERT INTO temp_approvers (step_order, approver_id) VALUES (3, approver3_id);
    
    RAISE NOTICE 'Approvers set: 1st=%, 2nd=%, 3rd=%', approver1_id, approver2_id, approver3_id;
END $$;

-- ========================================
-- SR 승인 요청 (30개) - PENDING 상태
-- ========================================

-- SR 승인 요청 데이터 생성
INSERT INTO approvals (approval_number, approval_type, target_id, status, current_step, total_steps, requester_id, requested_at, completed_at, created_by, updated_by)
SELECT 
    'APP2501-' || LPAD((row_number() OVER (ORDER BY sr.id))::TEXT, 4, '0') as approval_number,
    'SR' as approval_type,
    sr.id as target_id,
    'PENDING' as status,
    1 as current_step,
    2 as total_steps,
    sr.requester_id,
    sr.created_at as requested_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT sr.* 
    FROM service_requests sr
    WHERE sr.deleted_at IS NULL
    ORDER BY sr.id
    LIMIT 30
) sr
ON CONFLICT (approval_number) DO NOTHING;

-- SR 승인 라인 1단계: 1차 승인자 (PENDING)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    1 as step_order,
    ta.approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
CROSS JOIN temp_approvers ta
WHERE a.approval_type = 'SR' 
  AND a.approval_number BETWEEN 'APP2501-0001' AND 'APP2501-0030'
  AND ta.step_order = 1
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- SR 승인 라인 2단계: 2차 승인자 (PENDING)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    2 as step_order,
    ta.approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
CROSS JOIN temp_approvers ta
WHERE a.approval_type = 'SR' 
  AND a.approval_number BETWEEN 'APP2501-0001' AND 'APP2501-0030'
  AND ta.step_order = 2
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- ========================================
-- SPEC 승인 요청 (30개) - PENDING 상태
-- ========================================

-- SPEC 승인 요청 데이터 생성
INSERT INTO approvals (approval_number, approval_type, target_id, status, current_step, total_steps, requester_id, requested_at, completed_at, created_by, updated_by)
SELECT 
    'APP2501-' || LPAD((31 + (row_number() OVER (ORDER BY spec.id) - 1))::TEXT, 4, '0') as approval_number,
    'SPEC' as approval_type,
    spec.id as target_id,
    'PENDING' as status,
    1 as current_step,
    3 as total_steps,
    sr.requester_id,
    spec.created_at as requested_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT spec.* 
    FROM specifications spec
    WHERE spec.deleted_at IS NULL
    ORDER BY spec.id
    LIMIT 30
) spec
JOIN service_requests sr ON spec.sr_id = sr.id
ON CONFLICT (approval_number) DO NOTHING;

-- SPEC 승인 라인 1단계: 검토자 승인 (reviewer_id 또는 1차 승인자)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    1 as step_order,
    COALESCE(spec.reviewer_id, ta.approver_id) as approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
JOIN specifications spec ON a.target_id = spec.id AND a.approval_type = 'SPEC'
CROSS JOIN temp_approvers ta
WHERE a.approval_number BETWEEN 'APP2501-0031' AND 'APP2501-0060'
  AND ta.step_order = 1
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- SPEC 승인 라인 2단계: 2차 승인자 (PENDING)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    2 as step_order,
    ta.approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
CROSS JOIN temp_approvers ta
WHERE a.approval_type = 'SPEC' 
  AND a.approval_number BETWEEN 'APP2501-0031' AND 'APP2501-0060'
  AND ta.step_order = 2
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- SPEC 승인 라인 3단계: 3차 승인자 (PENDING)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    3 as step_order,
    ta.approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
CROSS JOIN temp_approvers ta
WHERE a.approval_type = 'SPEC' 
  AND a.approval_number BETWEEN 'APP2501-0031' AND 'APP2501-0060'
  AND ta.step_order = 3
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- ========================================
-- RELEASE 승인 요청 (40개) - PENDING 상태
-- ========================================

-- RELEASE 승인 요청 데이터 생성
INSERT INTO approvals (approval_number, approval_type, target_id, status, current_step, total_steps, requester_id, requested_at, completed_at, created_by, updated_by)
SELECT 
    'APP2501-' || LPAD((61 + (row_number() OVER (ORDER BY rel.id) - 1))::TEXT, 4, '0') as approval_number,
    'RELEASE' as approval_type,
    rel.id as target_id,
    'PENDING' as status,
    1 as current_step,
    2 as total_steps,
    rel.requester_id,
    rel.created_at as requested_at,
    NULL as completed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT rel.* 
    FROM releases rel
    WHERE rel.deleted_at IS NULL
      AND rel.status = 'REQUESTED'
    ORDER BY rel.id
    LIMIT 40
) rel
ON CONFLICT (approval_number) DO NOTHING;

-- RELEASE 승인 라인 1단계: 1차 승인자 (PENDING)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    1 as step_order,
    ta.approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
CROSS JOIN temp_approvers ta
WHERE a.approval_type = 'RELEASE' 
  AND a.approval_number BETWEEN 'APP2501-0061' AND 'APP2501-0100'
  AND ta.step_order = 1
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- RELEASE 승인 라인 2단계: 2차 승인자 (PENDING)
INSERT INTO approval_lines (approval_id, step_order, approver_id, status, comment, approved_at)
SELECT 
    a.id as approval_id,
    2 as step_order,
    ta.approver_id,
    'PENDING' as status,
    NULL as comment,
    NULL as approved_at
FROM approvals a
CROSS JOIN temp_approvers ta
WHERE a.approval_type = 'RELEASE' 
  AND a.approval_number BETWEEN 'APP2501-0061' AND 'APP2501-0100'
  AND ta.step_order = 2
ON CONFLICT (approval_id, step_order) DO NOTHING;

-- ========================================
-- 4. APPROVAL 데이터 검증 쿼리
-- ========================================

-- APPROVAL 데이터 건수 확인
SELECT COUNT(*) as approval_count FROM approvals;

-- APPROVAL 번호 중복 검증
SELECT approval_number, COUNT(*) as duplicate_count 
FROM approvals 
GROUP BY approval_number 
HAVING COUNT(*) > 1;

-- 요청자 존재 검증
SELECT a.approval_number, a.requester_id, u.email
FROM approvals a
LEFT JOIN users u ON a.requester_id = u.id
WHERE u.id IS NULL;

-- 승인 라인 건수 확인
SELECT COUNT(*) as approval_line_count FROM approval_lines;

-- 승인 라인 approver_id NULL 검증
SELECT al.id, al.approval_id, al.step_order, al.approver_id
FROM approval_lines al
WHERE al.approver_id IS NULL;

-- 승인 유형별 통계
SELECT approval_type, status, COUNT(*) as count
FROM approvals
GROUP BY approval_type, status
ORDER BY approval_type, status;

-- 승인 상태별 통계
SELECT 
    status,
    COUNT(*) as count,
    ROUND(COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM approvals) * 100, 2) as percentage
FROM approvals
GROUP BY status
ORDER BY count DESC;

-- 승인 단계별 통계
SELECT 
    approval_type,
    total_steps,
    AVG(current_step) as avg_current_step,
    COUNT(*) as count
FROM approvals
GROUP BY approval_type, total_steps
ORDER BY approval_type, total_steps;

-- 승인자별 대기 건수
SELECT 
    u.email as approver_email,
    COUNT(al.id) as pending_count,
    STRING_AGG(DISTINCT a.approval_type, ', ' ORDER BY a.approval_type) as approval_types
FROM approval_lines al
JOIN approvals a ON al.approval_id = a.id
JOIN users u ON al.approver_id = u.id
WHERE al.status = 'PENDING'
GROUP BY u.email
ORDER BY pending_count DESC;

-- 요청자별 승인 현황
SELECT 
    u.email as requester_email,
    COUNT(a.id) as total_requests,
    SUM(CASE WHEN a.status = 'PENDING' THEN 1 ELSE 0 END) as pending,
    SUM(CASE WHEN a.status = 'APPROVED' THEN 1 ELSE 0 END) as approved,
    SUM(CASE WHEN a.status = 'REJECTED' THEN 1 ELSE 0 END) as rejected
FROM approvals a
JOIN users u ON a.requester_id = u.id
GROUP BY u.email
HAVING COUNT(a.id) > 0
ORDER BY total_requests DESC
LIMIT 20;

-- 대기중인 승인 상세 현황
SELECT 
    a.approval_number,
    a.approval_type,
    CASE 
        WHEN a.approval_type = 'SR' THEN sr.sr_number
        WHEN a.approval_type = 'SPEC' THEN spec.spec_number
        WHEN a.approval_type = 'RELEASE' THEN rel.release_number
    END as target_number,
    CASE 
        WHEN a.approval_type = 'SR' THEN sr.title
        WHEN a.approval_type = 'SPEC' THEN 'SPEC for SR: ' || sr_for_spec.sr_number
        WHEN a.approval_type = 'RELEASE' THEN rel.title
    END as target_title,
    a.current_step,
    a.total_steps,
    u.email as requester,
    a.requested_at,
    EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - a.requested_at))/3600 as hours_waiting
FROM approvals a
JOIN users u ON a.requester_id = u.id
LEFT JOIN service_requests sr ON a.approval_type = 'SR' AND a.target_id = sr.id
LEFT JOIN specifications spec ON a.approval_type = 'SPEC' AND a.target_id = spec.id
LEFT JOIN service_requests sr_for_spec ON spec.sr_id = sr_for_spec.id
LEFT JOIN releases rel ON a.approval_type = 'RELEASE' AND a.target_id = rel.id
WHERE a.status = 'PENDING'
ORDER BY a.requested_at
LIMIT 20;

-- 승인 라인별 처리 현황
SELECT 
    a.approval_type,
    al.step_order,
    al.status,
    COUNT(*) as count
FROM approval_lines al
JOIN approvals a ON al.approval_id = a.id
GROUP BY a.approval_type, al.step_order, al.status
ORDER BY a.approval_type, al.step_order, al.status;

-- 승인 라인별 승인자 현황
SELECT 
    a.approval_type,
    al.step_order,
    u.email as approver,
    COUNT(*) as assigned_count
FROM approval_lines al
JOIN approvals a ON al.approval_id = a.id
JOIN users u ON al.approver_id = u.id
GROUP BY a.approval_type, al.step_order, u.email
ORDER BY a.approval_type, al.step_order;

-- 임시 테이블 정리
DROP TABLE IF EXISTS temp_approvers;

-- APPROVAL 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.10(SR), V3.0.11(SPEC), V3.0.14(RELEASE)에서 생성된 데이터를 기반으로 승인 요청 데이터를 생성하였습니다.
-- 모든 APPROVAL은 실제 SR/SPEC/RELEASE를 참조하며, 승인 라인(approval_lines)도 함께 생성됩니다.
-- APPROVAL 번호 중복 검증 및 FK 존재 검증을 통해 데이터 무결성을 보장합니다.
-- approver_id NOT NULL 제약조건 위반 방지를 위해 임시 테이블(temp_approvers)을 활용하여 승인자를 사전에 확보합니다.
-- 
-- 모든 APPROVAL은 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - approval_type: 'SR', 'SPEC', 'RELEASE', 'DATA_EXTRACTION'
--   - status: 'PENDING'(승인대기), 'APPROVED'(승인완료), 'REJECTED'(반려), 'CANCELLED'(취소)
-- 
-- 승인 구성:
--   - SR 승인 요청: 30개 (APP2501-0001 ~ 0030) - PENDING, 2단계 승인
--   - SPEC 승인 요청: 30개 (APP2501-0031 ~ 0060) - PENDING, 3단계 승인
--   - RELEASE 승인 요청: 40개 (APP2501-0061 ~ 0100) - PENDING, 2단계 승인
--   - 총 100개의 승인 요청 데이터
--   - 각 승인마다 승인 라인(approval_lines) 자동 생성
--   - 승인자는 파트너 사용자 중 처음 3명을 활용 (안전한 승인자 할당)
--   - SPEC의 경우 reviewer_id가 있으면 우선 활용, 없으면 기본 승인자 사용
--   - 실제 승인 프로세스 시뮬레이션
