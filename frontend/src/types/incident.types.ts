// 장애 관리 관련 타입 정의

export type IncidentSeverity = 'HIGH' | 'MEDIUM' | 'LOW';
export type IncidentStatus = 'OPEN' | 'IN_PROGRESS' | 'RESOLVED' | 'CLOSED';
export type IncidentType = 'INCIDENT' | 'FAILURE';
export type SystemType = 'PROGRAM' | 'DATA' | 'SERVER' | 'NETWORK' | 'PC';

export interface Incident {
  id: number;
  incidentNumber: string;
  title: string;
  incidentType: IncidentType;
  systemType: SystemType;
  businessArea?: string;
  severity: IncidentSeverity;
  status: IncidentStatus;
  occurredAt: string;
  resolvedAt?: string;
  resolution?: string;
  assigneeId?: number;
  assigneeName?: string;
  companyId?: number;
  companyName?: string;
  createdAt: string;
  createdBy: string;
  updatedAt: string;
  updatedBy: string;
}

export interface IncidentCreateRequest {
  title: string;
  incidentType: IncidentType;
  systemType: SystemType;
  businessArea?: string;
  severity: IncidentSeverity;
  occurredAt?: string;
  assigneeId?: number;
}

export interface IncidentUpdateRequest {
  title: string;
  incidentType: IncidentType;
  systemType: SystemType;
  businessArea?: string;
  severity: IncidentSeverity;
  occurredAt?: string;
  assigneeId?: number;
}

export interface IncidentListParams {
  page?: number;
  size?: number;
  incidentNumber?: string;
  status?: string;
  severity?: string;
  companyId?: number;
  assigneeId?: number;
}
