package com.aris.domain.asset.entity;

import com.aris.domain.project.entity.Project;
import com.aris.domain.user.entity.User;
import com.aris.global.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

/**
 * 자산 Entity
 */
@Entity
@Table(name = "assets")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
public class Asset extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 20)
    private String assetNumber;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50)
    private AssetType assetType;

    @Column(length = 100)
    private String serialNumber;

    @Column(nullable = false)
    private LocalDate acquiredAt;

    @Column(nullable = false)
    @Builder.Default
    private Boolean isExpired = false;

    @Column
    private LocalDate expiredAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "manager_id")
    private User manager;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "project_id")
    private Project project;

    /**
     * 자산 수정
     */
    public void updateAsset(AssetType assetType, String serialNumber, User manager, Project project) {
        this.assetType = assetType;
        this.serialNumber = serialNumber;
        this.manager = manager;
        this.project = project;
    }

    /**
     * 자산 폐기 처리
     */
    public void expire() {
        this.isExpired = true;
        this.expiredAt = LocalDate.now();
    }

    /**
     * 자산 복원 처리
     */
    public void restore() {
        this.isExpired = false;
        this.expiredAt = null;
    }
}







