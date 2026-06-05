export type LeadState = 
  | 'POR_PROSPECTAR'
  | 'CONTACTADO'
  | 'EN_NEGOCIACION'
  | 'PROPUESTA_ENVIADA'
  | 'CERRADO_GANADO'
  | 'CERRADO_PERDIDO';

export interface Lead {
  id: string;
  n: number;
  grupo: string;
  region: string;
  comuna: string;
  estresHidrico: string;
  alcalde: string;
  emailAlcaldia: string;
  dirMedioAmbiente: string;
  emailMA: string;
  telMA: string;
  secplaNombre: string;
  secplaEmail: string;
  secplaFono: string;
  gobernadorRegional: string;
  emailGore: string;
  fonoGore: string;
  concejalClave: string;
  emailConcejal: string;
  aprClave: string;
  contactoApr: string;
  dolorHidrico: string;
  oportunidad: string;
  score: string; // e.g. "Alta - 5/5"
  scoreNumeric: number; // e.g. 5
  estado: LeadState;
  
  // Custom CRM Tracking fields
  assignedAgentId: string;
  lastContactDate?: string;
  nextFollowUpDate?: string;
  m3Proposed: number; // Water volume proposal in m³/dia
  contractValue: number; // Proposal value in USD (e.g. B.O.T model monthly fee)
  interactions: InteractionLog[];
}

export interface InteractionLog {
  id: string;
  type: 'email' | 'call' | 'meeting' | 'status_change' | 'system';
  summary: string;
  details: string;
  date: string;
  agentName: string;
}

export interface Agent {
  id: string;
  name: string;
  role: string;
  email: string;
  color: string;
  leadsAssigned: number;
  wonCount: number;
  proposalCount: number;
  performanceScore: number; // 0-100 index based on won and contact ratios
  rating: number; // rating e.g. 4.8
  avatar: string;
}

export interface PipelineStageConfig {
  id: LeadState;
  label: string;
  colorClass: string;
  badgeColor: string;
  borderColor: string;
  description: string;
}
