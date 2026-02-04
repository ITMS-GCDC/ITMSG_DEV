-- INCIDENT 데이터 삽입 쿼리 (V3.0.15)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 장애 관리 데이터 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- INCIDENT 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 장애번호, 제목, 장애유형, 시스템유형, 업무영역, 심각도, 상태, 발생일시, 해결일시, 해결방법, 담당자
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/incidents
-- 백엔드 객체: IncidentService.createIncident()
-- 대상 테이블 & 컬럼: incidents (incident_number, title, incident_type, system_type, business_area, severity, status, occurred_at, resolved_at, resolution, assignee_id, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: IncidentService, IncidentRepository, UserRepository, NotificationService
-- 연관 DB 객체: incidents 테이블, users 테이블 (assignee_id FK)
-- 사이드 이펙트: 장애 번호 자동 생성, 알림 발송, 에스컬레이션 프로세스, 해결 시간 추적
-- 프론트 연동: IncidentCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 INCIDENT 데이터 삽입 쿼리 (멱등성 보장)
-- 각 파트너의 사용자를 담당자로 하여 다양한 장애 데이터 생성 (총 100개)

-- ========================================
-- INCIDENT - RESOLVED (해결된 인시던트) (40개)
-- ========================================

INSERT INTO incidents (incident_number, title, incident_type, system_type, business_area, severity, status, occurred_at, resolved_at, resolution, assignee_id, created_by, updated_by)
SELECT 
    'INC2501-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 4, '0') as incident_number,
    CASE (row_number() OVER (ORDER BY u.id)) % 40
        WHEN 1 THEN '웹 애플리케이션 로그인 오류'
        WHEN 2 THEN '데이터베이스 조회 성능 저하'
        WHEN 3 THEN '서버 CPU 사용률 급증'
        WHEN 4 THEN '네트워크 패킷 손실 발생'
        WHEN 5 THEN 'PC 부팅 실패'
        WHEN 6 THEN 'ERP 시스템 화면 멈춤'
        WHEN 7 THEN '결제 모듈 타임아웃 오류'
        WHEN 8 THEN '데이터 동기화 지연'
        WHEN 9 THEN '웹서버 503 에러 발생'
        WHEN 10 THEN 'VPN 연결 끊김'
        WHEN 11 THEN '메일 발송 실패'
        WHEN 12 THEN '파일 업로드 오류'
        WHEN 13 THEN '서버 디스크 용량 부족'
        WHEN 14 THEN '스위치 포트 다운'
        WHEN 15 THEN '노트북 화면 깜빡임'
        WHEN 16 THEN 'API 응답 지연'
        WHEN 17 THEN '테이블 인덱스 손상'
        WHEN 18 THEN '애플리케이션 서버 메모리 부족'
        WHEN 19 THEN '방화벽 정책 오류'
        WHEN 20 THEN 'PC 네트워크 드라이버 오류'
        WHEN 21 THEN '배치 작업 실패'
        WHEN 22 THEN '데이터 백업 오류'
        WHEN 23 THEN 'WAS 서비스 다운'
        WHEN 24 THEN 'DNS 조회 실패'
        WHEN 25 THEN '프린터 연결 끊김'
        WHEN 26 THEN '모바일 앱 크래시'
        WHEN 27 THEN 'DB 커넥션 풀 고갈'
        WHEN 28 THEN '로드밸런서 헬스체크 실패'
        WHEN 29 THEN '라우터 패킷 드롭'
        WHEN 30 THEN 'PC 블루스크린 오류'
        WHEN 31 THEN '웹 페이지 깨짐 현상'
        WHEN 32 THEN '데이터 마이그레이션 실패'
        WHEN 33 THEN '서버 재부팅 필요'
        WHEN 34 THEN '네트워크 스위치 과열'
        WHEN 35 THEN 'PC USB 포트 미인식'
        WHEN 36 THEN '세션 타임아웃 오류'
        WHEN 37 THEN 'DB 트랜잭션 롤백 실패'
        WHEN 38 THEN '서버 RAID 디스크 장애'
        WHEN 39 THEN 'Wi-Fi 연결 불안정'
        ELSE 'PC 그래픽 드라이버 오류'
    END as title,
    'INCIDENT' as incident_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 5
        WHEN 0 THEN 'PROGRAM'
        WHEN 1 THEN 'DATA'
        WHEN 2 THEN 'SERVER'
        WHEN 3 THEN 'NETWORK'
        ELSE 'PC'
    END as system_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 10
        WHEN 0 THEN '재무관리'
        WHEN 1 THEN '인사관리'
        WHEN 2 THEN '생산관리'
        WHEN 3 THEN '영업관리'
        WHEN 4 THEN '구매관리'
        WHEN 5 THEN '재고관리'
        WHEN 6 THEN '품질관리'
        WHEN 7 THEN '고객관리'
        WHEN 8 THEN 'IT운영'
        ELSE '경영지원'
    END as business_area,
    CASE (row_number() OVER (ORDER BY u.id)) % 3
        WHEN 0 THEN 'HIGH'
        WHEN 1 THEN 'MEDIUM'
        ELSE 'LOW'
    END as severity,
    'RESOLVED' as status,
    TIMESTAMP '2025-01-01 09:00:00' + (INTERVAL '12 hours' * ((row_number() OVER (ORDER BY u.id) - 1))) as occurred_at,
    TIMESTAMP '2025-01-01 10:30:00' + (INTERVAL '12 hours' * ((row_number() OVER (ORDER BY u.id) - 1))) as resolved_at,
    CASE (row_number() OVER (ORDER BY u.id)) % 40
        WHEN 1 THEN '세션 쿠키 만료 이슈 해결. 세션 타임아웃 설정 조정 및 자동 갱신 로직 추가'
        WHEN 2 THEN '인덱스 최적화 및 쿼리 튜닝 완료. 실행 계획 분석 후 복합 인덱스 추가'
        WHEN 3 THEN '불필요한 프로세스 종료 및 리소스 모니터링 강화. CPU 사용률 정상화'
        WHEN 4 THEN '네트워크 케이블 교체 및 스위치 포트 점검. 패킷 손실률 0%로 개선'
        WHEN 5 THEN 'BIOS 설정 초기화 및 하드웨어 진단. 부팅 문제 해결'
        WHEN 6 THEN '브라우저 캐시 삭제 및 세션 재연결. 화면 응답 정상화'
        WHEN 7 THEN 'PG사 API 타임아웃 설정 증가. 결제 성공률 99.5%로 회복'
        WHEN 8 THEN 'DB 복제 지연 모니터링 및 네트워크 대역폭 증설. 동기화 정상'
        WHEN 9 THEN '웹서버 재시작 및 애플리케이션 로그 분석. 메모리 누수 패치 적용'
        WHEN 10 THEN 'VPN 클라이언트 업데이트 및 재연결. 연결 안정성 확보'
        WHEN 11 THEN 'SMTP 서버 인증 설정 수정. 메일 발송 재개'
        WHEN 12 THEN '파일 크기 제한 증가 및 임시 디렉토리 정리. 업로드 정상화'
        WHEN 13 THEN '불필요한 로그 파일 삭제 및 디스크 정리. 여유 공간 확보'
        WHEN 14 THEN '스위치 포트 재활성화 및 케이블 점검. 네트워크 연결 복구'
        WHEN 15 THEN '그래픽 드라이버 재설치 및 모니터 케이블 확인. 화면 정상화'
        WHEN 16 THEN 'API 서버 스케일 아웃 및 로드밸런싱 적용. 응답 시간 개선'
        WHEN 17 THEN '인덱스 재구성(REBUILD) 및 통계 업데이트. 쿼리 성능 회복'
        WHEN 18 THEN '힙 메모리 크기 증가 및 GC 튜닝. OOM 오류 해결'
        WHEN 19 THEN '방화벽 정책 재검토 및 룰 순서 최적화. 트래픽 정상 통과'
        WHEN 20 THEN '네트워크 드라이버 업데이트 및 IP 재설정. 네트워크 연결 복구'
        WHEN 21 THEN '배치 스크립트 오류 수정 및 재실행. 데이터 처리 완료'
        WHEN 22 THEN '백업 스토리지 공간 확보 및 백업 작업 재시작. 백업 성공'
        WHEN 23 THEN 'WAS 서비스 재시작 및 로그 분석. 서비스 정상화'
        WHEN 24 THEN 'DNS 서버 설정 수정 및 캐시 플러시. 도메인 조회 정상'
        WHEN 25 THEN '프린터 드라이버 재설치 및 네트워크 설정 확인. 인쇄 가능'
        WHEN 26 THEN '앱 업데이트 배포 및 메모리 누수 패치. 크래시 해결'
        WHEN 27 THEN '커넥션 풀 크기 증가 및 타임아웃 설정 조정. 연결 안정화'
        WHEN 28 THEN '헬스체크 경로 수정 및 로드밸런서 재설정. 트래픽 정상 분산'
        WHEN 29 THEN '라우터 재부팅 및 펌웨어 업데이트. 패킷 전송 정상화'
        WHEN 30 THEN '메모리 모듈 재장착 및 Windows 업데이트. 블루스크린 해결'
        WHEN 31 THEN 'CSS 파일 캐싱 문제 해결 및 CDN 갱신. 페이지 정상 표시'
        WHEN 32 THEN '마이그레이션 스크립트 오류 수정 및 재실행. 데이터 이관 완료'
        WHEN 33 THEN '서버 재부팅 및 서비스 자동 시작 설정. 시스템 정상화'
        WHEN 34 THEN '스위치 쿨링팬 교체 및 냉각 시스템 점검. 온도 정상화'
        WHEN 35 THEN 'USB 포트 드라이버 재설치 및 BIOS 설정 확인. 인식 정상화'
        WHEN 36 THEN '세션 타임아웃 설정 증가 및 자동 갱신 기능 추가. 세션 유지'
        WHEN 37 THEN '트랜잭션 격리 수준 조정 및 데드락 해결. 롤백 정상화'
        WHEN 38 THEN 'RAID 컨트롤러 재구성 및 디스크 교체. 데이터 무결성 확보'
        WHEN 39 THEN 'Wi-Fi 채널 변경 및 AP 위치 조정. 연결 안정성 향상'
        ELSE '그래픽 드라이버 롤백 및 호환성 문제 해결. 화면 출력 정상'
    END as resolution,
    u.id as assignee_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    LIMIT 40
) u
ON CONFLICT (incident_number) DO NOTHING;

