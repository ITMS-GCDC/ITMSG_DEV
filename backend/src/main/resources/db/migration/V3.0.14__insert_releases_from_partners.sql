-- RELEASE 데이터 삽입 쿼리 (V3.0.14)
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 릴리즈 관리 데이터 생성

-- 1. [REPORT A] CRUD 및 데이터 흐름 분석
-- RELEASE 등록 화면 요소와 API 흐름 분석
-- 화면 요소: 릴리즈번호, 제목, 릴리즈유형, 상태, 내용, 요청자, 요청부서, 승인자, 예정일시, 배포일시
-- 액션 유형: 생성 (C)
-- API Endpoint: POST /api/releases
-- 백엔드 객체: ReleaseService.createRelease()
-- 대상 테이블 & 컬럼: releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)

-- 2. [REPORT B] 수정 영향도 검토
-- 의존성 조사: ReleaseService, ReleaseRepository, UserRepository, DepartmentRepository, ApprovalService
-- 연관 DB 객체: releases 테이블, users 테이블 (requester_id, approver_id FK), departments 테이블 (requester_dept_id FK)
-- 사이드 이펙트: 릴리즈 번호 자동 생성, 승인 프로세스 연동, 배포 일정 관리
-- 프론트 연동: ReleaseCreatePage.tsx에서 API 호출

-- 3. 파트너 기준 RELEASE 데이터 삽입 쿼리 (멱등성 보장)
-- 각 파트너의 사용자를 요청자로 하여 릴리즈 요청 데이터 생성 (총 100개)

-- ========================================
-- REGULAR 릴리즈 - REQUESTED (정기 배포 요청됨) (100개)
-- ========================================

