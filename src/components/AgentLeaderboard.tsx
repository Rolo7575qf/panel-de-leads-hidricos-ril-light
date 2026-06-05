import React, { useState } from 'react';
import { Lead } from '../types';
import { INITIAL_AGENTS } from '../data/initialLeads';
import { Award, TrendingUp, Droplet, CheckCircle, BarChart3, Star, Download, Mail, CheckCircle2 } from 'lucide-react';

interface AgentLeaderboardProps {
  leads: Lead[];
}

export default function AgentLeaderboard({ leads }: AgentLeaderboardProps) {
  const [selectedMetric, setSelectedMetric] = useState<'sales' | 'volume' | 'conversion'>('sales');

  // Compute live statistics for each sales agent based on the actual leads state
  const agentPerformanceList = INITIAL_AGENTS.map((agent) => {
    const agentLeads = leads.filter((l) => l.assignedAgentId === agent.id);
    const assignedCount = agentLeads.length;
    const wonLeads = agentLeads.filter((l) => l.estado === 'CERRADO_GANADO');
    const wonCount = wonLeads.length;
    const lostCount = agentLeads.filter((l) => l.estado === 'CERRADO_PERDIDO').length;
    const activeCount = assignedCount - wonCount - lostCount;

    const pipelineCount = agentLeads.filter(
      (l) => l.estado === 'EN_NEGOCIACION' || l.estado === 'PROPUESTA_ENVIADA'
    ).length;

    // Financial totals
    const totalWonContractValue = wonLeads.reduce((sum, l) => sum + l.contractValue, 0);
    const totalProposedCaudal = agentLeads.reduce((sum, l) => sum + l.m3Proposed, 0);

    // Conversion rate
    const conversionRate = assignedCount > 0 ? (wonCount / assignedCount) * 100 : 0;

    // Dynamic performance index out of 100
    // Weighted combination of won deals (40%), conversion rate (30%), active deals (20%), proposed volume (10%)
    const performanceScore = Math.min(
      Math.round(
        (wonCount * 12) + 
        (conversionRate * 0.8) + 
        (pipelineCount * 5) + 
        (totalProposedCaudal * 0.02)
      ), 
      100
    ) || 50;

    return {
      ...agent,
      leadsAssignedCount: assignedCount,
      wonCount,
      pipelineCount,
      totalWonContractValue,
      totalProposedCaudal,
      conversionRate,
      performanceScore
    };
  }).sort((a, b) => b.totalWonContractValue - a.totalWonContractValue);

  // Totals for summary
  const totalWonValue = agentPerformanceList.reduce((sum, a) => sum + a.totalWonContractValue, 0);
  const totalWaterProposed = agentPerformanceList.reduce((sum, a) => sum + a.totalProposedCaudal, 0);

  const maxSales = Math.max(...agentPerformanceList.map(a => a.totalWonContractValue), 1000);
  const maxWater = Math.max(...agentPerformanceList.map(a => a.totalProposedCaudal), 1);
  const maxConversion = Math.max(...agentPerformanceList.map(a => a.conversionRate), 1);

  return (
    <div className="space-y-6 animate-fade-in">
      
      {/* Page Header info bar */}
      <div className="bg-white p-5 border border-slate-200 rounded-xl flex flex-col md:flex-row md:items-center justify-between gap-4 shadow-sm">
        <div>
          <h2 className="text-xl font-bold text-ril-black tracking-tight">Reporte de Desempeño Ejecutivo Comercial</h2>
          <p className="text-xs text-slate-500 mt-1">
            Métricas de conversión, previsión monetaria B.O.T, y cubicación de agua recirculada por agente comercial de Ril Ligth.
          </p>
        </div>
        <div className="flex bg-slate-100 p-1 border border-slate-250/60 rounded-xl self-start md:self-auto shadow-xs">
          <button
            onClick={() => setSelectedMetric('sales')}
            className={`px-3 py-1.5 text-xs font-bold uppercase transition-all duration-200 rounded-lg cursor-pointer ${
              selectedMetric === 'sales' ? 'bg-white text-ril-black shadow-sm' : 'text-slate-500 hover:text-slate-800'
            }`}
          >
            Ventas (BOT)
          </button>
          <button
            onClick={() => setSelectedMetric('volume')}
            className={`px-3 py-1.5 text-xs font-bold uppercase transition-all duration-200 rounded-lg cursor-pointer ${
              selectedMetric === 'volume' ? 'bg-white text-ril-black shadow-sm' : 'text-slate-500 hover:text-slate-800'
            }`}
          >
            Volumen m³
          </button>
          <button
            onClick={() => setSelectedMetric('conversion')}
            className={`px-3 py-1.5 text-xs font-bold uppercase transition-all duration-200 rounded-lg cursor-pointer ${
              selectedMetric === 'conversion' ? 'bg-white text-ril-black shadow-sm' : 'text-slate-500 hover:text-slate-800'
            }`}
          >
            Tasa Conversión
          </button>
        </div>
      </div>

      {/* Grid comparing Agents performance */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        
        {/* Leaderboard Chart & Visual Indicators (using SVG & custom bars for total accuracy) */}
        <div className="bg-white p-6 border border-slate-200 rounded-xl lg:col-span-2 space-y-6 shadow-sm">
          <h3 className="font-bold text-xs uppercase tracking-wider text-slate-500 border-b border-slate-150 pb-2">
            Análisis Comparativo Directo
          </h3>

          <div className="space-y-6">
            {agentPerformanceList.map((agent) => {
              // Calculate percent fill based on chosen metric
              let fillPercent = 0;
              let metricLabel = '';
              let metricValueColor = '';

              if (selectedMetric === 'sales') {
                fillPercent = (agent.totalWonContractValue / maxSales) * 100;
                metricLabel = `USD ${agent.totalWonContractValue.toLocaleString('es-CL')} Adjudicados`;
                metricValueColor = 'text-ril-blue';
              } else if (selectedMetric === 'volume') {
                fillPercent = (agent.totalProposedCaudal / maxWater) * 100;
                metricLabel = `${agent.totalProposedCaudal.toLocaleString('es-CL')} m³/día Recirculando`;
                metricValueColor = 'text-emerald-600';
              } else {
                fillPercent = (agent.conversionRate / maxConversion) * 100;
                metricLabel = `${agent.conversionRate.toFixed(1)}% Tasa Ganado`;
                metricValueColor = 'text-ril-black';
              }

              return (
                <div key={agent.id} className="space-y-2.5">
                  <div className="flex items-center justify-between text-xs font-bold text-ril-black">
                    <div className="flex items-center gap-2.5">
                      <img 
                        src={agent.avatar} 
                        alt={agent.name} 
                        className="w-8 h-8 rounded-full object-cover border-2 border-slate-100 shadow-sm" 
                      />
                      <div>
                        <span className="font-bold text-slate-900">{agent.name}</span>
                        <span className="text-[10px] text-slate-500 block font-semibold leading-none mt-0.5">{agent.role}</span>
                      </div>
                    </div>
                    <span className={`font-extrabold text-xs ${metricValueColor}`}>{metricLabel}</span>
                  </div>

                  {/* Progressive Bar render */}
                  <div className="w-full bg-slate-100 h-7 relative rounded-lg shadow-inner overflow-hidden border border-slate-200/40">
                    <div 
                      className={`h-full transition-all duration-500 ease-out flex items-center pl-3 rounded-l-lg ${
                        selectedMetric === 'sales' 
                          ? 'bg-ril-blue shadow-md' 
                          : selectedMetric === 'volume' 
                            ? 'bg-emerald-500 shadow-md' 
                            : 'bg-slate-800 shadow-md'
                      }`}
                      style={{ width: `${Math.max(fillPercent, 5)}%` }}
                    >
                      {fillPercent > 12 && (
                        <span className="text-[10px] text-white font-extrabold uppercase tracking-wider">
                          P-INDEX: {agent.performanceScore}%
                        </span>
                      )}
                    </div>
                    {fillPercent <= 12 && (
                      <span className="absolute left-3 top-1.5 text-[10px] text-slate-500 font-extrabold">
                        P-INDEX: {agent.performanceScore}%
                      </span>
                    )}
                  </div>
                </div>
              );
            })}
          </div>

          <div className="p-4 bg-slate-50 border border-slate-200 rounded-xl text-[11px] text-slate-500 leading-relaxed mt-4">
            * <strong>P-INDEX (Performance Index):</strong> Fórmula institucional ponderada de Ril Ligth que mide la efectividad de cierre, cobertura e integración de tecnologías de reuso con municipalidades.
          </div>
        </div>

        {/* Executive Scorecards sidebar */}
        <div className="space-y-4">
          <h3 className="font-bold text-xs uppercase tracking-wider text-slate-500 border-b border-slate-150 pb-2">
            Fichas de Desempeño
          </h3>

          {agentPerformanceList.map((agent, idx) => {
            return (
              <div 
                key={agent.id}
                className="bg-white p-5 border border-slate-200 hover:border-ril-blue/30 hover:shadow-md transition-all duration-300 rounded-xl shadow-xs relative overflow-hidden flex gap-4 items-start"
              >
                {/* Ranking number badge */}
                <span className="absolute top-0 right-0 bg-slate-900 rounded-bl-xl text-white font-extrabold text-[10px] uppercase px-3 py-1 select-none tracking-wider">
                  #{idx + 1} Rank
                </span>

                <img 
                  src={agent.avatar} 
                  alt={agent.name} 
                  className="w-12 h-12 rounded-full object-cover border-2 shadow-sm"
                  style={{ borderColor: agent.color }}
                />

                <div className="flex-1 space-y-2">
                  <div>
                    <h4 className="text-sm font-bold text-slate-900">{agent.name}</h4>
                    <p className="text-[10px] text-slate-500 uppercase tracking-wider font-bold">{agent.role}</p>
                  </div>

                  {/* Miniature specs columns */}
                  <div className="grid grid-cols-2 gap-2 text-[10.5px] border-t border-slate-100 pt-2 text-slate-500">
                    <div>
                      <span className="block text-[9px] text-slate-400 uppercase font-bold tracking-wider">Leads Asignados</span>
                      <strong className="text-slate-900">{agent.leadsAssignedCount}</strong>
                    </div>
                    <div>
                      <span className="block text-[9px] text-slate-400 uppercase font-bold tracking-wider">Adjudicados (Won)</span>
                      <strong className="text-emerald-600 font-bold">{agent.wonCount} Cerrados</strong>
                    </div>
                    <div>
                      <span className="block text-[9px] text-slate-400 uppercase font-bold tracking-wider">Propuestas Activas</span>
                      <strong className="text-ril-blue">{agent.pipelineCount} en revisión</strong>
                    </div>
                    <div>
                      <span className="block text-[9px] text-slate-400 uppercase font-bold tracking-wider">Calificación Cliente</span>
                      <span className="font-bold text-amber-500 flex items-center gap-0.5">
                        <Star className="w-3 h-3 fill-amber-500 inline" />
                        {agent.rating}
                      </span>
                    </div>
                  </div>

                  {/* Small progress meter of conversions */}
                  <div className="w-full bg-slate-100 h-1.5 rounded-full overflow-hidden mt-1">
                    <div 
                      className="bg-emerald-500 h-full rounded-full"
                      style={{ width: `${agent.conversionRate}%` }}
                    />
                  </div>
                </div>
              </div>
            );
          })}
        </div>

      </div>

    </div>
  );
}