-- ========================================
-- FAILURE - RESOLVED (해결된 장애) (30개)
-- ========================================

INSERT INTO incidents (incident_number, title, incident_type, system_type, business_area, severity, status, occurred_at, resolved_at, resolution, assignee_id, created_by, updated_by)
SELECT 
    'INC2501-' || LPAD((41 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as incident_number,
    CASE (row_number() OVER (ORDER BY u.id)) % 30
        WHEN 1 THEN '전사 ERP 시스템 다운'
        WHEN 2 THEN '데이터센터 전원 장애'
        WHEN 3 THEN '코어 스위치 장애'
        WHEN 4 THEN '중앙 DB 서버 다운'
        WHEN 5 THEN '랜섬웨어 감염'
        WHEN 6 THEN '재무 시스템 완전 중단'
        WHEN 7 THEN 'DB 데이터 손상'
        WHEN 8 THEN '기간계 시스템 장애'
        WHEN 9 THEN '백본 네트워크 장애'
        WHEN 10 THEN '전산실 화재 발생'
        WHEN 11 THEN '결제 시스템 전면 마비'
        WHEN 12 THEN '스토리지 시스템 장애'
        WHEN 13 THEN '웹 서버 클러스터 다운'
        WHEN 14 THEN '통신망 완전 두절'
        WHEN 15 THEN '본사 네트워크 전체 마비'
        WHEN 16 THEN '고객 데이터 유출 사고'
        WHEN 17 THEN 'DB 백업 파일 손상'
        WHEN 18 THEN '메인 서버 하드웨어 고장'
        WHEN 19 THEN 'L4 스위치 완전 장애'
        WHEN 20 THEN '전사 PC 악성코드 감염'
        WHEN 21 THEN 'ERP 데이터베이스 손상'
        WHEN 22 THEN 'SAN 스토리지 장애'
        WHEN 23 THEN 'IDC 네트워크 단절'
        WHEN 24 THEN '통합 인증 시스템 다운'
        WHEN 25 THEN '본사 건물 정전'
        WHEN 26 THEN '메일 서버 완전 장애'
        WHEN 27 THEN 'DB 복제 서버 동기화 실패'
        WHEN 28 THEN '방화벽 시스템 다운'
        WHEN 29 THEN 'VDI 인프라 전체 장애'
        ELSE '클라우드 서비스 장애'
    END as title,
    'FAILURE' as incident_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 5
        WHEN 0 THEN 'PROGRAM'
        WHEN 1 THEN 'DATA'
        WHEN 2 THEN 'SERVER'
        WHEN 3 THEN 'NETWORK'
        ELSE 'PC'
    END as system_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 10
        WHEN 0 THEN '전사시스템'
        WHEN 1 THEN '재무관리'
        WHEN 2 THEN '생산관리'
        WHEN 3 THEN '영업관리'
        WHEN 4 THEN '전산인프라'
        WHEN 5 THEN '보안'
        WHEN 6 THEN '고객서비스'
        WHEN 7 THEN 'IT운영'
        WHEN 8 THEN '데이터센터'
        ELSE '네트워크인프라'
    END as business_area,
    'HIGH' as severity,
    'RESOLVED' as status,
    TIMESTAMP '2025-01-05 14:00:00' + (INTERVAL '1 day' * ((row_number() OVER (ORDER BY u.id) - 1))) as occurred_at,
    TIMESTAMP '2025-01-05 18:00:00' + (INTERVAL '1 day' * ((row_number() OVER (ORDER BY u.id) - 1))) as resolved_at,
    CASE (row_number() OVER (ORDER BY u.id)) % 30
        WHEN 1 THEN '[긴급 복구] WAS 서버 클러스터 재구성 및 서비스 재시작. 전체 시스템 정상화. 근본원인: 메모리 누수로 인한 OOM'
        WHEN 2 THEN '[긴급 조치] UPS 전환 및 발전기 가동. 주 전원 복구 후 시스템 순차 재시작. 원인: 외부 전력 공급 차단'
        WHEN 3 THEN '[긴급 교체] 예비 코어 스위치로 전환 및 네트워크 재구성. 장애 스위치 교체 완료. 원인: 하드웨어 고장'
        WHEN 4 THEN '[긴급 페일오버] 대기 DB 서버로 자동 전환. 마스터 서버 복구 후 동기화 완료. 원인: 디스크 I/O 과부하'
        WHEN 5 THEN '[긴급 격리] 감염 시스템 네트워크 차단, 백신 배포 및 전수 검사. 복호화 툴로 데이터 복구. 원인: 이메일 첨부파일'
        WHEN 6 THEN '[긴급 복구] 직전 백업으로 복원 및 서비스 재개. 데이터 무결성 검증 완료. 원인: 업데이트 배포 오류'
        WHEN 7 THEN '[긴급 복구] DB 백업 데이터로 복원 및 트랜잭션 로그 리플레이. 데이터 손실 최소화. 원인: 스토리지 장애'
        WHEN 8 THEN '[긴급 재시작] 기간계 시스템 순차 재시작 및 배치 작업 재수행. 업무 정상화. 원인: 메모리 부족'
        WHEN 9 THEN '[긴급 우회] 백업 회선으로 전환 및 트래픽 재라우팅. 주 회선 복구 완료. 원인: 광케이블 단선'
        WHEN 10 THEN '[긴급 대응] 소화 시스템 작동, 전산실 전원 차단 및 피해 최소화. 백업센터로 긴급 전환. 원인: 전기 합선'
        WHEN 11 THEN '[긴급 복구] PG사 연동 복구 및 대기 결제 재처리. 결제 성공률 99.9% 회복. 원인: PG사 API 서버 장애'
        WHEN 12 THEN '[긴급 교체] RAID 컨트롤러 교체 및 데이터 복구. 스토리지 클러스터 재구성 완료. 원인: 컨트롤러 펌웨어 오류'
        WHEN 13 THEN '[긴급 복구] 로드밸런서 재설정 및 웹서버 클러스터 재시작. 서비스 정상화. 원인: 로드밸런서 설정 오류'
        WHEN 14 THEN '[긴급 복구] ISP 측 장애 조치 완료 대기 및 백업 회선 활성화. 통신망 복구. 원인: ISP 장비 장애'
        WHEN 15 THEN '[긴급 조치] 네트워크 장비 전면 점검 및 재부팅. 설정 백업에서 복원. 원인: 코어 스위치 설정 오류'
        WHEN 16 THEN '[긴급 대응] 개인정보 유출 경로 차단, 시스템 격리 및 보안 패치 긴급 배포. 고객 통보 완료. 원인: SQL Injection 취약점'
        WHEN 17 THEN '[긴급 복구] 원격지 백업에서 복원 및 데이터 무결성 검증. 백업 주기 단축 조치. 원인: 백업 매체 손상'
        WHEN 18 THEN '[긴급 교체] 메인보드 및 메모리 교체. 예비 서버로 서비스 이관 후 복구. 원인: 하드웨어 노후화'
        WHEN 19 THEN '[긴급 교체] 예비 L4로 긴급 전환 및 트래픽 재분배. 장애 장비 교체 완료. 원인: 전원부 고장'
        WHEN 20 THEN '[긴급 격리] 전사 PC 네트워크 일시 차단, 백신 업데이트 및 전수 검사. 악성코드 제거 완료. 원인: 웹사이트 방문 감염'
        WHEN 21 THEN '[긴급 복구] 직전 스냅샷으로 DB 복원 및 트랜잭션 로그 복구. 업무 재개. 원인: 잘못된 DDL 실행'
        WHEN 22 THEN '[긊급 전환] 백업 스토리지로 긴급 전환 및 데이터 마이그레이션. 장애 SAN 교체. 원인: 디스크 어레이 고장'
        WHEN 23 THEN '[긴급 복구] 백업 IDC로 서비스 전환 및 네트워크 복구 작업. 주 IDC 회선 복구. 원인: 공사로 인한 광케이블 절단'
        WHEN 24 THEN '[긴급 복구] AD 서버 재시작 및 인증 서비스 정상화. 사용자 재로그인 안내. 원인: 서비스 프로세스 hang'
        WHEN 25 THEN '[긴급 대응] UPS 전환 및 중요 시스템 우선 복구. 전원 복구 후 단계적 시스템 재가동. 원인: 전력 시설 사고'
        WHEN 26 THEN '[긴급 복구] 메일 서버 클러스터 재구성 및 메일큐 재처리. 서비스 정상화. 원인: 디스크 풀'
        WHEN 27 THEN '[긴급 재동기화] 복제 지연 해소 및 마스터-슬레이브 재연결. 데이터 정합성 확인. 원인: 네트워크 대역폭 부족'
        WHEN 28 THEN '[긴급 재시작] 방화벽 시스템 재부팅 및 정책 재적용. 트래픽 정상 통과. 원인: 세션 테이블 오버플로우'
        WHEN 29 THEN '[긴급 복구] VDI 브로커 재시작 및 연결 풀 재구성. 사용자 재접속 완료. 원인: 브로커 서비스 크래시'
        ELSE '[긴급 대응] 클라우드 공급자 장애 해소 대기 및 온프레미스 백업 시스템 활성화. 서비스 정상화. 원인: 클라우드 리전 장애'
    END as resolution,
    u.id as assignee_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    OFFSET 40
    LIMIT 30
) u
ON CONFLICT (incident_number) DO NOTHING;

-- ========================================
-- INCIDENT - IN_PROGRESS (처리중 인시던트) (20개)
-- ========================================

INSERT INTO incidents (incident_number, title, incident_type, system_type, business_area, severity, status, occurred_at, resolved_at, resolution, assignee_id, created_by, updated_by)
SELECT 
    'INC2501-' || LPAD((71 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as incident_number,
    CASE (row_number() OVER (ORDER BY u.id)) % 20
        WHEN 1 THEN '웹사이트 접속 속도 저하'
        WHEN 2 THEN '데이터 조회 지연'
        WHEN 3 THEN '서버 응답 시간 증가'
        WHEN 4 THEN '네트워크 간헐적 끊김'
        WHEN 5 THEN 'PC 프로그램 오류'
        WHEN 6 THEN '보고서 생성 실패'
        WHEN 7 THEN '파일 다운로드 느림'
        WHEN 8 THEN 'DB 락 대기 시간 증가'
        WHEN 9 THEN '애플리케이션 서버 부하'
        WHEN 10 THEN 'VPN 속도 저하'
        WHEN 11 THEN '이메일 수신 지연'
        WHEN 12 THEN '첨부파일 업로드 실패'
        WHEN 13 THEN '서버 디스크 I/O 지연'
        WHEN 14 THEN '무선 네트워크 불안정'
        WHEN 15 THEN 'PC 응용 프로그램 멈춤'
        WHEN 16 THEN 'API 타임아웃 증가'
        WHEN 17 THEN 'DB 동시 접속 오류'
        WHEN 18 THEN '웹 서비스 간헐적 오류'
        WHEN 19 THEN '프록시 서버 지연'
        ELSE '노트북 배터리 급속 방전'
    END as title,
    'INCIDENT' as incident_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 5
        WHEN 0 THEN 'PROGRAM'
        WHEN 1 THEN 'DATA'
        WHEN 2 THEN 'SERVER'
        WHEN 3 THEN 'NETWORK'
        ELSE 'PC'
    END as system_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 8
        WHEN 0 THEN '영업관리'
        WHEN 1 THEN '고객지원'
        WHEN 2 THEN '생산관리'
        WHEN 3 THEN '구매관리'
        WHEN 4 THEN '품질관리'
        WHEN 5 THEN 'IT운영'
        WHEN 6 THEN '인사관리'
        ELSE '재무관리'
    END as business_area,
    CASE (row_number() OVER (ORDER BY u.id)) % 3
        WHEN 0 THEN 'HIGH'
        WHEN 1 THEN 'MEDIUM'
        ELSE 'LOW'
    END as severity,
    'IN_PROGRESS' as status,
    TIMESTAMP '2025-02-01 10:00:00' + (INTERVAL '6 hours' * ((row_number() OVER (ORDER BY u.id) - 1))) as occurred_at,
    NULL as resolved_at,
    NULL as resolution,
    u.id as assignee_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    OFFSET 70
    LIMIT 20
) u
ON CONFLICT (incident_number) DO NOTHING;

-- ========================================
-- INCIDENT - OPEN (미할당 인시던트) (10개)
-- ========================================

INSERT INTO incidents (incident_number, title, incident_type, system_type, business_area, severity, status, occurred_at, resolved_at, resolution, assignee_id, created_by, updated_by)
SELECT 
    'INC2501-' || LPAD((91 + (row_number() OVER (ORDER BY u.id) - 1))::TEXT, 4, '0') as incident_number,
    CASE (row_number() OVER (ORDER BY u.id)) % 10
        WHEN 1 THEN '새 프로그램 설치 요청'
        WHEN 2 THEN '데이터 추출 요청'
        WHEN 3 THEN '서버 접근 권한 요청'
        WHEN 4 THEN '네트워크 방화벽 해제 요청'
        WHEN 5 THEN 'PC 교체 요청'
        WHEN 6 THEN '시스템 계정 생성 요청'
        WHEN 7 THEN 'DB 백업 복원 요청'
        WHEN 8 THEN '인증서 갱신 요청'
        WHEN 9 THEN '무선 네트워크 추가 요청'
        ELSE '소프트웨어 라이선스 요청'
    END as title,
    'INCIDENT' as incident_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 5
        WHEN 0 THEN 'PROGRAM'
        WHEN 1 THEN 'DATA'
        WHEN 2 THEN 'SERVER'
        WHEN 3 THEN 'NETWORK'
        ELSE 'PC'
    END as system_type,
    CASE (row_number() OVER (ORDER BY u.id)) % 5
        WHEN 0 THEN 'IT운영'
        WHEN 1 THEN '경영지원'
        WHEN 2 THEN '인사관리'
        WHEN 3 THEN '고객관리'
        ELSE '영업관리'
    END as business_area,
    'LOW' as severity,
    'OPEN' as status,
    TIMESTAMP '2025-02-03 09:00:00' + (INTERVAL '3 hours' * ((row_number() OVER (ORDER BY u.id) - 1))) as occurred_at,
    NULL as resolved_at,
    NULL as resolution,
    NULL as assignee_id,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    OFFSET 90
    LIMIT 10
) u
ON CONFLICT (incident_number) DO NOTHING;

-- ========================================
-- 4. INCIDENT 데이터 검증 쿼리
-- ========================================

-- INCIDENT 데이터 건수 확인
SELECT COUNT(*) as incident_count FROM incidents;

-- INCIDENT 번호 중복 검증
SELECT incident_number, COUNT(*) as duplicate_count 
FROM incidents 
GROUP BY incident_number 
HAVING COUNT(*) > 1;

-- 담당자 존재 검증 (NULL 허용 - OPEN 상태)
SELECT i.incident_number, i.assignee_id, u.email
FROM incidents i
LEFT JOIN users u ON i.assignee_id = u.id
WHERE i.assignee_id IS NOT NULL AND u.id IS NULL;

-- 장애 유형별 통계
SELECT incident_type, status, COUNT(*) as count
FROM incidents
GROUP BY incident_type, status
ORDER BY incident_type, status;

-- 장애 상태별 통계
SELECT 
    status,
    COUNT(*) as count,
    ROUND(COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM incidents) * 100, 2) as percentage