INSERT INTO releases (release_number, title, release_type, status, content, requester_id, requester_dept_id, approver_id, scheduled_at, deployed_at, created_by, updated_by)
SELECT 
    'REL2501-' || LPAD((row_number() OVER (ORDER BY u.id))::TEXT, 4, '0') as release_number,
    CASE (row_number() OVER (ORDER BY u.id)) % 100
        WHEN 1 THEN '고객 데이터 분석 플랫폼 v2.0.0 정기 배포'
        WHEN 2 THEN 'AI 챗봇 고도화 v3.1.0 정기 배포'
        WHEN 3 THEN '모바일 앱 UI/UX 개선 v2.5.0 정기 배포'
        WHEN 4 THEN '통합 리포팅 시스템 v1.8.0 정기 배포'
        WHEN 5 THEN '공급망 관리 시스템 v2.3.0 정기 배포'
        WHEN 6 THEN '품질 관리 대시보드 v1.9.0 정기 배포'
        WHEN 7 THEN '인사평가 시스템 개편 v3.0.0 정기 배포'
        WHEN 8 THEN '재무 분석 플랫폼 v2.1.0 정기 배포'
        WHEN 9 THEN '마케팅 자동화 시스템 v1.7.0 정기 배포'
        WHEN 10 THEN 'IT 자산 관리 시스템 v2.2.0 정기 배포'
        WHEN 11 THEN '음성 인식 서비스 v1.0.0 정기 배포'
        WHEN 12 THEN 'AR/VR 콘텐츠 플랫폼 v2.0.0 정기 배포'
        WHEN 13 THEN 'NFT 마켓플레이스 v1.5.0 정기 배포'
        WHEN 14 THEN '메타버스 통합 플랫폼 v1.0.0 정기 배포'
        WHEN 15 THEN '양자 암호화 적용 v2.1.0 정기 배포'
        WHEN 16 THEN '엣지 컴퓨팅 플랫폼 v1.8.0 정기 배포'
        WHEN 17 THEN '5G 네트워크 슬라이싱 v2.0.0 정기 배포'
        WHEN 18 THEN 'IoT 디바이스 관리 v1.9.0 정기 배포'
        WHEN 19 THEN '디지털 트윈 시스템 v2.5.0 정기 배포'
        WHEN 20 THEN '자율주행 시뮬레이터 v1.7.0 정기 배포'
        WHEN 21 THEN '블록체인 DApp 플랫폼 v2.3.0 정기 배포'
        WHEN 22 THEN '스마트 시티 통합 관제 v1.6.0 정기 배포'
        WHEN 23 THEN '헬스케어 AI 진단 시스템 v2.0.0 정기 배포'
        WHEN 24 THEN '원격 의료 플랫폼 v1.8.0 정기 배포'
        WHEN 25 THEN '전자처방전 시스템 v2.1.0 정기 배포'
        WHEN 26 THEN '유전자 분석 플랫폼 v1.5.0 정기 배포'
        WHEN 27 THEN '의료 영상 AI 분석 v2.3.0 정기 배포'
        WHEN 28 THEN '환자 모니터링 IoT 시스템 v1.7.0 정기 배포'
        WHEN 29 THEN '약물 관리 자동화 시스템 v2.0.0 정기 배포'
        WHEN 30 THEN '병원 통합 정보 시스템 v3.1.0 정기 배포'
        WHEN 31 THEN '스마트 팩토리 MES v2.5.0 정기 배포'
        WHEN 32 THEN '예지 정비 AI 플랫폼 v1.8.0 정기 배포'
        WHEN 33 THEN '로봇 프로세스 자동화 v2.2.0 정기 배포'
        WHEN 34 THEN '3D 프린팅 관리 시스템 v1.6.0 정기 배포'
        WHEN 35 THEN '디지털 제조 플랫폼 v2.0.0 정기 배포'
        WHEN 36 THEN '스마트 물류 통합 시스템 v1.9.0 정기 배포'
        WHEN 37 THEN '창고 자동화 로봇 제어 v2.3.0 정기 배포'
        WHEN 38 THEN '배송 최적화 AI 엔진 v1.7.0 정기 배포'
        WHEN 39 THEN '실시간 재고 추적 시스템 v2.1.0 정기 배포'
        WHEN 40 THEN '스마트 패키징 시스템 v1.5.0 정기 배포'
        WHEN 41 THEN '친환경 에너지 관리 v2.4.0 정기 배포'
        WHEN 42 THEN '탄소 배출 모니터링 시스템 v1.8.0 정기 배포'
        WHEN 43 THEN '재생 에너지 통합 플랫폼 v2.0.0 정기 배포'
        WHEN 44 THEN 'ESG 경영 대시보드 v1.6.0 정기 배포'
        WHEN 45 THEN '폐기물 관리 자동화 v2.2.0 정기 배포'
        WHEN 46 THEN '수자원 관리 IoT 시스템 v1.9.0 정기 배포'
        WHEN 47 THEN '대기질 모니터링 플랫폼 v2.1.0 정기 배포'
        WHEN 48 THEN '스마트 빌딩 에너지 관리 v1.7.0 정기 배포'
        WHEN 49 THEN '전기차 충전 인프라 관리 v2.3.0 정기 배포'
        WHEN 50 THEN '친환경 공급망 관리 v1.8.0 정기 배포'
        WHEN 51 THEN '디지털 마케팅 자동화 v2.5.0 정기 배포'
        WHEN 52 THEN '소셜 미디어 통합 관리 v1.9.0 정기 배포'
        WHEN 53 THEN '고객 여정 최적화 플랫폼 v2.2.0 정기 배포'
        WHEN 54 THEN '개인화 추천 엔진 고도화 v3.0.0 정기 배포'
        WHEN 55 THEN '마케팅 애널리틱스 플랫폼 v1.7.0 정기 배포'
        WHEN 56 THEN 'CRM 통합 플랫폼 v2.4.0 정기 배포'
        WHEN 57 THEN '이메일 마케팅 자동화 v1.8.0 정기 배포'
        WHEN 58 THEN 'SMS/카카오톡 통합 발송 v2.1.0 정기 배포'
        WHEN 59 THEN '랜딩페이지 빌더 v1.6.0 정기 배포'
        WHEN 60 THEN 'A/B 테스트 자동화 플랫폼 v2.3.0 정기 배포'
        WHEN 61 THEN 'e-러닝 플랫폼 고도화 v3.1.0 정기 배포'
        WHEN 62 THEN 'LMS 통합 관리 시스템 v2.5.0 정기 배포'
        WHEN 63 THEN '화상 교육 플랫폼 v1.9.0 정기 배포'
        WHEN 64 THEN '학습 분석 AI 시스템 v2.2.0 정기 배포'
        WHEN 65 THEN '디지털 교재 플랫폼 v1.7.0 정기 배포'
        WHEN 66 THEN '출결 관리 자동화 시스템 v2.0.0 정기 배포'
        WHEN 67 THEN '성적 관리 통합 시스템 v1.8.0 정기 배포'
        WHEN 68 THEN '학사 행정 시스템 v2.4.0 정기 배포'
        WHEN 69 THEN '교육 콘텐츠 CMS v1.6.0 정기 배포'
        WHEN 70 THEN '학생 상담 관리 시스템 v2.1.0 정기 배포'
        WHEN 71 THEN '핀테크 대출 심사 자동화 v2.3.0 정기 배포'
        WHEN 72 THEN '로보어드바이저 플랫폼 v1.9.0 정기 배포'
        WHEN 73 THEN '가상자산 거래 시스템 v2.5.0 정기 배포'
        WHEN 74 THEN 'P2P 금융 플랫폼 v1.7.0 정기 배포'
        WHEN 75 THEN '신용평가 AI 모델 v2.2.0 정기 배포'
        WHEN 76 THEN '부정거래 탐지 시스템 v3.0.0 정기 배포'
        WHEN 77 THEN '자금세탁방지 AML 시스템 v1.8.0 정기 배포'
        WHEN 78 THEN '모바일 뱅킹 플랫폼 v2.4.0 정기 배포'
        WHEN 79 THEN '간편결제 통합 시스템 v1.6.0 정기 배포'
        WHEN 80 THEN '보험 청구 자동화 시스템 v2.1.0 정기 배포'
        WHEN 81 THEN '스마트 컨트랙트 플랫폼 v2.3.0 정기 배포'
        WHEN 82 THEN 'DeFi 프로토콜 통합 v1.9.0 정기 배포'
        WHEN 83 THEN 'DAO 거버넌스 시스템 v2.0.0 정기 배포'
        WHEN 84 THEN '크로스체인 브릿지 v1.7.0 정기 배포'
        WHEN 85 THEN 'NFT 민팅 플랫폼 v2.2.0 정기 배포'
        WHEN 86 THEN 'Web3 지갑 통합 v1.8.0 정기 배포'
        WHEN 87 THEN 'GameFi 플랫폼 v2.4.0 정기 배포'
        WHEN 88 THEN '메타버스 경제 시스템 v1.6.0 정기 배포'
        WHEN 89 THEN 'SocialFi 플랫폼 v2.1.0 정기 배포'
        WHEN 90 THEN '탈중앙화 신원 인증 v1.5.0 정기 배포'
        WHEN 91 THEN '양자컴퓨팅 시뮬레이터 v2.3.0 정기 배포'
        WHEN 92 THEN '뉴럴 인터페이스 플랫폼 v1.9.0 정기 배포'
        WHEN 93 THEN 'AGI 연구 플랫폼 v2.0.0 정기 배포'
        WHEN 94 THEN '홀로그램 디스플레이 시스템 v1.7.0 정기 배포'
        WHEN 95 THEN '나노기술 제어 시스템 v2.2.0 정기 배포'
        WHEN 96 THEN '바이오컴퓨팅 플랫폼 v1.8.0 정기 배포'
        WHEN 97 THEN '6G 통신 테스트베드 v2.4.0 정기 배포'
        WHEN 98 THEN '우주 데이터 센터 관리 v1.6.0 정기 배포'
        WHEN 99 THEN '기후 예측 AI 시스템 v2.1.0 정기 배포'
        ELSE '지속가능 도시 플랫폼 v1.9.0 정기 배포'
    END as title,
    'REGULAR' as release_type,
    'REQUESTED' as status,
    CASE (row_number() OVER (ORDER BY u.id)) % 100
        WHEN 1 THEN '고객 행동 분석 및 세분화 고도화 예정. 계획: RFM 분석 자동화, 고객 생애가치 예측, 이탈 고객 분석 대시보드 구축'
        WHEN 2 THEN 'AI 챗봇 자연어 이해 능력 향상 예정. 계획: GPT-4 기반 대화 모델 적용, 다국어 지원 확대, 감정 분석 기능 추가'
        WHEN 3 THEN '모바일 앱 사용자 경험 개선 예정. 계획: 다크모드 지원, 접근성 개선, 애니메이션 최적화, 로딩 시간 단축'
        WHEN 4 THEN '통합 리포팅 자동화 및 실시간 대시보드 구축 예정. 계획: 실시간 데이터 반영, 커스텀 리포트 생성, 자동 배포'
        WHEN 5 THEN '공급망 가시성 확보 및 리스크 관리 강화 예정. 계획: 실시간 추적, 공급업체 평가 자동화, 수요 예측'
        WHEN 6 THEN '품질 관리 실시간 모니터링 및 예측 분석 예정. 계획: 불량률 실시간 추적, AI 기반 불량 예측, 원인 분석'
        WHEN 7 THEN '인사평가 프로세스 디지털화 및 피드백 강화 예정. 계획: 연속 피드백 시스템, OKR 관리, 역량 평가 자동화'
        WHEN 8 THEN '재무 데이터 통합 분석 및 예측 모델 구축 예정. 계획: 재무비율 자동 계산, 예산 대비 실적 분석, 손익 예측'
        WHEN 9 THEN '마케팅 캠페인 자동화 및 ROI 측정 예정. 계획: 멀티채널 캠페인 관리, A/B 테스트 자동화, 전환율 분석'
        WHEN 10 THEN 'IT 자산 라이프사이클 관리 자동화 예정. 계획: 자산 취득부터 폐기까지 자동 추적, 감가상각 자동 계산'
        WHEN 11 THEN 'STT/TTS 기반 음성 인터페이스 구축 계획. 다국어 지원, 방언 인식, 음성 명령 처리, 실시간 번역 기능'
        WHEN 12 THEN '가상/증강 현실 콘텐츠 제작 및 배포 플랫폼 계획. Unity/Unreal 연동, 3D 에셋 관리, 멀티플레이어 지원'
        WHEN 13 THEN '블록체인 기반 디지털 자산 거래 플랫폼 계획. 스마트 컨트랙트, 로열티 자동 분배, 탈중앙화 거버넌스'
        WHEN 14 THEN '가상 세계 구축 및 아바타 커스터마이징 계획. 실시간 렌더링, 소셜 인터랙션, 크로스플랫폼 지원'
        WHEN 15 THEN '양자 키 분배 기반 보안 통신 계획. 도청 불가능, 미래 보안 대비, 양자내성 암호화 적용'
        WHEN 16 THEN 'CDN + 엣지 컴퓨팅으로 지연시간 최소화 계획. 5ms 이하 응답, 로컬 처리, 글로벌 분산 아키텍처'
        WHEN 17 THEN '네트워크 슬라이싱으로 서비스별 QoS 보장 계획. 초저지연, 대역폭 보장, 동적 리소스 할당'
        WHEN 18 THEN '수백만 IoT 디바이스 원격 관리 계획. OTA 업데이트, 상태 모니터링, 이상 탐지, 보안 패치 자동화'
        WHEN 19 THEN '물리 자산의 디지털 복제 및 시뮬레이션 계획. 예측 정비, 최적화 시뮬레이션, 실시간 동기화'
        WHEN 20 THEN '자율주행 알고리즘 검증 시뮬레이터 계획. 다양한 시나리오, 안전성 검증, 엣지 케이스 테스트'
        WHEN 21 THEN '탈중앙화 애플리케이션 개발 플랫폼 구축. 스마트 컨트랙트 IDE, 테스트넷 연동, 자동 배포'
        WHEN 22 THEN '스마트 시티 통합 관제 센터 구축. 교통, 에너지, 안전, 환경 통합 모니터링 및 제어'
        WHEN 23 THEN 'AI 기반 질병 진단 보조 시스템 개발. 영상 분석, 패턴 인식, 진단 정확도 95% 이상 목표'
        WHEN 24 THEN '원격 진료 화상 상담 플랫폼 구축. HD 화상, 전자처방전 발급, 진료기록 자동 연동'
        WHEN 25 THEN '전자처방전 시스템 약국 연동. 실시간 처방 전송, 복약 지도, 부작용 모니터링'
        WHEN 26 THEN '유전자 염기서열 분석 플랫폼 구축. NGS 데이터 처리, 변이 검출, 질병 연관성 분석'
        WHEN 27 THEN '의료 영상 AI 판독 시스템 개발. CT/MRI/X-ray 자동 분석, 이상 영역 검출, 판독 리포트 생성'
        WHEN 28 THEN '환자 생체신호 실시간 모니터링. 웨어러블 연동, 이상 징후 감지, 응급 알림'
        WHEN 29 THEN '약물 투여 자동화 및 부작용 모니터링. 스마트 주사기, 투여 이력 관리, 상호작용 체크'
        WHEN 30 THEN '병원 정보 시스템 통합 및 상호운용성 확보. EMR/OCS/PACS 통합, HL7 FHIR 표준 준수'
        WHEN 31 THEN '제조실행시스템 실시간 생산 관리. 작업 지시, 실적 수집, 품질 검사, 추적성 확보'
        WHEN 32 THEN '설비 고장 예측 및 정비 일정 최적화. 진동/온도 센서 데이터 분석, 잔여 수명 예측'
        WHEN 33 THEN '반복 업무 자동화로 생산성 향상. RPA 봇 개발, 프로세스 마이닝, 자동화 효과 측정'
        WHEN 34 THEN '3D 프린팅 작업 관리 및 품질 검증. STL 파일 관리, 출력 모니터링, 후처리 자동화'
        WHEN 35 THEN '디지털 제조 플랫폼 구축. CAD/CAM 연동, 시뮬레이션, 가상 시운전, 협업 설계'
        WHEN 36 THEN '물류 거점 간 화물 추적 및 최적 경로. GPS 추적, 배송 스케줄링, 지연 예측 알림'
        WHEN 37 THEN '창고 내 AGV 로봇 자동 제어. 경로 최적화, 충돌 회피, 자동 충전, 작업 할당'
        WHEN 38 THEN 'AI 기반 배송 경로 최적화 엔진. 실시간 교통정보 반영, 다중 목적지 최적화'
        WHEN 39 THEN 'RFID/바코드 기반 실시간 재고 추적. 입출고 자동 기록, 재고 불일치 감지'
        WHEN 40 THEN '스마트 패키징 및 배송 자동화. 자동 포장, 라벨 출력, 송장 생성'
        WHEN 41 THEN '에너지 사용량 실시간 모니터링 및 절감. 피크 관리, 수요 반응, 에너지 효율 개선'
        WHEN 42 THEN '탄소 배출량 측정 및 감축 목표 관리. Scope 1/2/3 배출량 산정, 감축 로드맵'
        WHEN 43 THEN '재생 에너지 발전량 예측 및 통합 운영. 태양광/풍력 발전 예측, ESS 연동'
        WHEN 44 THEN 'ESG 지표 수집 및 대시보드 구축. 환경/사회/거버넌스 KPI 관리, 보고서 자동 생성'
        WHEN 45 THEN '폐기물 분류 및 재활용 자동화. AI 비전 기반 분류, 재활용률 추적'
        WHEN 46 THEN '상하수도 누수 감지 및 수질 모니터링. IoT 센서 기반 실시간 모니터링, 이상 감지'
        WHEN 47 THEN '대기오염 물질 측정 및 예보. PM2.5/PM10 측정, 오염도 예측, 저감 조치 권고'
        WHEN 48 THEN '빌딩 에너지 관리 시스템 고도화. HVAC 최적 제어, 조명 자동화, 에너지 절감'
        WHEN 49 THEN '전기차 충전소 운영 관리 플랫폼. 충전 스케줄링, 요금 정산, 충전기 상태 모니터링'
        WHEN 50 THEN '친환경 공급망 추적성 확보. 탄소발자국 계산, 친환경 인증, 지속가능성 평가'
        WHEN 51 THEN '멀티채널 마케팅 캠페인 통합 관리. 이메일/SMS/SNS 통합, 자동화 워크플로우'
        WHEN 52 THEN '소셜 미디어 콘텐츠 발행 및 분석. 예약 발행, 참여도 분석, 트렌드 모니터링'
        WHEN 53 THEN '고객 접점별 경험 최적화. 터치포인트 분석, 전환율 개선, 이탈 지점 파악'
        WHEN 54 THEN '개인화 추천 알고리즘 고도화. 협업 필터링, 딥러닝 기반 추천, 실시간 적용'
        WHEN 55 THEN '마케팅 성과 지표 통합 대시보드. ROI 분석, 캠페인 효과 측정, 예산 최적화'
        WHEN 56 THEN '고객 관계 관리 시스템 통합. 영업/마케팅/고객지원 통합, 360도 고객 뷰'
        WHEN 57 THEN '이메일 마케팅 자동화 및 개인화. 트리거 메일, A/B 테스트, 개봉률 최적화'
        WHEN 58 THEN 'SMS/카카오톡 알림톡 통합 발송. 대량 발송, 수신 확인, 발송 결과 분석'
        WHEN 59 THEN '랜딩페이지 노코드 빌더 구축. 드래그앤드롭 편집, 반응형 디자인, SEO 최적화'
        WHEN 60 THEN 'A/B 테스트 자동화 및 통계 분석. 트래픽 분산, 통계적 유의성 검증, 승자 자동 선정'
        WHEN 61 THEN 'e-러닝 콘텐츠 제작 및 배포 플랫폼. 동영상 인코딩, 진도 관리, 수료증 발급'
        WHEN 62 THEN '학습 관리 시스템 통합 운영. 수강 신청, 강의 관리, 성적 산정, 학습 분석'
        WHEN 63 THEN '화상 교육 실시간 스트리밍 플랫폼. HD 화질, 화면 공유, 녹화, 출석 체크'
        WHEN 64 THEN '학습 패턴 분석 및 맞춤 학습 경로 제공. 학습 이력 분석, 취약점 파악, 추천 학습'
        WHEN 65 THEN '디지털 교재 뷰어 및 북마크 관리. PDF/ePub 지원, 형광펜, 메모, 검색'
        WHEN 66 THEN 'QR/NFC 기반 출결 자동 체크. 위치 기반 출석, 대리 출석 방지, 통계 리포트'
        WHEN 67 THEN '성적 입력 및 학점 산출 자동화. 상대평가/절대평가, 학점 분포 분석, 이의신청 관리'
        WHEN 68 THEN '학사 행정 업무 전산화. 수강신청, 휴복학, 졸업 요건 체크, 증명서 발급'
        WHEN 69 THEN '교육 콘텐츠 관리 시스템 구축. 콘텐츠 버전 관리, 메타데이터, 검색, 공유'
        WHEN 70 THEN '학생 상담 이력 관리 및 분석. 상담 예약, 이력 기록, 통계 분석, 위기 학생 선별'
        WHEN 71 THEN '대출 심사 AI 모델 개발 및 적용. 신용평가, 부도 예측, 자동 심사, 한도 산정'
        WHEN 72 THEN '자산 배분 및 리밸런싱 자동화. 포트폴리오 최적화, 자동 매매, 성과 분석'
        WHEN 73 THEN '가상자산 거래소 고도화. 코인 상장, 실시간 호가, 자동 매매 API, 보안 강화'
        WHEN 74 THEN 'P2P 대출 플랫폼 매칭 알고리즘. 투자자-차입자 매칭, 리스크 분산, 수익률 최적화'
        WHEN 75 THEN 'AI 기반 신용평가 모델 개발. 대안 데이터 활용, 신용등급 예측, 설명 가능한 AI'
        WHEN 76 THEN '실시간 부정거래 탐지 시스템. 이상 패턴 감지, 룰 엔진, 머신러닝 모델 앙상블'
        WHEN 77 THEN '자금세탁방지 시스템 고도화. 거래 모니터링, 의심거래 보고, 고객 실사'
        WHEN 78 THEN '모바일 뱅킹 앱 리뉴얼. 생체 인증, 간편 송금, 자산 관리, 금융 상품 추천'
        WHEN 79 THEN '간편결제 서비스 통합. QR 결제, NFC 결제, 해외 송금, 포인트 적립'
        WHEN 80 THEN '보험 청구 서류 자동 처리. OCR 기반 서류 인식, 자동 심사, 보험금 산정'
        WHEN 81 THEN '스마트 컨트랙트 개발 및 감사. Solidity 코드 작성, 보안 감사, 테스트넷 배포'
        WHEN 82 THEN 'DeFi 프로토콜 연동 및 유동성 제공. DEX 연동, 스테이킹, 이자 농사, APY 최적화'
        WHEN 83 THEN 'DAO 투표 및 제안 시스템 구축. 거버넌스 토큰, 온체인 투표, 제안 심의'
        WHEN 84 THEN '크로스체인 자산 이동 브릿지. 체인 간 토큰 전송, 유동성 풀, 수수료 최적화'
        WHEN 85 THEN 'NFT 생성 및 거래 플랫폼. 민팅, 마켓플레이스, 로열티, 희소성 분석'
        WHEN 86 THEN 'Web3 지갑 통합 로그인. 메타마스크 연동, WalletConnect, 다중 지갑 지원'
        WHEN 87 THEN '블록체인 게임 경제 시스템. Play-to-Earn, 인게임 토큰, NFT 아이템'
        WHEN 88 THEN '메타버스 가상 경제 플랫폼. 가상 부동산, 디지털 상품, 가상 화폐'
        WHEN 89 THEN '소셜 토큰 발행 및 커뮤니티 구축. 크리에이터 토큰, 팬 보상, 커뮤니티 거버넌스'
        WHEN 90 THEN '탈중앙화 신원 인증 시스템. DID, SSI, 검증 가능한 자격증명, 개인정보 보호'
        WHEN 91 THEN '양자 알고리즘 시뮬레이션 플랫폼. Qiskit/Cirq 통합, 양자 회로 설계, 시뮬레이션'
        WHEN 92 THEN '뇌-컴퓨터 인터페이스 개발. 뇌파 신호 수집, 의도 파악, 디바이스 제어'
        WHEN 93 THEN '범용 인공지능 연구 플랫폼. 멀티모달 학습, 전이 학습, 메타 러닝'
        WHEN 94 THEN '홀로그램 프로젝션 시스템. 3D 콘텐츠 생성, 실시간 렌더링, 인터랙션'
        WHEN 95 THEN '나노 스케일 제조 공정 제어. 원자 단위 조작, 실시간 모니터링, 품질 검증'
        WHEN 96 THEN 'DNA 저장 매체 데이터 관리. 염기서열 인코딩, 저장, 검색, 에러 정정'
        WHEN 97 THEN '6G 통신 프로토콜 테스트. 테라헤르츠 통신, 초고속 전송, 초저지연'
        WHEN 98 THEN '궤도 데이터 센터 운영 관리. 위성 통신, 전력 관리, 열 제어, 원격 유지보수'
        WHEN 99 THEN '기후 변화 예측 AI 모델. 기상 데이터 분석, 장기 예측, 극한 기후 예보'
        ELSE '지속가능 스마트 도시 플랫폼. 에너지 효율, 순환 경제, 시민 참여, 삶의 질 향상'
    END as content,
    u.id as requester_id,
    dept.id as requester_dept_id,
    NULL as approver_id,
    TIMESTAMP '2025-05-01 00:00:00' + (INTERVAL '1 day' * ((row_number() OVER (ORDER BY u.id) - 1))) as scheduled_at,
    NULL as deployed_at,
    'system' as created_by,
    'system' as updated_by
