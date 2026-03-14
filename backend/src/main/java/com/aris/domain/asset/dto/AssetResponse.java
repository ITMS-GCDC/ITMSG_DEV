package com.aris.domain.asset.dto;

import com.aris.domain.asset.entity.Asset;
import com.aris.domain.asset.entity.AssetType;
import lombok.Builder;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Builder
public record AssetResponse(
        Long id,
        String assetNumber,
        AssetType assetType,
        String serialNumber,
        LocalDate acquiredAt,
        Boolean isExpired,
        LocalDate expiredAt,
        Long managerId,
        String managerName,
        Long projectId,
        String projectName,
        Long companyId,
        String companyName,
        LocalDateTime createdAt,
        String createdBy,
        LocalDateTime updatedAt,
        String updatedBy
) {
    public static AssetResponse from(Asset asset) {
        Long projectId = null;
        String projectName = null;
        Long companyId = null;
        String companyName = null;
        try {
            if (asset.getProject() != null) {
                projectId = asset.getProject().getId();
                projectName = asset.getProject().getName();
                try {
                    if (asset.getProject().getCompany() != null) {
                        companyId = asset.getProject().getCompany().getId();
                        companyName = asset.getProject().getCompany().getName();
                    }
                } catch (Exception ignored) {}
            }
        } catch (Exception ignored) {}

        return AssetResponse.builder()
                .id(asset.getId())
                .assetNumber(asset.getAssetNumber())
                .assetType(asset.getAssetType())
                .serialNumber(asset.getSerialNumber())
                .acquiredAt(asset.getAcquiredAt())
                .isExpired(asset.getIsExpired())
                .expiredAt(asset.getExpiredAt())
                .managerId(asset.getManager() != null ? asset.getManager().getId() : null)
                .managerName(asset.getManager() != null ? asset.getManager().getName() : null)
                .projectId(projectId)
                .projectName(projectName)
                .companyId(companyId)
                .companyName(companyName)
                .createdAt(asset.getCreatedAt())
                .createdBy(asset.getCreatedBy())
                .updatedAt(asset.getUpdatedAt())
                .updatedBy(asset.getUpdatedBy())
                .build();
    }
}
