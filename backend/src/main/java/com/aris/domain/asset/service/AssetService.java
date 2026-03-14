package com.aris.domain.asset.service;

import com.aris.domain.asset.dto.AssetRequest;
import com.aris.domain.asset.dto.AssetResponse;
import com.aris.domain.asset.entity.Asset;
import com.aris.domain.asset.entity.AssetType;
import com.aris.domain.asset.repository.AssetRepository;
import com.aris.domain.project.entity.Project;
import com.aris.domain.project.repository.ProjectRepository;
import com.aris.domain.user.repository.UserRepository;
import com.aris.global.common.service.NumberingService;
import com.aris.global.exception.BusinessException;
import com.aris.global.exception.ErrorCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Slf4j
public class AssetService {

    private final AssetRepository assetRepository;
    private final UserRepository userRepository;
    private final ProjectRepository projectRepository;
    private final NumberingService numberingService;

    @Transactional
    public AssetResponse createAsset(AssetRequest request) {
        String assetNumber = numberingService.generateAssetNumber();

        var assetBuilder = Asset.builder()
                .assetNumber(assetNumber)
                .assetType(request.assetType())
                .serialNumber(request.serialNumber())
                .acquiredAt(request.acquiredAt());

        if (request.managerId() != null) {
            var manager = userRepository.findById(request.managerId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
            assetBuilder.manager(manager);
        }

        if (request.projectId() != null) {
            Project project = projectRepository.findById(request.projectId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.PROJECT_NOT_FOUND));
            assetBuilder.project(project);
        }

        Asset asset = assetBuilder.build();
        Asset savedAsset = assetRepository.save(asset);

        log.info("자산 생성 완료: {}", savedAsset.getAssetNumber());
        return AssetResponse.from(savedAsset);
    }

    public AssetResponse getAsset(Long id) {
        Asset asset = assetRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.ASSET_NOT_FOUND));
        return AssetResponse.from(asset);
    }

    public AssetResponse getAssetByNumber(String assetNumber) {
        Asset asset = assetRepository.findByAssetNumber(assetNumber)
                .orElseThrow(() -> new BusinessException(ErrorCode.ASSET_NOT_FOUND));
        return AssetResponse.from(asset);
    }

    public Page<AssetResponse> getAssets(AssetType assetType, Boolean isExpired, Long managerId,
                                          String assetNumber, Long companyId, Long projectId,
                                          Pageable pageable) {
        return assetRepository.search(assetType, isExpired, managerId, assetNumber, companyId, projectId, pageable)
                .map(AssetResponse::from);
    }

    @Transactional
    public AssetResponse updateAsset(Long id, AssetRequest request) {
        Asset asset = assetRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.ASSET_NOT_FOUND));

        var manager = request.managerId() != null
                ? userRepository.findById(request.managerId())
                        .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND))
                : null;

        Project project = null;
        if (request.projectId() != null) {
            project = projectRepository.findById(request.projectId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.PROJECT_NOT_FOUND));
        }

        asset.updateAsset(request.assetType(), request.serialNumber(), manager, project);

        log.info("자산 수정 완료: {}", asset.getAssetNumber());
        return AssetResponse.from(asset);
    }

    @Transactional
    public AssetResponse expireAsset(Long id) {
        Asset asset = assetRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.ASSET_NOT_FOUND));

        asset.expire();

        log.info("자산 폐기 처리: {}", asset.getAssetNumber());
        return AssetResponse.from(asset);
    }

    @Transactional
    public AssetResponse restoreAsset(Long id) {
        Asset asset = assetRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.ASSET_NOT_FOUND));

        asset.restore();

        log.info("자산 복원 처리: {}", asset.getAssetNumber());
        return AssetResponse.from(asset);
    }

    @Transactional
    public void deleteAsset(Long id) {
        Asset asset = assetRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.ASSET_NOT_FOUND));

        asset.delete();

        log.info("자산 삭제 완료: {}", asset.getAssetNumber());
    }
}
