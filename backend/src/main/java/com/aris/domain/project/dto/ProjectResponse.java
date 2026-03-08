package com.aris.domain.project.dto;

import com.aris.domain.project.entity.Project;
import com.aris.domain.project.entity.ProjectStatus;
import com.aris.domain.project.entity.ProjectType;
import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 프로젝트 응답 DTO
 */
@Getter
@Builder
public class ProjectResponse {
    
    private Long id;
    private String code;
    private String name;
    private ProjectType projectType;
    private ProjectStatus status;
    private LocalDate startDate;
    private LocalDate endDate;
    private Long companyId;
    private String companyName;
    private String description;
    private BigDecimal budget;
    private Long pmId;
    private String pmName;
    private LocalDateTime createdAt;
    private String createdBy;
    private LocalDateTime updatedAt;
    
    public static ProjectResponse from(Project project) {
        // 연관 엔티티는 Lazy 로딩 — FK 불일치(ObjectNotFoundException) 등 예외 발생 시 null 처리
        Long companyId = null;
        String companyName = null;
        try {
            if (project.getCompany() != null) {
                companyId = project.getCompany().getId();
                companyName = project.getCompany().getName();
            }
        } catch (Exception ignored) { /* FK 참조 대상 없음 — null로 처리 */ }

        Long pmId = null;
        String pmName = null;
        try {
            if (project.getPm() != null) {
                pmId = project.getPm().getId();
                pmName = project.getPm().getName();
            }
        } catch (Exception ignored) { /* FK 참조 대상 없음 — null로 처리 */ }

        return ProjectResponse.builder()
                .id(project.getId())
                .code(project.getCode())
                .name(project.getName())
                .projectType(project.getProjectType())
                .status(project.getStatus())
                .startDate(project.getStartDate())
                .endDate(project.getEndDate())
                .companyId(companyId)
                .companyName(companyName)
                .description(project.getDescription())
                .budget(project.getBudget())
                .pmId(pmId)
                .pmName(pmName)
                .createdAt(project.getCreatedAt())
                .createdBy(project.getCreatedBy())
                .updatedAt(project.getUpdatedAt())
                .build();
    }
}









