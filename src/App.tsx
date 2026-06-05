import React, { useState, useEffect } from 'react';
import Sidebar from './components/Sidebar';
import StatsGrid from './components/StatsGrid';
import DatabaseGrid from './components/DatabaseGrid';
import PipelineKanban from './components/PipelineKanban';
import LeadDetailsModal from './components/LeadDetailsModal';
import ImportLeadsModal from './components/ImportLeadsModal';
import { Lead, LeadState, InteractionLog } from './types';
import { getInitialLeads } from './data/initialLeads';
import { 
  CheckCircle2, AlertCircle, ShieldCheck, Mail
} from 'lucide-react';

export default function App() {
  const [currentTab, setCurrentTab] = useState<string>('dashboard');
  const [selectedLead, setSelectedLead] = useState<Lead | null>(null);
  const [showImportModal, setShowImportModal] = useState(false);
  const [theme, setTheme] = useState<'light' | 'dark'>('light');

  const [leads, setLeads] = useState<Lead[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  // Fetch leads from Cloudflare D1 via Vercel API
  useEffect(() => {
    fetch('/api/leads')
      .then((res) => {
        if (!res.ok) throw new Error('Error al cargar leads desde el servidor');
        return res.json();
      })
      .then((data) => {
        setLeads(data.leads || []);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setError(err.message);
        setLoading(false);
      });
  }, []);

  // Handle lead select
  const handleSelectLead = (lead: Lead) => {
    const freshLead = leads.find((l) => l.id === lead.id) || lead;
    setSelectedLead(freshLead);
  };

  // State evolution updating
  const handleUpdateLeadStatus = (leadId: string, newStatus: LeadState) => {
    const date = new Date();
    const timestamp = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}`;
    
    const newInteraction = {
      type: 'status_change' as const,
      summary: `Fase de análisis modificada`,
      details: `La etapa avanzó a "${newStatus}".`,
      agentName: 'Consola Automática'
    };

    // Optimistic UI update
    setLeads((prevLeads) =>
      prevLeads.map((lead) => {
        if (lead.id === leadId) {
          return {
            ...lead,
            estado: newStatus,
            lastContactDate: timestamp,
            interactions: [
              ...lead.interactions,
              {
                id: `sys-status-${Date.now()}`,
                ...newInteraction,
                date: timestamp
              }
            ]
          };
        }
        return lead;
      })
    );

    // Persist to D1
    fetch(`/api/leads/${leadId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        estado: newStatus,
        lastContactDate: timestamp,
        interaction: newInteraction
      })
    }).catch(err => console.error('Error updating status in DB:', err));
  };

  // Changing proposed water volume or budget
  const handleUpdateLeadCaudalAndValue = (leadId: string, m3: number, value: number) => {
    // Optimistic UI update
    setLeads((prevLeads) =>
      prevLeads.map((lead) => {
        if (lead.id === leadId) {
          return {
            ...lead,
            m3Proposed: m3,
            contractValue: value
          };
        }
        return lead;
      })
    );

    // Persist to D1
    fetch(`/api/leads/${leadId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        m3Proposed: m3,
        contractValue: value
      })
    }).catch(err => console.error('Error updating values in DB:', err));
  };

  // Adding manual comments or call registrations
  const handleAddInteraction = (leadId: string, interaction: Omit<InteractionLog, 'id' | 'date'>) => {
    const date = new Date();
    const timestamp = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}`;

    const newLog: InteractionLog = {
      ...interaction,
      id: `int-added-${Date.now()}`,
      date: timestamp
    };

    // Optimistic UI update
    setLeads((prevLeads) =>
      prevLeads.map((lead) => {
        if (lead.id === leadId) {
          return {
            ...lead,
            lastContactDate: timestamp,
            interactions: [...lead.interactions, newLog]
          };
        }
        return lead;
      })
    );

    // Persist to D1
    fetch(`/api/leads/${leadId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        lastContactDate: timestamp,
        interaction
      })
    }).catch(err => console.error('Error adding interaction to DB:', err));
  };

  // Bulk or single importing
  const handleImportLeads = async (newLeads: Omit<Lead, 'id' | 'interactions'>[]) => {
    const timestamp = '2026-06-05 15:00';
    const formattedLeads: Lead[] = newLeads.map((lead, idx) => ({
      ...lead,
      id: `imported-lead-${Date.now()}-${idx}`,
      interactions: [
        {
          id: `sys-import-${Date.now()}-${idx}`,
          type: 'system',
          summary: 'Municipio Importado Estructuralmente',
          details: 'Se dio de alta el contacto municipal con dolores y oportunidades hídricas asociadas.',
          date: timestamp,
          agentName: 'Sistema'
        }
      ]
    }));

    // Optimistic UI update
    setLeads((prev) => [...prev, ...formattedLeads]);

    // Persist to D1 (Parallel requests)
    try {
      await Promise.all(
        formattedLeads.map((lead) =>
          fetch('/api/leads', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(lead),
          })
        )
      );
    } catch (err) {
      console.error('Error saving imported leads to DB:', err);
    }
  };

  return (
    <div className={`min-h-screen font-sans flex flex-col md:flex-row ${theme === 'dark' ? 'bg-[#0B1329] text-white dark' : 'bg-[#F3F7FA] text-ril-black'}`}>
      
      {/* Brand Sidebar (Vertical left-side layout) */}
      <Sidebar 
        currentTab={currentTab} 
        setCurrentTab={setCurrentTab} 
      />

      {/* Main Content Pane */}
      <div className="flex-1 flex flex-col overflow-x-hidden min-w-0">
        
        {/* Upper Selection Bar: Live connection status & Light/Dark Theme selector (No DB active selectors) */}
        <div className={`border-b ${theme === 'dark' ? 'bg-[#121E36] border-slate-805' : 'bg-white border-slate-200'} px-6 py-3.5 flex items-center justify-between gap-4 shadow-xs transition-all`}>
          <div className="flex items-center gap-2">
            <span className="flex h-2.5 w-2.5 relative">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500"></span>
            </span>
            <span className={`text-[11px] font-extrabold tracking-wider uppercase ${theme === 'dark' ? 'text-zinc-400' : 'text-slate-600'}`}>
              Base de Datos: 82 Comunas Cargadas (Grupo 1 & Grupo 2)
            </span>
          </div>

          <div className="flex items-center gap-2">
            <span className={`text-[10px] uppercase font-bold tracking-wider ${theme === 'dark' ? 'text-zinc-400' : 'text-slate-500'}`}>Esquema Visual:</span>
            <div className="flex items-center gap-1 bg-slate-100 dark:bg-slate-800 p-1 rounded-lg border border-slate-200 dark:border-slate-700">
              <button
                onClick={() => setTheme('light')}
                className={`px-3 py-1 text-[10px] font-sans font-extrabold uppercase tracking-widest cursor-pointer transition-all ${
                  theme === 'light'
                    ? 'bg-white text-slate-905 shadow-xs'
                    : 'text-slate-450 hover:text-slate-800'
                }`}
              >
                ☀️ Clara
              </button>
              <button
                onClick={() => setTheme('dark')}
                className={`px-3 py-1 text-[10px] font-sans font-extrabold uppercase tracking-widest cursor-pointer transition-all ${
                  theme === 'dark'
                    ? 'bg-slate-900 text-white shadow-xs'
                    : 'text-slate-400 hover:text-slate-200'
                }`}
              >
                🌙 Oscura
              </button>
            </div>
          </div>
        </div>

        <main className="flex-1 w-full p-4 md:p-6 space-y-6 max-w-7xl mx-auto">
          {loading ? (
            <div className="flex flex-col items-center justify-center py-20 space-y-4">
              <div className="w-12 h-12 border-4 border-ril-blue border-t-transparent rounded-full animate-spin"></div>
              <p className="text-sm font-semibold text-slate-500 dark:text-slate-400">
                Cargando leads desde Cloudflare D1...
              </p>
            </div>
          ) : error ? (
            <div className="p-6 bg-red-50 dark:bg-red-950/20 border border-red-200 dark:border-red-900 rounded-lg text-center space-y-3">
              <AlertCircle className="w-10 h-10 text-red-500 mx-auto" />
              <h3 className="font-bold text-red-800 dark:text-red-300">Error de Conexión</h3>
              <p className="text-xs text-red-600 dark:text-red-400">{error}</p>
              <button 
                onClick={() => window.location.reload()} 
                className="px-4 py-2 bg-red-600 hover:bg-red-700 text-white text-xs font-bold uppercase tracking-wider rounded-lg transition-all"
              >
                Reintentar
              </button>
            </div>
          ) : (
            <>
              {/* TAB 1: DASHBOARD & REALTIME ANALYTICS */}
              {currentTab === 'dashboard' && (
                <div className="space-y-6 animate-fade-in animate-duration-150">
                  
                  {/* Quick Introduction Bar */}
                  <div className="bg-white dark:bg-[#121E36] p-6 border border-gray-200 dark:border-slate-800">
              <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div className="space-y-1">
                  <span className="text-[10px] bg-ril-lightblue text-ril-darkblue dark:bg-blue-900 dark:text-blue-105 font-bold px-2.5 py-1 uppercase tracking-widest inline-block">
                    CONSORCIO RIL LIGTH
                  </span>
                  <h1 className="text-2xl font-bold text-ril-black dark:text-white uppercase tracking-normal">
                    Consola de Análisis de Base de Datos
                  </h1>
                  <p className="text-xs text-ril-gray dark:text-slate-300 max-w-3xl leading-relaxed">
                    Visualiza y gestiona la base consolidada de municipios hídricamente evaluados. Esta consola está dedicada exclusivamente al diagnóstico institucional de actores clave, gobernadores, municipios, directores de medio ambiente y APRs en la RM, Valparaíso y zonas críticas del territorio.
                  </p>
                </div>

                <div className="flex items-center gap-2 bg-ril-lightblue dark:bg-slate-800 p-3 border border-ril-blue/20 dark:border-slate-705">
                  <ShieldCheck className="w-5 h-5 text-ril-blue dark:text-blue-400" />
                  <div className="text-[11px] leading-tight text-ril-darkblue dark:text-slate-350">
                    <span className="font-bold block">Gestión Hídrica Consolidada</span>
                    <span>Análisis integral de actores locales</span>
                  </div>
                </div>
              </div>
            </div>

            {/* Live Metrics Grid */}
            <StatsGrid leads={leads} />

            {/* Side-by-side: Quick Leads alerts & Ril Ligth overview */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              
              {/* Alert leads (High stress / priority) */}
              <div className="bg-white dark:bg-[#121E36] p-6 border border-gray-200 dark:border-slate-800 space-y-4 lg:col-span-2">
                <div className="flex items-center justify-between border-b border-gray-150 dark:border-slate-800 pb-2">
                  <h3 className="font-bold text-xs uppercase tracking-wider text-ril-darkblue dark:text-white">
                    Prioridades de Diagnóstico (Comunas Críticas sin Contacto Completo)
                  </h3>
                  <span className="text-[10px] text-red-600 dark:text-red-400 font-bold bg-red-50 dark:bg-red-950/40 px-2 py-0.5 uppercase">
                    Estrés Hídrico Alto
                  </span>
                </div>

                <div className="space-y-3 max-h-[380px] overflow-y-auto pr-1">
                  {leads
                    .filter((l) => l.scoreNumeric === 5)
                    .slice(0, 6)
                    .map((lead) => (
                      <div 
                        key={lead.id}
                        onClick={() => handleSelectLead(lead)}
                        className="p-3 bg-red-50/20 dark:bg-red-950/10 hover:bg-ril-blue/5 dark:hover:bg-slate-800 border border-red-100 dark:border-red-900 flex items-start justify-between cursor-pointer transition-all"
                      >
                        <div className="space-y-1">
                          <div className="flex items-center gap-1.5">
                            <span className="font-bold text-xs text-slate-900 dark:text-white">{lead.comuna} ({lead.region})</span>
                            <span className="bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200 text-[9px] font-bold px-1.5 py-0.5 uppercase">
                              {lead.score}
                            </span>
                          </div>
                          <p className="text-[11px] text-slate-500 dark:text-slate-400 line-clamp-1">
                            <strong>Dolor Clave:</strong> {lead.dolorHidrico}
                          </p>
                          <p className="text-[10px] text-ril-blue dark:text-blue-300 font-semibold italic">
                            💡 Oportunidad: {lead.oportunidad}
                          </p>
                        </div>
                        
                        <button className="px-2.5 py-1 bg-white dark:bg-slate-800 hover:bg-ril-blue hover:text-white dark:hover:bg-blue-700 border border-gray-200 dark:border-slate-700 text-[10px] font-bold uppercase transition-all shrink-0">
                          Ver Ficha
                        </button>
                      </div>
                    ))}
                </div>
              </div>

              {/* Ril Ligth Institutional Overview */}
              <div className="bg-ril-black p-6 border border-white/5 text-white flex flex-col justify-between space-y-6 rounded-lg">
                <div className="space-y-4">
                  <h3 className="font-bold text-xs uppercase tracking-widest text-ril-blue border-b border-white/10 pb-2">
                    Línea Hídrica de Ril Ligth
                  </h3>
                  
                  <div className="space-y-3.5 text-xs text-gray-300 leading-relaxed">
                    <div className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                      <p>
                        <strong>Comprensión del Territorio:</strong> Fomentamos el levantamiento técnico para estructurar soluciones reales frente a decretos de escasez.
                      </p>
                    </div>

                    <div className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                      <p>
                        <strong>Diagnóstico Multinivel:</strong> Interactuamos coordinadamente con Alcaldes, DMA, SECPLAs y Gobernadores para mapear las cuencas críticas.
                      </p>
                    </div>

                    <div className="flex items-start gap-2">
                      <CheckCircle2 className="w-4 h-4 text-emerald-500 shrink-0 mt-0.5" />
                      <p>
                        <strong>Resiliencia ESG:</strong> Conectamos las APRs rurales con fuentes alternativas, asegurando la sustentabilidad para las comunidades locales.
                      </p>
                    </div>
                  </div>
                </div>

                <div className="bg-white/5 p-3.5 border border-white/10 space-y-1">
                  <span className="text-[9px] uppercase tracking-widest text-[#2E8B57] font-bold">Consenso Colectivo</span>
                  <p className="text-xs font-bold text-white italic">"El agua es un recurso comunitario que exige una vinculación integrada de todos los actores locales."</p>
                </div>
              </div>

            </div>

          </div>
        )}

        {/* TAB 2: MUNICIPLES DATABASE GRID */}
        {currentTab === 'database' && (
          <DatabaseGrid 
            leads={leads} 
            onSelectLead={handleSelectLead} 
            onOpenImportModal={() => setShowImportModal(true)} 
          />
        )}

        {/* TAB 3: PIPELINE EVOLUTION BOARD */}
        {currentTab === 'pipeline' && (
          <PipelineKanban 
            leads={leads} 
            onSelectLead={handleSelectLead} 
            onUpdateLeadStatus={handleUpdateLeadStatus} 
          />
        )}
            </>
          )}
        </main>

      {/* FOOTER */}
      <footer className="mt-12 bg-ril-black text-white px-6 py-8 border-t border-white/10 font-sans text-xs">
        <div className="max-w-7xl mx-auto flex flex-col md:flex-row justify-between gap-6 leading-relaxed text-gray-400">
          <div className="space-y-2">
            <h4 className="font-bold text-white uppercase tracking-wider">Consorcio Ril Ligth S.A.</h4>
            <p>Especialistas en ingeniería civil, diagnóstico municipal y resiliencia hídrica territorial.</p>
            <p>Dirección: Pintor Cicarelli 585, San Joaquín, Santiago, Chile.</p>
          </div>
          <div className="space-y-1 md:text-right">
            <p>Contacto Mesa de Ayuda Territorial: <strong className="text-white">+56 22 556 7311</strong></p>
            <p>Casilla institucional: <strong className="text-white">contacto@rilligth.cl</strong></p>
            <p className="text-[10px] text-gray-500 pt-2">© 2026 Consorcio Ril Ligth S.A. Todos los derechos reservados. Cumplimiento DS 90/2000.</p>
          </div>
        </div>
      </footer>

      </div> {/* End Main Content Pane */}

      {/* MODAL: Lead Details summary Side-drawer */}
      {selectedLead && (
        <LeadDetailsModal 
          lead={leads.find((l) => l.id === selectedLead.id) || selectedLead} 
          onClose={() => setSelectedLead(null)} 
          onUpdateLeadStatus={handleUpdateLeadStatus}
          onAddInteraction={handleAddInteraction}
          onUpdateLeadCaudalAndValue={handleUpdateLeadCaudalAndValue}
        />
      )}

      {/* MODAL: Import new lead */}
      {showImportModal && (
        <ImportLeadsModal 
          onClose={() => setShowImportModal(false)} 
          onImportLeads={handleImportLeads}
          currentCount={leads.length}
        />
      )}

    </div>
  );
}
