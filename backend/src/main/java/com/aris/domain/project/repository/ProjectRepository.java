package com.aris.domain.project.repository;

import com.aris.domain.project.entity.Project;
import com.aris.domain.project.entity.ProjectStatus;
import com.aris.domain.project.entity.ProjectType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * 프로젝트 Repository
 */
@Repository
public interface ProjectRepository extends JpaRepository<Project, Long>, JpaSpecificationExecutor<Project> {

    /**
     * 프로젝트 목록 조회 - LEFT JOIN FETCH로 연관 엔티티 즉시 로딩
     * @EntityGraph + JpaSpecificationExecutor 대신 JPQL + 별도 countQuery 사용
     * (Hibernate 6 + Spring Data JPA 3.2 호환 방식)
     */
    @Query(
        value = "SELECT p FROM Project p " +
                "LEFT JOIN FETCH p.company c " +
                "LEFT JOIN FETCH p.pm u " +
                "WHERE p.deletedAt IS NULL " +
                "AND (:name IS NULL OR p.name LIKE CONCAT('%', :name, '%')) " +
                "AND (:projectType IS NULL OR p.projectType = :projectType) " +
                "AND (:status IS NULL OR p.status = :status) " +
                "AND (:companyId IS NULL OR c.id = :companyId) " +
                "AND (:pmId IS NULL OR u.id = :pmId) " +
                "AND (:startDate IS NULL OR p.startDate >= :startDate) " +
                "AND (:endDate IS NULL OR p.endDate <= :endDate)",
        countQuery = "SELECT COUNT(p) FROM Project p " +
                     "LEFT JOIN p.company c " +
                     "LEFT JOIN p.pm u " +
                     "WHERE p.deletedAt IS NULL " +
                     "AND (:name IS NULL OR p.name LIKE CONCAT('%', :name, '%')) " +
                     "AND (:projectType IS NULL OR p.projectType = :projectType) " +
                     "AND (:status IS NULL OR p.status = :status) " +
                     "AND (:companyId IS NULL OR c.id = :companyId) " +
                     "AND (:pmId IS NULL OR u.id = :pmId) " +
                     "AND (:startDate IS NULL OR p.startDate >= :startDate) " +
                     "AND (:endDate IS NULL OR p.endDate <= :endDate)"
    )
    Page<Project> searchProjectsList(
            @Param("name") String name,
            @Param("projectType") ProjectType projectType,
            @Param("status") ProjectStatus status,
            @Param("companyId") Long companyId,
            @Param("pmId") Long pmId,
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate,
            Pageable pageable
    );

    /**
     * 프로젝트 코드로 조회
     */
    Optional<Project> findByCode(String code);

    /**
     * 프로젝트 코드 중복 확인
     */
    boolean existsByCode(String code);

    /**
     * 회사별 프로젝트 목록 조회
     */
    @Query("SELECT p FROM Project p WHERE p.company.id = :companyId AND p.deletedAt IS NULL")
    List<Project> findByCompanyId(@Param("companyId") Long companyId);

    /**
     * 상태별 프로젝트 목록 조회
     */
    @Query("SELECT p FROM Project p WHERE p.status = :status AND p.deletedAt IS NULL")
    List<Project> findByStatus(@Param("status") ProjectStatus status);

    /**
     * PM이 관리하는 프로젝트 목록
     */
    @Query("SELECT p FROM Project p WHERE p.pm.id = :pmId AND p.deletedAt IS NULL")
    List<Project> findByPmId(@Param("pmId") Long pmId);
}
