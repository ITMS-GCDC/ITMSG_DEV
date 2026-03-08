package com.aris.domain.incident.repository;

import com.aris.domain.incident.entity.Incident;
import com.aris.domain.incident.entity.IncidentStatus;
import com.aris.domain.incident.entity.Severity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Incident Repository
 */
@Repository
public interface IncidentRepository extends JpaRepository<Incident, Long> {
    
    Optional<Incident> findByIncidentNumber(String incidentNumber);
    
    boolean existsByIncidentNumber(String incidentNumber);
    
    @Query("SELECT COUNT(i) FROM Incident i " +
           "WHERE EXTRACT(YEAR FROM i.createdAt) = :year " +
           "AND EXTRACT(MONTH FROM i.createdAt) = :month")
    Long countByYearAndMonth(@Param("year") int year, @Param("month") int month);
    
    @Query("SELECT MAX(i.incidentNumber) FROM Incident i WHERE i.incidentNumber LIKE :prefix%")
    String findMaxIncidentNumberByPrefix(@Param("prefix") String prefix);
    
    @Query("SELECT i FROM Incident i " +
           "LEFT JOIN i.assignee a " +
           "LEFT JOIN a.company c " +
           "WHERE (:incidentNumber IS NULL OR i.incidentNumber LIKE %:incidentNumber%) " +
           "AND (:status IS NULL OR i.status = :status) " +
           "AND (:severity IS NULL OR i.severity = :severity) " +
           "AND (:assigneeId IS NULL OR a.id = :assigneeId) " +
           "AND (:companyId IS NULL OR c.id = :companyId) " +
           "AND i.deletedAt IS NULL")
    Page<Incident> search(@Param("incidentNumber") String incidentNumber,
                         @Param("status") IncidentStatus status,
                         @Param("severity") Severity severity,
                         @Param("assigneeId") Long assigneeId,
                         @Param("companyId") Long companyId,
                         Pageable pageable);
}