FROM incidents
GROUP BY status
ORDER BY count DESC;

-- 심각도별 통계
SELECT 
    severity,
    COUNT(*) as count,
    AVG(EXTRACT(EPOCH FROM (COALESCE(resolved_at, CURRENT_TIMESTAMP) - occurred_at))/3600) as avg_resolution_hours
FROM incidents
GROUP BY severity
ORDER BY 
    CASE severity
        WHEN 'HIGH' THEN 1
        WHEN 'MEDIUM' THEN 2
        WHEN 'LOW' THEN 3
    END;

-- 시스템 유형별 통계
SELECT 
    system_type,
    COUNT(*) as count,
    SUM(CASE WHEN status = 'RESOLVED' THEN 1 ELSE 0 END) as resolved,
    ROUND(SUM(CASE WHEN status = 'RESOLVED' THEN 1 ELSE 0 END)::NUMERIC / COUNT(*) * 100, 2) as resolution_rate
FROM incidents
GROUP BY system_type
ORDER BY count DESC;

-- 담당자별 장애 건수
SELECT 
    u.email as assignee_email,
    COUNT(i.id) as incident_count,
    SUM(CASE WHEN i.status = 'RESOLVED' THEN 1 ELSE 0 END) as resolved,
    SUM(CASE WHEN i.status = 'IN_PROGRESS' THEN 1 ELSE 0 END) as in_progress,
    STRING_AGG(DISTINCT i.severity, ', ' ORDER BY i.severity) as severities