FROM (
    SELECT u.* FROM users u 
    WHERE u.email LIKE '%@partner.com'
    ORDER BY u.id
    LIMIT 100
) u
LEFT JOIN LATERAL (
    SELECT d.* FROM departments d 
    WHERE d.company_id = u.company_id
    LIMIT 1
) dept ON true
ON CONFLICT (release_number) DO NOTHING;

-- ========================================
-- 4. RELEASE 데이터 검증 쿼리
-- ========================================

-- RELEASE 데이터 건수 확인
SELECT COUNT(*) as release_count FROM releases;

-- RELEASE 번호 중복 검증
SELECT release_number, COUNT(*) as duplicate_count 
FROM releases 
GROUP BY release_number 
HAVING COUNT(*) > 1;

-- 요청자 존재 검증
SELECT r.release_number, r.requester_id, u.email
FROM releases r
LEFT JOIN users u ON r.requester_id = u.id
WHERE u.id IS NULL;

-- 승인자 존재 검증 (NULL 허용, REQUESTED는 NULL)
SELECT r.release_number, r.approver_id, u.email
FROM releases r
LEFT JOIN users u ON r.approver_id = u.id
WHERE r.approver_id IS NOT NULL AND u.id IS NULL;

-- 릴리즈 유형별 통계
SELECT release_type, status, COUNT(*) as count
FROM releases
GROUP BY release_type, status
ORDER BY release_type, status;

