import React, { useState } from 'react';
import { Lead, LeadState, InteractionLog } from '../types';
import { INITIAL_AGENTS, PIPELINE_STAGES } from '../data/initialLeads';
import { 
  X, Mail, Phone, Calendar, User, TrendingUp, Droplet, 
  MapPin, ShieldAlert, Sparkles, Send, Copy, Check, FileText, PlusCircle 
} from 'lucide-react';

interface LeadDetailsModalProps {
  lead: Lead;
  onClose: () => void;
  onUpdateLeadStatus: (leadId: string, newStatus: LeadState) => void;
  onAddInteraction: (leadId: string, interaction: Omit<InteractionLog, 'id' | 'date'>) => void;
  onUpdateLeadCaudalAndValue: (leadId: string, m3: number, value: number) => void;
}

export default function LeadDetailsModal({ 
  lead, 
  onClose, 
  onUpdateLeadStatus, 
  onAddInteraction,
  onUpdateLeadCaudalAndValue
}: LeadDetailsModalProps) {
  
  const [activeTab, setActiveTab] = useState<'info' | 'timeline' | 'ai'>('info');
  const [newInteractionType, setNewInteractionType] = useState<'email' | 'call' | 'meeting' | 'note'>('email');
  const [newInteractionSummary, setNewInteractionSummary] = useState('');
  const [newInteractionDetails, setNewInteractionDetails] = useState('');
  
  // Quick modifications form states
  const [m3Input, setM3Input] = useState(lead.m3Proposed.toString());
  const [valueInput, setValueInput] = useState(lead.contractValue.toString());

  // AI follow-up generator states
  const [aiTone, setAiTone] = useState<'tecnico' | 'sostenible' | 'comercial'>('tecnico');
  const [aiCustomContext, setAiCustomContext] = useState('');
  const [aiLoading, setAiLoading] = useState(false);
  const [aiMessageResult, setAiMessageResult] = useState('');
  const [aiCopied, setAiCopied] = useState(false);
  const [aiError, setAiError] = useState<string | null>(null);

  const assignedAgent = INITIAL_AGENTS.find((a) => a.id === lead.assignedAgentId) || INITIAL_AGENTS[0];

  const handleStatusChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    onUpdateLeadStatus(lead.id, e.target.value as LeadState);
  };

  const handleAddLog = (e: React.FormEvent) => {
    e.preventDefault();
    if (!newInteractionSummary.trim()) return;

    let mappedType: InteractionLog['type'] = 'system';
    if (newInteractionType === 'email') mappedType = 'email';
    else if (newInteractionType === 'call') mappedType = 'call';
    else if (newInteractionType === 'meeting') mappedType = 'meeting';
    else if (newInteractionType === 'note') mappedType = 'status_change'; // reuse log styling of system update

    onAddInteraction(lead.id, {
      type: mappedType,
      summary: newInteractionSummary,
      details: newInteractionDetails,
      agentName: assignedAgent.name
    });

    setNewInteractionSummary('');
    setNewInteractionDetails('');
  };

  const handleUpdateDealSpecs = () => {
    const valM3 = parseFloat(m3Input) || 0;
    // Strictly preserve 0 contract value to follow non-financial DB constraints
    onUpdateLeadCaudalAndValue(lead.id, valM3, 0);
    // Log as system interaction
    onAddInteraction(lead.id, {
      type: 'system',
      summary: 'Modificación de caudal estimado',
      details: `Se actualizaron los parámetros hídricos del proyecto. Caudal estimado de reuso: ${valM3} m³/día.`,
      agentName: 'Sistema'
    });
  };

  const handleGenerateAIEmail = async () => {
    setAiLoading(true);
    setAiError(null);
    setAiMessageResult('');

    try {
      const response = await fetch('/api/gemini/suggest-followup', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          comuna: lead.comuna,
          region: lead.region,
          alcalde: lead.alcalde,
          dirMedioAmbiente: lead.dirMedioAmbiente,
          dolorHidrico: lead.dolorHidrico,
          oportunidad: lead.oportunidad,
          estresHidrico: lead.estresHidrico,
          tone: aiTone,
          agentName: assignedAgent.name,
          customContext: aiCustomContext
        }),
      });

      const resData = await response.json();

      if (!response.ok) {
        throw new Error(resData.error || 'Error generando el correo.');
      }

      setAiMessageResult(resData.text);
      
      // Auto log AI generation in timeline as copy backup
      onAddInteraction(lead.id, {
        type: 'email',
        summary: `Borrador IA Ril Ligth generado (${aiTone === 'tecnico' ? 'Técnico' : aiTone === 'sostenible' ? 'ESG' : 'Análisis Estructural'})`,
        details: 'Se generó un borrador técnico de vinculación con inteligencia artificial Gemini adaptado a los dolores hídricos del municipio.',
        agentName: 'Gemini Copilot'
      });
    } catch (err: any) {
      console.error(err);
      setAiError(err.message || 'Error al conectar con la API de generación.');
    } finally {
      setAiLoading(false);
    }
  };

  const handleCopyAICode = () => {
    if (!aiMessageResult) return;
    navigator.clipboard.writeText(aiMessageResult);
    setAiCopied(true);
    setTimeout(() => setAiCopied(false), 2000);
  };

  return (
    <div className="fixed inset-0 bg-ril-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4 overflow-y-auto animate-fade-in">
      
      <div className="bg-white w-full max-w-4xl rounded-2xl border border-slate-200 shadow-2xl overflow-hidden flex flex-col my-8 max-h-[90vh]">
        
        {/* Modal Top Bar */}
        <div className="bg-ril-black text-white p-5 flex items-center justify-between border-b border-white/10">
          <div className="flex items-center gap-3">
            <span className="text-[10px] uppercase font-bold tracking-widest px-2.5 py-1 bg-ril-blue text-white font-bold rounded-lg animate-pulse">
              Ficha del Municipio
            </span>
            <h3 className="text-lg font-bold text-white capitalize">
              {lead.comuna} ({lead.region})
            </h3>
          </div>
          <button 
            onClick={onClose}
            className="p-1.5 hover:bg-white/10 transition-colors border border-transparent rounded-lg cursor-pointer"
          >
            <X className="w-5 h-5 text-white" />
          </button>
        </div>

        {/* Modal Info Stats Line (Strictly institutional database identifiers) */}
        <div className="p-4 bg-ril-lightblue border-b border-ril-blue/20 flex flex-wrap xl:items-center justify-between gap-4 text-xs">
          <div className="flex items-center gap-2">
            <MapPin className="w-4 h-4 text-ril-blue" />
            <span className="text-ril-gray font-bold">Gobernador:</span>
            <strong className="text-ril-black">{lead.gobernadorRegional}</strong>
          </div>
          <div className="flex items-center gap-2">
            <Droplet className="w-4 h-4 text-ril-esg" />
            <span className="text-ril-gray font-bold">Diagnóstico Territorial:</span>
            <strong className="text-red-700 font-extrabold">{lead.estresHidrico}</strong>
          </div>
        </div>

        {/* Tabs for Navigation */}
        <div className="flex border-b border-slate-200 bg-slate-50/50 p-1.5 gap-1.5">
          {[
            { id: 'info', label: 'Datos del Municipio y Propuesta', icon: FileText },
            { id: 'timeline', label: 'Registro de Contactos e Historial', icon: Calendar },
            { id: 'ai', label: 'Seguimiento por Correo (IA Gemini)', icon: Sparkles },
          ].map((tab) => {
            const Icon = tab.icon;
            const isActive = activeTab === tab.id;
            return (
              <button
                key={tab.id}
                onClick={() => setActiveTab(tab.id as any)}
                className={`flex-1 flex items-center justify-center gap-2 py-3 px-4 text-xs font-bold uppercase tracking-wider transition-all rounded-lg cursor-pointer ${
                  isActive 
                    ? 'bg-ril-blue text-white shadow-sm scale-[1.01]' 
                    : 'text-slate-500 hover:text-slate-850 hover:bg-slate-100/70'
                }`}
              >
                <Icon className={`w-4 h-4 ${isActive ? 'text-ril-blue' : 'text-gray-400'}`} />
                <span className="hidden sm:inline">{tab.label}</span>
              </button>
            );
          })}
        </div>

        {/* Scrollable Content Pane */}
        <div className="p-6 overflow-y-auto flex-1 max-h-[60vh] bg-white">
          
          {/* TAB 1: INFORMATION */}
          {activeTab === 'info' && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 leading-relaxed divide-y md:divide-y-0 md:divide-x divide-gray-200">
              
              {/* Left Column: Database Fields */}
              <div className="space-y-4 pr-0 md:pr-4">
                <h4 className="text-xs uppercase font-arial-bold tracking-widest text-ril-blue border-b border-gray-100 pb-1">DATOS INSTITUCIONALES</h4>
                
                <div className="space-y-3.5 text-xs">
                  <div>
                    <span className="text-gray-400 font-bold block uppercase text-[10px]">Alcaldía</span>
                    <p className="font-semibold text-ril-black text-sm">{lead.alcalde}</p>
                    <span className="text-ril-blue flex items-center gap-1"><Mail className="w-3.5 h-3.5" /> {lead.emailAlcaldia}</span>
                  </div>

                  <div>
                    <span className="text-gray-400 font-bold block uppercase text-[10px]">Dir. Medio Ambiente (DIMAO)</span>
                    <p className="font-semibold text-ril-black">{lead.dirMedioAmbiente}</p>
                    <span className="text-ril-gray block">Email: {lead.emailMA}</span>
                    <span className="text-[11px] text-ril-blue/80 flex items-center gap-1 mt-0.5"><Phone className="w-3.5 h-3.5" /> Fono MA: {lead.telMA}</span>
                  </div>

                  <div className="bg-gray-50 p-2.5 border border-gray-150">
                    <span className="text-gray-400 font-bold block uppercase text-[10px]">SECPLA</span>
                    <p className="font-semibold text-ril-black">{lead.secplaNombre}</p>
                    <span className="text-ril-gray block">Email: {lead.secplaEmail}</span>
                    <span className="text-ril-gray block">Fono: {lead.secplaFono}</span>
                  </div>

                  <div>
                    <span className="text-gray-400 font-bold block uppercase text-[10px]">Concejal Clave de Comisión Hídrica</span>
                    <p className="font-semibold text-ril-black">{lead.concejalClave}</p>
                    <span className="text-ril-blue">{lead.emailConcejal}</span>
                  </div>

                  <div className="bg-cyan-50/50 p-3 border border-cyan-100">
                    <span className="text-cyan-700 font-bold block uppercase text-[10px] tracking-wide">APR rural / Junta de Vecinos Clave</span>
                    <p className="font-semibold text-ril-black text-[12px]">{lead.aprClave}</p>
                    <span className="text-ril-gray block">Contacto: {lead.contactoApr}</span>
                  </div>
                </div>
              </div>

              {/* Right Column: Water Distress Metrics and Proposed Specs */}
              <div className="space-y-4 pt-4 md:pt-0 pl-0 md:pl-6 space-y-5">
                <h4 className="text-xs uppercase font-arial-bold tracking-widest text-[#2E8B57] border-b border-gray-100 pb-1">ANÁLISIS HÍDRICO TERRITORIAL</h4>

                <div className="space-y-4 text-xs">
                  
                  {/* Pipeline state changer */}
                  <div>
                    <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">Fase de Análisis Actual</label>
                    <select
                      value={lead.estado}
                      onChange={handleStatusChange}
                      className="w-full px-3 py-2.5 border border-slate-300 rounded-lg bg-white text-xs font-bold uppercase focus:outline-none focus:border-ril-blue focus:ring-2 focus:ring-ril-blue/15 transition-all"
                    >
                      {PIPELINE_STAGES.map((s) => (
                        <option key={s.id} value={s.id}>{s.label}</option>
                      ))}
                    </select>
                    <p className="text-[10px] text-slate-400 mt-1.5 font-normal italic">
                      * Modificar esta fase moverá la comuna de columna en el tablero visual de análisis.
                    </p>
                  </div>

                  {/* Water Opp & pain */}
                  <div className="p-4 bg-red-50 border border-red-150 rounded-xl">
                    <span className="font-bold text-red-800 text-[10px] uppercase block mb-1">Dolor Hídrico Local</span>
                    <p className="text-red-900 leading-relaxed text-xs">{lead.dolorHidrico}</p>
                  </div>

                  <div className="p-4 bg-emerald-50 border border-emerald-150 rounded-xl">
                    <span className="font-bold text-emerald-800 text-[10px] uppercase block mb-1">Fórmula Ril Ligth de Oportunidad</span>
                    <p className="text-emerald-950 leading-relaxed font-semibold text-xs">{lead.oportunidad}</p>
                  </div>

                  {/* Pricing and Water Volumen Simulator */}
                  <div className="p-5 bg-slate-50 border border-slate-200 rounded-xl space-y-4">
                    <span className="text-[10.5px] uppercase font-bold text-slate-700 tracking-wider block">Estudio Inicial de Diseño Hídrico</span>
                    
                    <div className="w-full">
                      <label className="text-[9px] uppercase tracking-wide text-slate-500 block font-bold mb-1">DISEÑO CAUDAL REUSO PROPUESTO</label>
                      <div className="relative">
                        <input
                          type="number"
                          value={m3Input}
                          onChange={(e) => setM3Input(e.target.value)}
                          className="w-full pl-3 pr-12 py-2 border border-slate-300 rounded-lg text-xs focus:outline-none font-bold text-slate-800 bg-white"
                        />
                        <span className="absolute right-3 top-2.5 text-[10px] text-slate-400 font-bold">m³/día</span>
                      </div>
                    </div>

                    <button
                      onClick={handleUpdateDealSpecs}
                      className="px-4 py-2.5 bg-slate-900 hover:bg-slate-850 text-white text-[10.5px] font-bold uppercase tracking-wider rounded-lg transition-all w-full cursor-pointer text-center flex items-center justify-center gap-1.5 shadow-sm"
                    >
                      <PlusCircle className="w-3.5 h-3.5" />
                      <span>Guardar Parámetros de Propuesta</span>
                    </button>
                  </div>

                </div>
              </div>

            </div>
          )}

          {/* TAB 2: TIMELINE LOGGING */}
          {activeTab === 'timeline' && (
            <div className="space-y-6 animate-fade-in">
              
              {/* Form to submit interaction */}
              <form onSubmit={handleAddLog} className="p-5 bg-slate-50 border border-slate-200 rounded-xl space-y-3.5">
                <h4 className="text-xs uppercase font-bold tracking-widest text-slate-700">Nuevo Registro de Contacto</h4>
                
                <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
                  <div>
                    <label className="text-[9px] uppercase font-bold text-slate-500 block mb-1">Vía de Contacto</label>
                    <select
                      value={newInteractionType}
                      onChange={(e) => setNewInteractionType(e.target.value as any)}
                      className="w-full p-2 border border-slate-300 rounded-lg text-xs bg-white font-medium focus:outline-none focus:ring-2 focus:ring-ril-blue/15"
                    >
                      <option value="email">📧 Correo Electrónico</option>
                      <option value="call">📞 Llamada Telefónica</option>
                      <option value="meeting">🤝 Reunión Presencial / Virtual</option>
                      <option value="note">✏️ Nota Administrativa / Hito</option>
                    </select>
                  </div>
                  <div className="md:col-span-2">
                    <label className="text-[9px] uppercase font-bold text-slate-500 block mb-1">Resumen del Hito</label>
                    <input
                      type="text"
                      placeholder="Ej. Agendada visita técnica previa en planta..."
                      value={newInteractionSummary}
                      onChange={(e) => setNewInteractionSummary(e.target.value)}
                      className="w-full p-2 border border-slate-300 rounded-lg text-xs focus:outline-none focus:ring-2 focus:ring-ril-blue/15 bg-white font-medium"
                      required
                    />
                  </div>
                </div>

                <div>
                  <label className="text-[9px] uppercase font-bold text-slate-500 block mb-1">Detalle del Registro</label>
                  <textarea
                    rows={2}
                    placeholder="Describe los puntos conversados, objeciones y próximos pasos técnicos..."
                    value={newInteractionDetails}
                    onChange={(e) => setNewInteractionDetails(e.target.value)}
                    className="w-full p-2 border border-slate-300 rounded-lg text-xs focus:outline-none focus:ring-2 focus:ring-ril-blue/15 bg-white font-medium"
                  />
                </div>

                <div className="text-right">
                  <button
                    type="submit"
                    className="px-4 py-2 bg-ril-blue hover:bg-ril-darkblue text-white text-xs font-bold uppercase tracking-wider rounded-lg cursor-pointer inline-flex items-center gap-1.5 transition-all shadow-sm shadow-ril-blue/20 hover:scale-[1.02] active:scale-95"
                  >
                    <Send className="w-3.5 h-3.5" />
                    <span>Guardar en Historial</span>
                  </button>
                </div>
              </form>

              {/* Feed elements */}
              <div className="space-y-4">
                <h4 className="text-xs uppercase font-arial-bold tracking-widest text-ril-blue">Historial Completo</h4>
                
                {lead.interactions.length > 0 ? (
                  <div className="relative border-l border-gray-200 pl-4 ml-2.5 space-y-4">
                    {lead.interactions.map((log) => {
                      return (
                        <div key={log.id} className="relative animate-fade-in">
                          {/* Chronological bullet icon */}
                          <div className={`absolute left-[-23px] top-1.5 w-4 h-4 rounded-full border bg-white flex items-center justify-center ${
                            log.type === 'email' 
                              ? 'border-blue-500 text-blue-500' 
                              : log.type === 'call' 
                                ? 'border-[#2E8B57] text-[#2E8B57]' 
                                : log.type === 'meeting' 
                                  ? 'border-amber-500 text-amber-500' 
                                  : 'border-purple-500 text-purple-500'
                          }`}>
                            <span className="w-1.5 h-1.5 bg-current rounded-full" />
                          </div>

                          <span className="text-[10px] font-mono text-gray-400 font-bold block">{log.date}</span>
                          <div className="mt-1 bg-white p-3 border border-gray-150 shadow-xs">
                            <h5 className="font-bold text-xs text-ril-black flex items-center justify-between">
                              <span>{log.summary}</span>
                              <span className="text-[10px] font-normal text-ril-gray italic">Por: {log.agentName}</span>
                            </h5>
                            {log.details && (
                              <p className="text-[11px] text-ril-gray mt-1 leading-relaxed whitespace-pre-wrap">{log.details}</p>
                            )}
                          </div>
                        </div>
                      );
                    })}
                  </div>
                ) : (
                  <div className="text-center py-6 text-xs text-gray-400 font-normal italic">
                    Aún no hay visitas ni llamadas registradas para este municipio. Use el panel superior para cargar un hito de avance.
                  </div>
                )}
              </div>

            </div>
          )}

          {/* TAB 3: AI FOLLOW-UP GENERATOR (GEMINI) */}
          {activeTab === 'ai' && (
            <div className="space-y-6 animate-fade-in">
              <div className="bg-ril-black p-4 border border-white/5 text-white flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                <div className="flex items-center gap-2.5">
                  <div className="p-2 bg-ril-blue text-white shadow-md">
                    <Sparkles className="w-5 h-5 text-white animate-pulse" />
                  </div>
                  <div>
                    <h4 className="text-sm font-arial-bold uppercase tracking-wide">Redactor de Correspondencia Municipal (IA Gemini)</h4>
                    <p className="text-[10px] text-gray-300">Genera cartas institucionales o correos directos con tecnología de reúso y cumplimiento legislativo.</p>
                  </div>
                </div>
              </div>

              {/* Formulation panel */}
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-xs bg-slate-50 p-5 border border-slate-200 rounded-xl">
                <div>
                  <label className="text-[9px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">Enfoque Técnico de la Solución</label>
                  <select
                    value={aiTone}
                    onChange={(e: any) => setAiTone(e.target.value)}
                    className="w-full p-2 border border-slate-300 rounded-lg bg-white font-semibold focus:outline-none focus:ring-2 focus:ring-ril-blue/15"
                  >
                    <option value="tecnico">🔬 Técnico-Físico: Recirculación UF, RO y NF</option>
                    <option value="sostenible">🌱 Ecológico-ESG: Mitigación Sequía y Riego</option>
                    <option value="comercial">📈 Comercializable: Modelo Financiero B.O.T</option>
                  </select>
                </div>
                
                <div className="md:col-span-2">
                  <label className="text-[9px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">
                    Instrucciones Adicionales o Notas para la Carta (Opcional)
                  </label>
                  <input
                    type="text"
                    placeholder="Ej. Destacar que estuvimos conversando en la última conferencia sanitaria..."
                    value={aiCustomContext}
                    onChange={(e) => setAiCustomContext(e.target.value)}
                    className="w-full p-2 border border-slate-300 rounded-lg bg-white focus:outline-none font-medium text-xs focus:ring-2 focus:ring-ril-blue/15"
                  />
                </div>

                <div className="md:col-span-3 pt-2">
                  <button
                    onClick={handleGenerateAIEmail}
                    disabled={aiLoading}
                    className="px-5 py-3.5 bg-ril-blue hover:bg-ril-darkblue text-white text-xs font-bold uppercase tracking-[0.11em] rounded-lg transition-all w-full cursor-pointer text-center flex items-center justify-center gap-1.5 disabled:opacity-50 hover:scale-[1.01] active:scale-99 shadow-sm"
                  >
                    {aiLoading ? (
                      <>
                        <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                        <span>Analizando datos y dolores del municipio...</span>
                      </>
                    ) : (
                      <>
                        <Sparkles className="w-4 h-4 animate-bounce" />
                        <span>Generar Propuesta formal con IA Gemini</span>
                      </>
                    )}
                  </button>
                </div>
              </div>

              {/* Loading messages display helper */}
              {aiLoading && (
                <div className="p-6 bg-ril-lightblue/20 border border-dashed border-ril-blue/30 text-center space-y-3.5 animate-pulse">
                  <Droplet className="w-8 h-8 text-ril-blue mx-auto animate-bounce" />
                  <div className="space-y-1">
                    <p className="text-xs font-bold text-ril-darkblue">Diseñando Solución de Reúso a la Medida para {lead.comuna}...</p>
                    <p className="text-[10px] text-ril-gray italic">Incorporando pauta corporativa: Cumplimiento DS 90/2000 y DS 46/2021.</p>
                  </div>
                </div>
              )}

              {/* Error displaying */}
              {aiError && (
                <div className="p-4 bg-red-50 text-red-700 text-xs border border-red-200">
                  <p className="font-bold">Error generando correo institucional:</p>
                  <p className="mt-1 font-medium">{aiError}</p>
                </div>
              )}

              {/* AI Draft proposal Output */}
              {aiMessageResult && (
                <div className="space-y-3 animate-fade-in">
                  <div className="flex items-center justify-between border-b border-gray-150 pb-2 bg-white">
                    <span className="text-[10px] font-bold uppercase tracking-wider text-ril-esg flex items-center gap-1">
                      <Check className="w-4 h-4 text-[#2E8B57]" />
                      <span>Propuesta de Comunicación Generada Exitosamente</span>
                    </span>
                    
                    <button
                      onClick={handleCopyAICode}
                      className="px-3.5 py-1.5 bg-slate-900 rounded-lg text-white text-[10px] font-bold uppercase tracking-wider hover:bg-slate-800 transition-all cursor-pointer flex items-center gap-1.5 shadow-sm"
                    >
                      {aiCopied ? (
                        <>
                          <Check className="w-3.5 h-3.5 text-emerald-500" />
                          <span>Copiado</span>
                        </>
                      ) : (
                        <>
                          <Copy className="w-3.5 h-3.5" />
                          <span>Copiar Borrador</span>
                        </>
                      )}
                    </button>
                  </div>

                  {/* Mail visualizer */}
                  <div className="bg-slate-50 border border-slate-200/85 p-6 rounded-xl max-h-[460px] overflow-y-auto">
                    <div className="border border-slate-200 bg-white p-6 rounded-xl shadow-sm font-sans text-xs max-w-2xl mx-auto space-y-4 text-slate-800 leading-relaxed">
                      
                      {/* Fake header representation */}
                      <div className="border-b border-gray-100 pb-3 mb-4 text-[11px] text-gray-500 font-normal space-y-1">
                        <div><strong className="text-ril-black">De:</strong> {assignedAgent.email}</div>
                        <div><strong className="text-ril-black">Para:</strong> {lead.emailAlcaldia}</div>
                        <div><strong className="text-ril-black">Asunto:</strong> Solución Hídrica Integral & Alianza Técnica Economía Circular · Comuna de {lead.comuna}</div>
                      </div>

                      {/* Decoded content */}
                      <div className="whitespace-pre-wrap select-text selection:bg-ril-blue/20">
                        {aiMessageResult}
                      </div>

                    </div>
                  </div>
                </div>
              )}

            </div>
          )}

        </div>

        {/* Modal Buttons Footer (Section 10.1 y 10.2 Spec) */}
        <div className="p-4 bg-slate-50 border-t border-slate-200 flex items-center justify-between">
          <span className="text-[10px] text-slate-500 font-semibold">
            Consorcio Ril Ligth S.A.
          </span>
          <button
            onClick={onClose}
            className="px-5 py-2 bg-white hover:bg-slate-50 text-slate-700 text-xs font-bold uppercase tracking-wider border border-slate-300 rounded-lg cursor-pointer transition-all hover:border-slate-400"
          >
            Cerrar Ficha
          </button>
        </div>

      </div>

    </div>
  );
}