FROM incidents i
JOIN users u ON i.assignee_id = u.id
GROUP BY u.email
HAVING COUNT(i.id) > 0
ORDER BY incident_count DESC
LIMIT 20;

-- 일별 장애 발생 통계
SELECT 
    TO_CHAR(occurred_at, 'YYYY-MM-DD') as date,
    COUNT(*) as incidents,
    SUM(CASE WHEN incident_type = 'FAILURE' THEN 1 ELSE 0 END) as failures,
    SUM(CASE WHEN severity = 'HIGH' THEN 1 ELSE 0 END) as high_severity
FROM incidents
GROUP BY TO_CHAR(occurred_at, 'YYYY-MM-DD')
ORDER BY date DESC
LIMIT 10;

-- 평균 해결 시간 분석
SELECT 
    incident_type,
    severity,
    COUNT(*) as total,
    AVG(EXTRACT(EPOCH FROM (resolved_at - occurred_at))/3600) as avg_hours,
    MIN(EXTRACT(EPOCH FROM (resolved_at - occurred_at))/3600) as min_hours,
    MAX(EXTRACT(EPOCH FROM (resolved_at - occurred_at))/3600) as max_hours
FROM incidents
WHERE resolved_at IS NOT NULL
GROUP BY incident_type, severity
ORDER BY incident_type, 
    CASE severity
        WHEN 'HIGH' THEN 1
        WHEN 'MEDIUM' THEN 2
        WHEN 'LOW' THEN 3
    END;