-- 릴리즈 상태별 통계
SELECT 
    status,
    COUNT(*) as count,
    ROUND(COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM releases) * 100, 2) as percentage
FROM releases
GROUP BY status
ORDER BY count DESC;

-- 요청자별 릴리즈 건수
SELECT 
    u.email as requester_email,
    COUNT(r.id) as release_count,
    STRING_AGG(DISTINCT r.release_type, ', ' ORDER BY r.release_type) as release_types,
    STRING_AGG(DISTINCT r.status, ', ' ORDER BY r.status) as statuses
FROM releases r
JOIN users u ON r.requester_id = u.id
GROUP BY u.email
HAVING COUNT(r.id) > 0
ORDER BY release_count DESC
LIMIT 20;

-- 월별 릴리즈 예정 통계
SELECT 
    TO_CHAR(scheduled_at, 'YYYY-MM') as month,
    COUNT(*) as scheduled_releases,
    SUM(CASE WHEN status = 'DEPLOYED' THEN 1 ELSE 0 END) as deployed,
    SUM(CASE WHEN status = 'APPROVED' THEN 1 ELSE 0 END) as approved,
    SUM(CASE WHEN status = 'REQUESTED' THEN 1 ELSE 0 END) as requested,
    SUM(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) as cancelled
FROM releases
WHERE scheduled_at IS NOT NULL
GROUP BY TO_CHAR(scheduled_at, 'YYYY-MM')
ORDER BY month;

