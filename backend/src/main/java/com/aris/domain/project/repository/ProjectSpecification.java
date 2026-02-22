package com.aris.domain.project.repository;

import com.aris.domain.project.entity.Project;
import com.aris.domain.project.entity.ProjectStatus;
import com.aris.domain.project.entity.ProjectType;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * 프로젝트 동적 검색 조건 (JPA Criteria API)
 * Hibernate 6 + Spring Data JPA 3.x 호환
 * - 명시적 JOIN 대신 경로 탐색(path navigation) 사용: root.get("company").get("id")
 *   → Hibernate 6가 FK 컬럼을 직접 참조하거나 INNER JOIN으로 최적화
 *   → COUNT 쿼리 생성 시 JOIN 충돌 없음
 */
public class ProjectSpecification {

    public static Specification<Project> search(
            String name,
            ProjectType projectType,
            ProjectStatus status,
            Long companyId,
            Long pmId,
            LocalDate startDate,
            LocalDate endDate) {

        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            // Soft Delete 제외 (항상 적용)
            predicates.add(cb.isNull(root.get("deletedAt")));

            if (name != null && !name.isBlank()) {
                predicates.add(cb.like(root.get("name"), "%" + name + "%"));
            }
            if (projectType != null) {
                predicates.add(cb.equal(root.get("projectType"), projectType));
            }
            if (status != null) {
                predicates.add(cb.equal(root.get("status"), status));
            }
            // 경로 탐색 사용: root.get("company").get("id") → projects.company_id 직접 비교
            if (companyId != null) {
                predicates.add(cb.equal(root.get("company").get("id"), companyId));
            }
            // pm은 nullable(@ManyToOne), pmId 지정 시 해당 PM의 프로젝트만 조회
            if (pmId != null) {
                predicates.add(cb.equal(root.get("pm").get("id"), pmId));
            }
            if (startDate != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get("startDate"), startDate));
            }
            if (endDate != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get("endDate"), endDate));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}
