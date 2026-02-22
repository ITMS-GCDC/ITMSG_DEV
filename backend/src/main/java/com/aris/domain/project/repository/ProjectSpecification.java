package com.aris.domain.project.repository;

import com.aris.domain.project.entity.Project;
import com.aris.domain.project.entity.ProjectStatus;
import com.aris.domain.project.entity.ProjectType;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * 프로젝트 동적 검색 조건 (JPA Criteria API)
 * Hibernate 6 + Spring Data JPA 3.x 호환
 * - FETCH JOIN 없이 단순 predicate만 구성 → 연관 엔티티 안전 접근은 ProjectResponse.from()에서 처리
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

            if (name != null && !name.isBlank()) {
                predicates.add(cb.like(root.get("name"), "%" + name + "%"));
            }
            if (projectType != null) {
                predicates.add(cb.equal(root.get("projectType"), projectType));
            }
            if (status != null) {
                predicates.add(cb.equal(root.get("status"), status));
            }
            if (companyId != null) {
                Join<?, ?> companyJoin = root.join("company", JoinType.LEFT);
                predicates.add(cb.equal(companyJoin.get("id"), companyId));
            }
            if (pmId != null) {
                Join<?, ?> pmJoin = root.join("pm", JoinType.LEFT);
                predicates.add(cb.equal(pmJoin.get("id"), pmId));
            }
            if (startDate != null) {
                predicates.add(cb.greaterThanOrEqualTo(root.get("startDate"), startDate));
            }
            if (endDate != null) {
                predicates.add(cb.lessThanOrEqualTo(root.get("endDate"), endDate));
            }

            // Soft Delete 제외
            predicates.add(cb.isNull(root.get("deletedAt")));

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}