-- REQUESTED 릴리즈 상세 현황
SELECT 
    release_number,
    title,
    u.email as requester_email,
    d.name as requester_dept,
    scheduled_at
FROM releases r
JOIN users u ON r.requester_id = u.id
LEFT JOIN departments d ON r.requester_dept_id = d.id
WHERE r.status = 'REQUESTED'
ORDER BY r.scheduled_at
LIMIT 10;

-- RELEASE 등록 로직 분석 및 데이터 마이그레이션 완료
-- V3.0.8__partner_migration.sql에 있는 파트너 기준으로 총 100개의 RELEASE 요청 데이터를 생성하였습니다.
-- 모든 RELEASE는 파트너 사용자를 요청자로 연계되어 있으며, REQUESTED 상태로 구성되어 있습니다.
-- RELEASE 번호 중복 검증 및 요청자 존재 검증을 통해 데이터 무결성을 보장합니다.
-- 모든 RELEASE는 DB 스키마의 CHECK 제약 조건을 준수합니다:
--   - release_type: 'REGULAR'(정기)
--   - status: 'REQUESTED'(요청됨) - 승인 대기 상태
-- 
-- 릴리즈 구성:
--   - REGULAR + REQUESTED: 100개 (REL2501-0001 ~ REL2501-0100)
--   - 릴리즈 번호: REL2501-0001 ~ REL2501-0100
--   - 2025-05-01부터 1일 간격으로 예정된 릴리즈 요청
--   - 다양한 분야의 시스템 (AI, 블록체인, IoT, 헬스케어, 핀테크, 교육, 메타버스 등)
--   - approver_id는 NULL (승인 대기 중)
--   - deployed_at는 NULL (아직 배포되지 않음)
