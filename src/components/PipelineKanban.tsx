import React from 'react';
import { Lead, LeadState } from '../types';
import { PIPELINE_STAGES, INITIAL_AGENTS } from '../data/initialLeads';
import { ArrowRight, ArrowLeft, Droplet, ChevronRight } from 'lucide-react';

interface PipelineKanbanProps {
  leads: Lead[];
  onSelectLead: (lead: Lead) => void;
  onUpdateLeadStatus: (leadId: string, newStatus: LeadState) => void;
}

export default function PipelineKanban({ leads, onSelectLead, onUpdateLeadStatus }: PipelineKanbanProps) {
  
  // Group leads by status
  const leadsByStatus = PIPELINE_STAGES.reduce((acc, stage) => {
    acc[stage.id] = leads.filter((l) => l.estado === stage.id);
    return acc;
  }, {} as Record<LeadState, Lead[]>);

  const getAgentColor = (agentId: string) => {
    const agent = INITIAL_AGENTS.find((a) => a.id === agentId);
    return agent ? agent.color : '#cbd5e1';
  };

  const getAgentInitials = (agentId: string) => {
    const agent = INITIAL_AGENTS.find((a) => a.id === agentId);
    if (!agent) return 'NA';
    return agent.name.split(' ').map((n) => n[0]).join('');
  };

  const handleMoveStatus = (leadId: string, currentStatus: LeadState, direction: 'forward' | 'backward') => {
    const currentIndex = PIPELINE_STAGES.findIndex((s) => s.id === currentStatus);
    let nextIndex = currentIndex;

    if (direction === 'forward' && currentIndex < PIPELINE_STAGES.length - 1) {
      nextIndex = currentIndex + 1;
    } else if (direction === 'backward' && currentIndex > 0) {
      nextIndex = currentIndex - 1;
    }

    if (nextIndex !== currentIndex) {
      onUpdateLeadStatus(leadId, PIPELINE_STAGES[nextIndex].id);
    }
  };

  // Compute stats per column
  const getStageTotals = (stageId: LeadState) => {
    const stageLeads = leadsByStatus[stageId] || [];
    const totalWater = stageLeads.reduce((sum, l) => sum + l.m3Proposed, 0);
    return {
      count: stageLeads.length,
      water: totalWater
    };
  };

  return (
    <div className="space-y-6 animate-fade-in text-slate-800">
      
      {/* Intro info bar */}
      <div className="bg-white p-5 border border-slate-200 rounded-xl flex flex-col md:flex-row md:items-center justify-between gap-4 shadow-sm">
        <div>
          <h2 className="text-xl font-bold text-ril-black tracking-tight">Monitoreo del Flujo del Análisis Territorial</h2>
          <p className="text-xs text-slate-500 mt-1">
            Mueve los municipios a través de cada fase del ciclo de evaluación hídrica institucional.
          </p>
        </div>
        <div className="flex items-center gap-4 text-xs font-semibold text-slate-500">
          <div className="flex items-center gap-2">
            <span className="w-3.5 h-3.5 bg-purple-100 border border-purple-300 rounded-full"></span>
            <span>M. Metropolitana</span>
          </div>
          <div className="flex items-center gap-2">
            <span className="w-3.5 h-3.5 bg-indigo-100 border border-indigo-300 rounded-full"></span>
            <span>Región de Valparaíso</span>
          </div>
        </div>
      </div>

      {/* Kanban Grid Container */}
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-6 gap-4 items-start overflow-x-auto pb-4">
        {PIPELINE_STAGES.map((stage) => {
          const stageLeads = leadsByStatus[stage.id] || [];
          const stageStats = getStageTotals(stage.id);

          return (
            <div 
              key={stage.id} 
              className="bg-slate-50 border border-slate-200/60 rounded-xl shadow-xs flex-shrink-0 min-w-[280px] overflow-hidden"
            >
              
              {/* Column Title Header */}
              <div className={`p-4 border-t-4 ${stage.borderColor} border-b border-slate-200/80 bg-white`}>
                <div className="flex items-center justify-between">
                  <h3 className="font-bold text-xs uppercase tracking-wider text-ril-black line-clamp-1" title={stage.label}>
                    {stage.label}
                  </h3>
                  <span className={`text-xs px-2.5 py-0.5 font-bold rounded-full ${stage.badgeColor}`}>
                    {stageStats.count}
                  </span>
                </div>
                
                {/* Column small metrics */}
                <div className="mt-2 text-[10px] text-slate-500 font-bold border-t border-slate-100 pt-2 flex items-center justify-between">
                  <span>Volumen Total:</span>
                  <div className="flex items-center gap-1 text-emerald-600">
                    <Droplet className="w-3 h-3" />
                    <span>{stageStats.water.toLocaleString('es-CL')} m³/d</span>
                  </div>
                </div>
              </div>

              {/* Column scrollable cards list */}
              <div 
                className="p-3 space-y-3 max-h-[640px] overflow-y-auto transition-all"
                style={{ minHeight: '150px' }}
              >
                {stageLeads.length > 0 ? (
                  stageLeads.map((lead) => {
                    const isHighStress = lead.estresHidrico.includes('Decreto') || lead.scoreNumeric >= 5;

                    return (
                      <div 
                        key={lead.id}
                        className="bg-white p-4 border border-slate-200 rounded-xl relative group hover:border-ril-blue/50 hover:shadow-md transition-all duration-200 animate-fade-in shadow-xs cursor-pointer"
                        onClick={() => onSelectLead(lead)}
                      >
                        
                        {/* Region/Score Tag line */}
                        <div className="flex items-center justify-between mb-2">
                          <span className={`text-[9px] font-bold px-2 py-0.5 rounded-full uppercase tracking-wide ${
                            lead.region === 'RM' 
                              ? 'bg-purple-100 text-purple-700' 
                              : lead.region === 'Valparaíso'
                                ? 'bg-indigo-100 text-indigo-700'
                                : 'bg-teal-100 text-teal-800'
                          }`}>
                            {lead.region}
                          </span>
                          
                          {/* Score Badge */}
                          <span className={`text-[9px] px-1.5 py-0.5 font-bold border rounded-md ${
                            isHighStress 
                              ? 'bg-red-50 text-red-700 border-red-200' 
                              : 'bg-blue-50 text-blue-700 border-blue-200'
                          }`}>
                            Score: {lead.scoreNumeric}/5
                          </span>
                        </div>

                        {/* Comuna Name */}
                        <h4 className="text-sm font-bold text-ril-black group-hover:text-ril-blue transition-colors leading-normal mb-1.5">
                          {lead.comuna}
                        </h4>

                        {/* Mayor & Environmental Director */}
                        <div className="text-[10px] text-slate-500 mb-2.5 space-y-0.5">
                          <div><span className="font-semibold text-slate-700">Alcalde:</span> {lead.alcalde || 'Por confirmar'}</div>
                          {lead.dirMedioAmbiente && lead.dirMedioAmbiente !== "Por confirmar" && (
                            <div className="truncate"><span className="font-semibold text-slate-700">DMA:</span> {lead.dirMedioAmbiente}</div>
                          )}
                        </div>
 
                        {/* Hydrological opportunities / Pain summaries */}
                        <div className="text-[10px] p-2 bg-slate-50 border border-slate-100 rounded-lg mb-2.5 leading-snug">
                          <p className="text-red-700 font-semibold mb-1 truncate" title={lead.estresHidrico}>
                            ⚠️ {lead.estresHidrico}
                          </p>
                          <p className="text-slate-500 line-clamp-2" title={lead.oportunidad}>
                            {lead.oportunidad}
                          </p>
                        </div>
 
                        {/* Proposal volumes and monetary terms - Strictly non-financial */}
                        <div className="flex items-center justify-between text-[11px] text-slate-500 font-sans border-t border-slate-100 pt-2 mb-3">
                          <span className="text-[10px] uppercase font-bold text-slate-400">Tasa Reutilización</span>
                          <span className="flex items-center gap-1 font-bold text-emerald-600" title="Caudal Reutilizado">
                            <Droplet className="w-3 h-3 text-emerald-500" />
                            {lead.m3Proposed} m³/d
                          </span>
                        </div>
 
                        {/* Card bottom actions */}
                        <div className="flex items-center justify-between border-t border-slate-100 pt-2.5 bg-white">
                          
                          {/* Agent Initials Tag for territorial analyst */}
                          <div 
                            className="w-5.5 h-5.5 rounded-full flex items-center justify-center text-[9px] font-bold text-white shadow-xs"
                            style={{ backgroundColor: getAgentColor(lead.assignedAgentId) }}
                            title={`Analista Asignado: ${INITIAL_AGENTS.find(a => a.id === lead.assignedAgentId)?.name}`}
                          >
                            {getAgentInitials(lead.assignedAgentId)}
                          </div>
 
                          {/* Navigation commands */}
                          <div className="flex items-center gap-1" onClick={(e) => e.stopPropagation()}>
                            {/* Card Details trigger */}
                            <button
                              onClick={() => onSelectLead(lead)}
                              className="px-2 py-1 text-[9.5px] font-bold text-ril-blue hover:underline cursor-pointer flex items-center gap-0.5"
                            >
                              <span>Ver Ficha</span>
                              <ChevronRight className="w-3 h-3" />
                            </button>
 
                            {/* Move left */}
                            <button 
                              onClick={() => handleMoveStatus(lead.id, lead.estado, 'backward')}
                              disabled={stage.id === 'POR_PROSPECTAR'}
                              className="p-1 px-1.5 border border-slate-200 hover:bg-slate-50 rounded-lg disabled:opacity-30 disabled:pointer-events-none cursor-pointer hover:border-slate-350 transition-all font-bold"
                              title="Retroceder Fase"
                            >
                              <ArrowLeft className="w-3 h-3 text-slate-500" />
                            </button>
 
                            {/* Move right */}
                            <button 
                              onClick={() => handleMoveStatus(lead.id, lead.estado, 'forward')}
                              disabled={stage.id === 'CERRADO_PERDIDO'}
                              className="p-1 px-1.5 border border-slate-200 hover:bg-slate-50 rounded-lg disabled:opacity-30 disabled:pointer-events-none cursor-pointer hover:border-slate-350 transition-all font-bold"
                              title="Avanzar Fase"
                            >
                              <ArrowRight className="w-3 h-3 text-slate-500" />
                            </button>
                          </div>
 
                        </div>
 
                      </div>
                    );
                  })
                ) : (
                  <div className="py-8 text-center text-[11px] text-slate-400 font-medium italic border border-dashed border-slate-200 bg-slate-55/40 rounded-xl">
                    Vacío
                  </div>
                )}
              </div>

            </div>
          );
        })}
      </div>

    </div>
  );
}
