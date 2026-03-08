// SPEC (Specification) 관련 타입 정의

export type SpecType = 'DEVELOPMENT' | 'OPERATION';
export type SpecCategory = 'ACCEPTED' | 'CANCELLED';
export type SpecStatus =
  | 'PENDING'
  | 'IN_PROGRESS'
  | 'APPROVAL_PENDING'
  | 'APPROVED'
  | 'REJECTED'
  | 'COMPLETED';

export interface Specification {
  id: number;
  specNumber: string;
  specType: SpecType;
  specCategory: SpecCategory;
  status: SpecStatus;
  functionPoint?: number;
  manDay?: number;
  srId: number;
  srNumber?: string;
  srTitle?: string;
  companyName?: string;
  projectName?: string;
  assigneeId?: number;
  assigneeName?: string;
  reviewerId?: number;
  reviewerName?: string;
  reviewedAt?: string;
  createdBy: string;
  createdAt: string;
  updatedAt: string;
}

export interface SpecCreateRequest {
  srId: number;
  specType: SpecType;
  specCategory: SpecCategory;
  functionPoint?: number;
  manDay?: number;
  assigneeId?: number;
  reviewerId?: number;
}

export interface SpecUpdateRequest {
  srId: number;
  specType: SpecType;
  specCategory: SpecCategory;
  functionPoint?: number;
  manDay?: number;
  assigneeId?: number;
  reviewerId?: number;
}

export interface SpecListParams {
  page?: number;
  size?: number;
  companyId?: number;
  projectName?: string;
  srNumber?: string;
  specType?: string;
  specCategory?: string;
  status?: string;
}





