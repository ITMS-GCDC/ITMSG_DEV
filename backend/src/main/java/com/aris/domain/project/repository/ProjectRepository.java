package com.aris.domain.project.repository;

import com.aris.domain.project.entity.Project;
import com.aris.domain.project.entity.ProjectStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 프로젝트 Repository
 */
@Repository
public interface ProjectRepository extends JpaRepository<Project, Long>, JpaSpecificationExecutor<Project> {

    /**
     * 프로젝트 목록 조회 (Specification + EntityGraph로 연관 엔티티 즉시 로딩)
     * Spring Data JPA 3.2.x: count 쿼리에는 EntityGraph가 적용되지 않아 pagination 안전
     */
    @EntityGraph(value = "Project.withCompanyAndPm")
    @Override
    Page<Project> findAll(Specification<Project> spec, Pageable pageable);

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









