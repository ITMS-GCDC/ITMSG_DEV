package com.aris.domain.issue.repository;

import com.aris.domain.issue.entity.Issue;
import com.aris.domain.issue.entity.IssueStatus;
import com.aris.domain.issue.entity.IssueType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Issue Repository
 */
@Repository
public interface IssueRepository extends JpaRepository<Issue, Long> {
    
    Optional<Issue> findByIssueNumber(String issueNumber);
    
    boolean existsByIssueNumber(String issueNumber);
    
    @Query("SELECT COUNT(i) FROM Issue i " +
           "WHERE EXTRACT(YEAR FROM i.createdAt) = :year " +
           "AND EXTRACT(MONTH FROM i.createdAt) = :month")
    Long countByYearAndMonth(@Param("year") int year, @Param("month") int month);
    
    @Query("SELECT MAX(i.issueNumber) FROM Issue i WHERE i.issueNumber LIKE :prefix%")
    String findMaxIssueNumberByPrefix(@Param("prefix") String prefix);
    
    @Query("SELECT i FROM Issue i " +
           "LEFT JOIN i.project p " +
           "LEFT JOIN p.company c " +
           "WHERE (:companyId IS NULL OR c.id = :companyId) " +
           "AND (:projectName IS NULL OR p.name LIKE %:projectName%) " +
           "AND (:issueNumber IS NULL OR i.issueNumber LIKE %:issueNumber%) " +
           "AND (:issueType IS NULL OR i.issueType = :issueType) " +
           "AND (:priority IS NULL OR i.priority = :priority) " +
           "AND (:status IS NULL OR i.status = :status) " +
           "AND i.deletedAt IS NULL")
    Page<Issue> search(@Param("companyId") Long companyId,
                      @Param("projectName") String projectName,
                      @Param("issueNumber") String issueNumber,
                      @Param("issueType") IssueType issueType,
                      @Param("priority") String priority,
                      @Param("status") IssueStatus status,
                      Pageable pageable);
    
    /**
     * 보고자의 최근 이슈 목록 조회 (대시보드용)
     */
    @Query("SELECT i FROM Issue i " +
           "WHERE i.reporter.id = :reporterId " +
           "AND i.deletedAt IS NULL " +
           "ORDER BY i.createdAt DESC")
    List<Issue> findRecentByReporterId(@Param("reporterId") Long reporterId, Pageable pageable);
}









