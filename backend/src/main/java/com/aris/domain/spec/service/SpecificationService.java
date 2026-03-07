package com.aris.domain.spec.service;

import com.aris.domain.spec.dto.SpecRequest;
import com.aris.domain.spec.dto.SpecResponse;
import com.aris.domain.spec.entity.Specification;
import com.aris.domain.spec.entity.SpecCategory;
import com.aris.domain.spec.entity.SpecStatus;
import com.aris.domain.spec.entity.SpecType;
import com.aris.domain.spec.repository.SpecificationRepository;
import com.aris.domain.sr.entity.ServiceRequest;
import com.aris.domain.sr.repository.ServiceRequestRepository;
import com.aris.domain.user.entity.User;
import com.aris.domain.user.repository.UserRepository;
import com.aris.global.common.service.NumberingService;
import com.aris.global.exception.BusinessException;
import com.aris.global.exception.ErrorCode;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Predicate;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

// org.springframework.data.jpa.domain.Specification은 엔티티 Specification과 이름 충돌로
// searchSpecifications 메서드 내부에서 fully qualified name으로 사용

/**
 * SPEC Service
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SpecificationService {
    
    private final SpecificationRepository specificationRepository;
    private final ServiceRequestRepository serviceRequestRepository;
    private final UserRepository userRepository;
    private final NumberingService numberingService;
    
    /**
     * SPEC 등록
     */
    @Transactional
    public SpecResponse createSpecification(SpecRequest request) {
        // SR 조회 및 승인 여부 확인
        ServiceRequest sr = serviceRequestRepository.findById(request.getSrId())
                .orElseThrow(() -> new BusinessException(ErrorCode.SR_NOT_FOUND));
        
        if (!sr.isApproved()) {
            throw new BusinessException(ErrorCode.SPEC_CANNOT_BE_CREATED);
        }
        
        // 담당자 조회 (선택사항)
        User assignee = null;
        if (request.getAssigneeId() != null) {
            assignee = userRepository.findById(request.getAssigneeId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
        }
        
        // 검토자 조회 (선택사항)
        User reviewer = null;
        if (request.getReviewerId() != null) {
            reviewer = userRepository.findById(request.getReviewerId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
        }
        
        // SPEC 번호 자동 생성
        String specNumber = numberingService.generateSpecNumber();
        
        // SPEC 생성
        Specification spec = Specification.builder()
                .specNumber(specNumber)
                .serviceRequest(sr)
                .specType(request.getSpecType())
                .specCategory(request.getSpecCategory())
                .status(SpecStatus.PENDING)
                .functionPoint(request.getFunctionPoint())
                .manDay(request.getManDay())
                .assignee(assignee)
                .reviewer(reviewer)
                .build();
        
        Specification savedSpec = specificationRepository.save(spec);
        
        // SR에 SPEC 연결
        sr.linkSpecification(savedSpec);
        
        return SpecResponse.from(savedSpec);
    }
    
    /**
     * SPEC 조회
     */
    public SpecResponse getSpecification(Long id) {
        Specification spec = specificationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        return SpecResponse.from(spec);
    }
    
    /**
     * SPEC 번호로 조회
     */
    public SpecResponse getSpecificationByNumber(String specNumber) {
        Specification spec = specificationRepository.findBySpecNumber(specNumber)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        return SpecResponse.from(spec);
    }
    
    /**
     * SPEC 목록 조회 (검색 및 필터링: 회사ID, 프로젝트명, SR번호, 유형, 분류, 상태)
     * JPA Criteria API: JPQL null 파라미터 타입 추론(bytea 오류) 및 Hibernate 6 CAST 이슈 근본 해결
     * 회사 검색: SR 관리화면과 동일하게 companyId(정확 일치)로 처리
     */
    public Page<SpecResponse> searchSpecifications(Long companyId, String projectName,
                                                    String srNumber, SpecType specType,
                                                    SpecCategory specCategory, SpecStatus status,
                                                    Pageable pageable) {
        org.springframework.data.jpa.domain.Specification<Specification> searchSpec = (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            predicates.add(cb.isNull(root.get("deletedAt")));

            boolean needsSrJoin = hasText(srNumber) || hasText(projectName) || companyId != null;
            if (needsSrJoin) {
                Join<Specification, ServiceRequest> srJoin = root.join("serviceRequest", JoinType.LEFT);

                if (hasText(srNumber)) {
                    predicates.add(cb.like(cb.lower(srJoin.get("srNumber")),
                            "%" + srNumber.toLowerCase() + "%"));
                }

                boolean needsProjectJoin = hasText(projectName) || companyId != null;
                if (needsProjectJoin) {
                    Join<Object, Object> projectJoin = srJoin.join("project", JoinType.LEFT);

                    if (hasText(projectName)) {
                        predicates.add(cb.like(cb.lower(projectJoin.get("name")),
                                "%" + projectName.toLowerCase() + "%"));
                    }

                    if (companyId != null) {
                        Join<Object, Object> companyJoin = projectJoin.join("company", JoinType.LEFT);
                        predicates.add(cb.equal(companyJoin.get("id"), companyId));
                    }
                }
            }

            if (specType != null) {
                predicates.add(cb.equal(root.get("specType"), specType));
            }
            if (specCategory != null) {
                predicates.add(cb.equal(root.get("specCategory"), specCategory));
            }
            if (status != null) {
                predicates.add(cb.equal(root.get("status"), status));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };

        return specificationRepository.findAll(searchSpec, pageable).map(SpecResponse::from);
    }

    private boolean hasText(String value) {
        return value != null && !value.isBlank();
    }
    
    /**
     * SPEC 수정
     */
    @Transactional
    public SpecResponse updateSpecification(Long id, SpecRequest request) {
        Specification spec = specificationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        
        spec.updateInfo(request.getFunctionPoint(), request.getManDay());
        
        // 담당자/검토자 변경
        if (request.getAssigneeId() != null || request.getReviewerId() != null) {
            User assignee = request.getAssigneeId() != null
                    ? userRepository.findById(request.getAssigneeId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND))
                    : spec.getAssignee();
            
            User reviewer = request.getReviewerId() != null
                    ? userRepository.findById(request.getReviewerId())
                    .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND))
                    : spec.getReviewer();
            
            spec.assignTo(assignee, reviewer);
        }
        
        return SpecResponse.from(spec);
    }
    
    /**
     * SPEC 작업 시작
     */
    @Transactional
    public SpecResponse startWork(Long id) {
        Specification spec = specificationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        
        spec.startWork();
        return SpecResponse.from(spec);
    }
    
    /**
     * SPEC 작업 완료
     */
    @Transactional
    public SpecResponse complete(Long id) {
        Specification spec = specificationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        
        spec.complete();
        return SpecResponse.from(spec);
    }
    
    /**
     * SPEC 상태 변경
     */
    @Transactional
    public SpecResponse changeStatus(Long id, SpecStatus status) {
        Specification spec = specificationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        
        spec.changeStatus(status);
        return SpecResponse.from(spec);
    }
    
    /**
     * SPEC 삭제 (Soft Delete)
     */
    @Transactional
    public void deleteSpecification(Long id) {
        Specification spec = specificationRepository.findById(id)
                .orElseThrow(() -> new BusinessException(ErrorCode.SPEC_NOT_FOUND));
        spec.delete();
    }
    
    /**
     * 승인 요청 가능한 SPEC 목록 조회 (진행중 상태만)
     * Admin은 모든 승인 대기 SPEC 조회, 일반 사용자는 본인 담당 SPEC만 조회
     */
    public List<SpecResponse> getApprovableSpecs() {
        List<Specification> specs;
        if (isAdmin()) {
            specs = specificationRepository.findApprovable();
        } else {
            User currentUser = getCurrentUser();
            specs = specificationRepository.findApprovableByAssigneeId(currentUser.getId());
        }
        return specs.stream().map(SpecResponse::from).toList();
    }
    
    /**
     * 현재 로그인 사용자 조회
     */
    private User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new BusinessException(ErrorCode.USER_NOT_FOUND));
    }
    
    /**
     * 현재 사용자가 Admin 권한인지 확인
     */
    private boolean isAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .anyMatch(role -> role.equals("ROLE_ADMIN") || role.equals("ROLE_SYSTEM_ADMIN"));
    }
}