-- 미해결 장애 현황
SELECT 
    incident_number,
    title,
    incident_type,
    severity,
    status,
    u.email as assignee,
    occurred_at,
    EXTRACT(EPOCH FROM (CURRENT_TIMESTAMP - occurred_at))/3600 as hours_open
FROM incidents i
LEFT JOIN users u ON i.assignee_id = u.id
WHERE status IN ('OPEN', 'IN_PROGRESS')
ORDER BY 
    CASE severity
        WHEN 'HIGH' THEN 1
        WHEN 'MEDIUM' THEN 2
        WHEN 'LOW' THEN 3
    END,
    occurred_at
LIMIT 20;

-- INCIDENT 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 총 100개의 INCIDENT 데이터를 생성하였습니다.
-- 모든 INCIDENT는 파트너 사용자를 담당자로 연계되어 있으며, 다양한 유형과 상태로 구성되어 있습니다.
-- INCIDENT 번호 중복 검증 및 담당자 존재 검증을 통해 데이터 무결성을 보장합니다.
-- 모든 INCIDENT는 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - incident_type: 'INCIDENT'(인시던트), 'FAILURE'(장애)
--   - system_type: 'PROGRAM', 'DATA', 'SERVER', 'NETWORK', 'PC'
--   - severity: 'HIGH'(높음), 'MEDIUM'(중간), 'LOW'(낮음)
--   - status: 'OPEN'(열림), 'IN_PROGRESS'(진행중), 'RESOLVED'(해결됨), 'CLOSED'(닫힘)
-- 
-- 장애 구성:
--   - INCIDENT + RESOLVED: 40개 (INC2501-0001 ~ 0040) - 해결된 일반 인시던트
--   - FAILURE + RESOLVED: 30개 (INC2501-0041 ~ 0070) - 해결된 중대 장애
--   - INCIDENT + IN_PROGRESS: 20개 (INC2501-0071 ~ 0090) - 처리중인 인시던트
--   - INCIDENT + OPEN: 10개 (INC2501-0091 ~ 0100) - 미할당 인시던트
--   - 총 100개의 다양한 장애로 실제 장애 관리 환경을 시뮬레이션
--   - 장애 번호: INC2501-0001 ~ INC2501-0100
--   - 발생 시간, 해결 시간, 심각도, 시스템 유형 등 실제 운영 환경 반영
--   - 담당자 할당 및 해결 내역 포함
