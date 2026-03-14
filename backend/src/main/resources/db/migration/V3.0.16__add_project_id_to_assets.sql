-- V3.0.16: assets 테이블에 project_id 컬럼 추가
-- 자산 관리 화면 검색 조건(회사, 프로젝트명) 지원을 위해 project FK 추가

ALTER TABLE assets ADD COLUMN IF NOT EXISTS project_id BIGINT REFERENCES projects(id);

CREATE INDEX IF NOT EXISTS idx_asset_project ON assets(project_id);

COMMENT ON COLUMN assets.project_id IS '프로젝트 FK (선택사항)';
