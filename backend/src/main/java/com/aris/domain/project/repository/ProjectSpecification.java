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
 *
 * Hibernate 6 + Spring Data JPA 3.x 호환:
 * - COUNT 쿼리와 SELECT 쿼리를 query.getResultType()으로 구분
 * - SELECT 쿼리: LEFT JOIN FETCH(즉시 로딩) → EntityNotFoundException 방지
 * - COUNT 쿼리: 일반 LEFT JOIN → FETCH 없이 카운트만 처리
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

            // 페이지네이션 COUNT 쿼리 여부 — COUNT 쿼리에 FETCH JOIN 적용 시 오류 발생
            final boolean isCountQuery = Long.class.equals(query.getResultType());

            if (!isCountQuery) {
                // 데이터 조회 쿼리: LEFT JOIN FETCH로 연관 엔티티 즉시 로딩
                // Hibernate 구현체에서 Fetch<X,Y>는 Join<X,Y>를 상속하므로 캐스트 가능
                @SuppressWarnings("unchecked")
                Join<Project, ?> companyFetch = (Join<Project, ?>) root.fetch("company", JoinType.LEFT);
                @SuppressWarnings("unchecked")
                Join<Project, ?> pmFetch = (Join<Project, ?>) root.fetch("pm", JoinType.LEFT);
                query.distinct(true);

                if (companyId != null) {
                    predicates.add(cb.equal(companyFetch.get("id"), companyId));
                }
                if (pmId != null) {
                    predicates.add(cb.equal(pmFetch.get("id"), pmId));
                }
            } else {
                // COUNT 쿼리: 일반 LEFT JOIN으로 필터 처리
                if (companyId != null) {
                    predicates.add(cb.equal(root.join("company", JoinType.LEFT).get("id"), companyId));
                }
                if (pmId != null) {
                    predicates.add(cb.equal(root.join("pm", JoinType.LEFT).get("id"), pmId));
                }
            }

            if (name != null && !name.isBlank()) {
                predicates.add(cb.like(root.get("name"), "%" + name + "%"));
            }
            if (projectType != null) {
                predicates.add(cb.equal(root.get("projectType"), projectType));
            }
            if (status != null) {
                predicates.add(cb.equal(root.get("status"), status));
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
