import React, { useState, useRef } from 'react';
import { Lead, LeadState } from '../types';
import { INITIAL_AGENTS, PIPELINE_STAGES } from '../data/initialLeads';
import { Search, RefreshCw, Plus, Download, Mail, Phone, Eye, ArrowUpDown, Droplet, ChevronLeft, ChevronRight } from 'lucide-react';

interface DatabaseGridProps {
  leads: Lead[];
  onSelectLead: (lead: Lead) => void;
  onOpenImportModal: () => void;
}

export default function DatabaseGrid({ leads, onSelectLead, onOpenImportModal }: DatabaseGridProps) {
  const [searchTerm, setSearchTerm] = useState('');
  const [regionFilter, setRegionFilter] = useState<string>('ALL');
  const [statusFilter, setStatusFilter] = useState<string>('ALL');
  const [comunaFilter, setComunaFilter] = useState<string>('ALL');
  const [actorFilter, setActorFilter] = useState<string>('ALL');
  const [sortBy, setSortBy] = useState<keyof Lead>('n');
  const [sortOrder, setSortOrder] = useState<'asc' | 'desc'>('asc');

  const tableContainerRef = useRef<HTMLDivElement>(null);

  const scrollTable = (direction: 'left' | 'right') => {
    if (tableContainerRef.current) {
      const scrollAmount = 400;
      const targetScroll = tableContainerRef.current.scrollLeft + (direction === 'left' ? -scrollAmount : scrollAmount);
      tableContainerRef.current.scrollTo({
        left: targetScroll,
        behavior: 'smooth'
      });
    }
  };

  // Dynamic Comunas list
  const uniqueComunas = Array.from(new Set(leads.map((l) => l.comuna))).sort();

  // Helper definition of valid/registered contact name
  const isRegistered = (val: string) => {
    if (!val) return false;
    const lower = val.toLowerCase().trim();
    return (
      lower !== 'por confirmar' && 
      lower !== 'pendiente' && 
      lower !== 'no asignado' && 
      lower !== 'por definir' && 
      val !== ''
    );
  };

  // Multi-column search filter incorporating other fields
  const filteredLeads = leads.filter((lead) => {
    const matchesSearch = 
      lead.comuna.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.alcalde.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.dirMedioAmbiente.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.secplaNombre.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.gobernadorRegional.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.concejalClave.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.aprClave.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.dolorHidrico.toLowerCase().includes(searchTerm.toLowerCase()) ||
      lead.oportunidad.toLowerCase().includes(searchTerm.toLowerCase());

    const matchesRegion = regionFilter === 'ALL' || lead.region === regionFilter;
    const matchesStatus = statusFilter === 'ALL' || lead.estado === statusFilter;
    const matchesComuna = comunaFilter === 'ALL' || lead.comuna === comunaFilter;

    // Filter rows by whether the selected actor is registered (if filter is not ALL)
    let matchesActorFilter = true;
    if (actorFilter === 'alcalde') {
      matchesActorFilter = isRegistered(lead.alcalde);
    } else if (actorFilter === 'dirMedioAmbiente') {
      matchesActorFilter = isRegistered(lead.dirMedioAmbiente);
    } else if (actorFilter === 'secplaNombre') {
      matchesActorFilter = isRegistered(lead.secplaNombre);
    } else if (actorFilter === 'gobernadorRegional') {
      matchesActorFilter = isRegistered(lead.gobernadorRegional);
    } else if (actorFilter === 'concejalClave') {
      matchesActorFilter = isRegistered(lead.concejalClave);
    } else if (actorFilter === 'aprClave') {
      matchesActorFilter = isRegistered(lead.aprClave);
    }

    return matchesSearch && matchesRegion && matchesStatus && matchesComuna && matchesActorFilter;
  });

  // Sort leads
  const sortedLeads = [...filteredLeads].sort((a, b) => {
    let valA = a[sortBy];
    let valB = b[sortBy];

    if (typeof valA === 'string') {
      valA = valA.toLowerCase();
      valB = (valB as string).toLowerCase();
    }

    if (valA! < valB!) return sortOrder === 'asc' ? -1 : 1;
    if (valA! > valB!) return sortOrder === 'asc' ? 1 : -1;
    return 0;
  });

  const handleSort = (field: keyof Lead) => {
    if (sortBy === field) {
      setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
    } else {
      setSortBy(field);
      setSortOrder('asc');
    }
  };

  const exportToExcel = () => {
    let xmlContent = `
      <html xmlns:o="urn:schemas-microsoft-com:office:office" 
            xmlns:x="urn:schemas-microsoft-com:office:excel" 
            xmlns="http://www.w3.org/TR/REC-html40">
      <head>
        <meta http-equiv="content-type" content="text/plain; charset=UTF-8"/>
        <!--[if gte mso 9]>
        <xml>
          <x:ExcelWorkbook>
            <x:ExcelWorksheets>
              <x:ExcelWorksheet>
                <x:Name>Comunas Diagnostico</x:Name>
                <x:WorksheetOptions>
                  <x:DisplayGridlines/>
                </x:WorksheetOptions>
              </x:ExcelWorksheet>
            </x:ExcelWorksheets>
          </x:ExcelWorkbook>
        </xml>
        <![endif]-->
        <style>
          table { border-collapse: collapse; }
          th { background-color: #0F172A; color: #FFFFFF; font-weight: bold; }
          td, th { border: 1px solid #CBD5E1; padding: 6px; font-family: Arial, sans-serif; font-size: 11px; }
        </style>
      </head>
      <body>
        <table>
          <thead>
            <tr>
              <th>N°</th>
              <th>Comuna</th>
              <th>Región</th>
              <th>Alcalde / Alcaldesa</th>
              <th>Email Alcaldía</th>
              <th>Director de Medio Ambiente</th>
              <th>Email Medio Ambiente</th>
              <th>Teléfono Medio Ambiente</th>
              <th>SECPLA Nombre</th>
              <th>SECPLA Email</th>
              <th>SECPLA Fono</th>
              <th>Gobernador Regional</th>
              <th>Email GORE</th>
              <th>Fono GORE</th>
              <th>Concejal Clave</th>
              <th>Email Concejal</th>
              <th>APR Clave</th>
              <th>Contacto APR</th>
              <th>Estrés Hídrico</th>
              <th>Dolor Hídrico</th>
              <th>Oportunidad Identificada</th>
              <th>Volumen Diseño (m³/día)</th>
              <th>Score de Prioridad</th>
              <th>Estado de Avance</th>
            </tr>
          </thead>
          <tbody>
    `;

    leads.forEach((lead) => {
      xmlContent += `
        <tr>
          <td>${lead.n}</td>
          <td>${lead.comuna || ''}</td>
          <td>${lead.region || ''}</td>
          <td>${lead.alcalde || ''}</td>
          <td>${lead.emailAlcaldia || ''}</td>
          <td>${lead.dirMedioAmbiente || ''}</td>
          <td>${lead.emailMA || ''}</td>
          <td>${lead.telMA || ''}</td>
          <td>${lead.secplaNombre || ''}</td>
          <td>${lead.secplaEmail || ''}</td>
          <td>${lead.secplaFono || ''}</td>
          <td>${lead.gobernadorRegional || ''}</td>
          <td>${lead.emailGore || ''}</td>
          <td>${lead.fonoGore || ''}</td>
          <td>${lead.concejalClave || ''}</td>
          <td>${lead.emailConcejal || ''}</td>
          <td>${lead.aprClave || ''}</td>
          <td>${lead.contactoApr || ''}</td>
          <td>${lead.estresHidrico || ''}</td>
          <td>${lead.dolorHidrico || ''}</td>
          <td>${lead.oportunidad || ''}</td>
          <td>${lead.m3Proposed || 0}</td>
          <td>${lead.score || ''}</td>
          <td>${lead.estado || ''}</td>
        </tr>
      `;
    });

    xmlContent += `
          </tbody>
        </table>
      </body>
      </html>
    `;

    const blob = new Blob([xmlContent], { type: 'application/vnd.ms-excel;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const downloadAnchor = document.createElement('a');
    downloadAnchor.href = url;
    downloadAnchor.download = "Ril_Ligth_Base_Datos.xls";
    document.body.appendChild(downloadAnchor);
    downloadAnchor.click();
    downloadAnchor.remove();
    URL.revokeObjectURL(url);
  };

  return (
    <div className="bg-white border border-slate-200 rounded-xl shadow-md overflow-hidden animate-fade-in text-slate-800">
      
      {/* Table Header and Control Panels */}
      <div className="p-6 border-b border-slate-200 bg-slate-50/40 flex flex-col xl:flex-row xl:items-center xl:justify-between gap-4">
        <div>
          <h2 className="text-xl font-bold tracking-tight text-ril-black">Consola de Análisis de Base de Datos</h2>
          <p className="text-xs text-slate-500 mt-1">
            Total en base integrada: <span className="font-bold text-slate-800">{leads.length} municipios (82 Comunas)</span> · Filtrados: <span className="font-bold text-ril-blue">{filteredLeads.length}</span>
          </p>
        </div>

        {/* Buttons / CTA */}
        <div className="flex flex-wrap items-center gap-3">
          <button
            onClick={onOpenImportModal}
            className="px-4 py-2.5 bg-ril-blue text-white text-xs font-bold uppercase tracking-wider rounded-lg hover:bg-ril-darkblue hover:scale-[1.02] active:scale-95 transition-all cursor-pointer flex items-center gap-2 shadow-sm shadow-ril-blue/20"
          >
            <Plus className="w-4 h-4" />
            <span>Importar Más Datos</span>
          </button>

          <button
            onClick={exportToExcel}
            className="px-4 py-2.5 bg-emerald-600 text-white text-xs font-bold uppercase tracking-wider rounded-lg hover:bg-emerald-700 hover:scale-[1.02] active:scale-95 transition-all cursor-pointer flex items-center gap-2 shadow-sm border border-emerald-700"
          >
            <Download className="w-4 h-4" />
            <span>Exportar Excel</span>
          </button>

          <button
            onClick={() => {
              setSearchTerm('');
              setRegionFilter('ALL');
              setStatusFilter('ALL');
              setComunaFilter('ALL');
              setActorFilter('ALL');
              setSortBy('n');
              setSortOrder('asc');
            }}
            className="p-2.5 border border-slate-300 bg-white text-slate-500 hover:text-slate-850 hover:bg-slate-50 hover:scale-[1.02] active:scale-95 transition-all rounded-lg cursor-pointer shadow-xs"
            title="Limpiar Filtros"
          >
            <RefreshCw className="w-4 h-4" />
          </button>
        </div>
      </div>

      {/* Advanced Filter Inputs */}
      <div className="p-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 border-b border-slate-200 bg-white">
        
        {/* Comuna filter dropdown */}
        <div>
          <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">Filtrar por Comuna</label>
          <select
            value={comunaFilter}
            onChange={(e) => setComunaFilter(e.target.value)}
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-xs focus:outline-none focus:border-ril-blue bg-white font-semibold text-slate-705 transition-all shadow-xs"
          >
            <option value="ALL">Todas las Comunas</option>
            {uniqueComunas.map((comuna) => (
              <option key={comuna} value={comuna}>{comuna}</option>
            ))}
          </select>
        </div>

        {/* Region group filter */}
        <div>
          <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">Filtrar por Región</label>
          <select
            value={regionFilter}
            onChange={(e) => setRegionFilter(e.target.value)}
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-xs focus:outline-none focus:border-ril-blue bg-white font-semibold text-slate-750 transition-all shadow-xs"
          >
            <option value="ALL">Todas las Regiones</option>
            {Array.from(new Set(leads.map((l) => l.region))).sort().map((region) => (
              <option key={region} value={region}>{region}</option>
            ))}
          </select>
        </div>

        {/* Actor Type selection filter - Placed directly after Region filter */}
        <div>
          <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">Filtrar por Tipo de Actor</label>
          <select
            value={actorFilter}
            onChange={(e) => setActorFilter(e.target.value)}
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-xs focus:outline-none focus:border-ril-blue bg-white font-semibold text-slate-750 transition-all shadow-xs"
          >
            <option value="ALL">📍 Todos los Actores</option>
            <option value="alcalde">👑 Alcalde / Alcaldesa</option>
            <option value="dirMedioAmbiente">🌿 Director de Medio Ambiente</option>
            <option value="secplaNombre">📐 SECPLA (Planificación)</option>
            <option value="gobernadorRegional">🏛️ Gobernador Regional</option>
            <option value="concejalClave">💬 Concejal Clave</option>
            <option value="aprClave">💧 APR Clave</option>
          </select>
        </div>

        {/* Pipeline current state filter - Placed at the very end */}
        <div>
          <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1.5">Estado de Avance</label>
          <select
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-xs focus:outline-none focus:border-ril-blue bg-white font-semibold text-slate-750 transition-all shadow-xs"
          >
            <option value="ALL">Mostrar Todos los Estados</option>
            {PIPELINE_STAGES.map((s) => (
              <option key={s.id} value={s.id}>{s.label}</option>
            ))}
          </select>
        </div>

      </div>

      {/* Database Interactive Table */}
      <div className="overflow-x-auto scrollbar-thin scrollbar-thumb-slate-300 scrollbar-track-transparent" ref={tableContainerRef}>
        <table className="w-full text-left border-collapse">
          <thead>
            <tr className="bg-slate-900 text-white text-xs uppercase tracking-wider select-none border-b border-slate-200">
              <th className="py-4 px-5 font-bold cursor-pointer hover:bg-slate-800 transition-all duration-150" onClick={() => handleSort('n')}>
                <div className="flex items-center gap-1">
                  N° <ArrowUpDown className="w-3 h-3 text-white/55" />
                </div>
              </th>
              <th className="py-4 px-5 font-bold cursor-pointer hover:bg-slate-800 transition-all duration-150" onClick={() => handleSort('comuna')}>
                <div className="flex items-center gap-1">
                  Comuna <ArrowUpDown className="w-3 h-3 text-white/55" />
                </div>
              </th>
              <th className="py-4 px-5 font-bold cursor-pointer hover:bg-slate-800 transition-all duration-150" onClick={() => handleSort('region')}>
                <div className="flex items-center gap-1">
                  Región <ArrowUpDown className="w-3 h-3 text-white/55" />
                </div>
              </th>
              <th className="py-4 px-5 font-bold text-slate-200 min-w-[240px]">
                {(() => {
                  if (actorFilter === 'ALL') return 'Liderazgo & Contacto';
                  if (actorFilter === 'alcalde') return 'Alcalde / Alcaldesa';
                  if (actorFilter === 'dirMedioAmbiente') return 'Directorio de Medio Ambiente';
                  if (actorFilter === 'secplaNombre') return 'Contacto SECPLA';
                  if (actorFilter === 'gobernadorRegional') return 'Gobernador Regional';
                  if (actorFilter === 'concejalClave') return 'Concejal Municipal Clave';
                  if (actorFilter === 'aprClave') return 'Operador APR Clave';
                  return 'Contacto de Interés';
                })()}
              </th>
              <th className="py-4 px-5 font-bold text-slate-200">Indicadores Críticos</th>
              <th className="py-4 px-5 font-bold text-slate-200 hidden lg:table-cell">Oportunidad Identificada</th>
              <th className="py-4 px-5 font-bold cursor-pointer hover:bg-slate-800 transition-all duration-150" onClick={() => handleSort('scoreNumeric')}>
                <div className="flex items-center gap-1">
                  Score <ArrowUpDown className="w-3 h-3 text-white/55" />
                </div>
              </th>
              <th className="py-4 px-5 font-bold text-slate-200">Estado</th>
              <th className="py-4 px-5 font-bold text-slate-200 text-right">Acciones</th>
            </tr>
          </thead>
          <tbody className="text-xs text-slate-600 divide-y divide-slate-100">
            {sortedLeads.length > 0 ? (
              sortedLeads.map((lead, index) => {
                const isEven = index % 2 === 1;
                const scoreColor = lead.scoreNumeric >= 5 
                  ? 'bg-red-50 text-red-700 border-red-200' 
                  : lead.scoreNumeric === 4 
                    ? 'bg-amber-50 text-amber-700 border-amber-200'
                    : 'bg-blue-50 text-blue-700 border-blue-200';

                return (
                  <tr 
                    key={lead.id} 
                    className={`hover:bg-slate-50/80 transition-all text-sm leading-tight cursor-pointer ${isEven ? 'bg-slate-50/20' : 'bg-white'}`}
                    onClick={() => onSelectLead(lead)}
                  >
                    {/* Index */}
                    <td className="py-4 px-5 font-mono select-none font-semibold text-slate-400">{lead.n}</td>
                    
                    {/* Comuna */}
                    <td className="py-4 px-5 font-bold text-slate-900 text-xs md:text-sm">{lead.comuna}</td>
                    
                    {/* Region Group badge */}
                    <td className="py-4 px-5">
                      <span className={`px-2.5 py-1 rounded-full text-[10px] font-bold ${
                        lead.region === 'RM' 
                          ? 'bg-purple-105 bg-purple-100 text-purple-800' 
                          : lead.region === 'Valparaíso' 
                            ? 'bg-indigo-100 text-indigo-805'
                            : 'bg-teal-100 text-teal-800'
                      }`}>
                        {lead.region}
                      </span>
                    </td>

                    {/* Contacts info based on selected dynamic lens */}
                    <td className="py-4 px-5">
                      {(() => {
                        if (actorFilter === 'ALL' || actorFilter === 'alcalde') {
                          return (
                            <div>
                              <div className="font-bold text-slate-900 flex items-center gap-1.5 flex-wrap">
                                <span className="bg-blue-100 text-blue-800 text-[9px] font-bold px-1.5 py-0.5 rounded uppercase">Alcalde</span>
                                <span>{lead.alcalde || 'Por confirmar'}</span>
                              </div>
                              <div className="text-[11px] text-slate-500 mt-1 flex flex-col gap-0.5 font-semibold">
                                {isRegistered(lead.emailAlcaldia) && (
                                  <span className="flex items-center gap-1"><Mail className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.emailAlcaldia}</span>
                                )}
                              </div>
                              {actorFilter === 'ALL' && isRegistered(lead.dirMedioAmbiente) && (
                                <div className="mt-2 text-[10px] text-zinc-550 border-t border-slate-100 pt-1 leading-snug">
                                  <span className="font-bold uppercase text-[8px] text-slate-400">DMA:</span> {lead.dirMedioAmbiente}
                                </div>
                              )}
                            </div>
                          );
                        } else if (actorFilter === 'dirMedioAmbiente') {
                          return (
                            <div>
                              <div className="font-bold text-slate-900 flex items-center gap-1.5 flex-wrap">
                                <span className="bg-emerald-100 text-emerald-800 text-[9px] font-bold px-1.5 py-0.5 rounded uppercase">Medio Ambiente</span>
                                <span>{lead.dirMedioAmbiente || 'Sin registrar'}</span>
                              </div>
                              <div className="text-[11px] text-slate-500 mt-1 flex flex-col gap-1 font-semibold">
                                {isRegistered(lead.emailMA) && (
                                  <span className="flex items-center gap-1"><Mail className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.emailMA}</span>
                                )}
                                {isRegistered(lead.telMA) && (
                                  <span className="flex items-center gap-1"><Phone className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.telMA}</span>
                                )}
                              </div>
                            </div>
                          );
                        } else if (actorFilter === 'secplaNombre') {
                          return (
                            <div>
                              <div className="font-bold text-slate-900 flex items-center gap-1.5 flex-wrap">
                                <span className="bg-purple-100 text-purple-800 text-[9px] font-bold px-1.5 py-0.5 rounded uppercase">SECPLA</span>
                                <span>{lead.secplaNombre || 'Sin registrar'}</span>
                              </div>
                              <div className="text-[11px] text-slate-500 mt-1 flex flex-col gap-1 font-semibold">
                                {isRegistered(lead.secplaEmail) && (
                                  <span className="flex items-center gap-1"><Mail className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.secplaEmail}</span>
                                )}
                                {isRegistered(lead.secplaFono) && (
                                  <span className="flex items-center gap-1"><Phone className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.secplaFono}</span>
                                )}
                              </div>
                            </div>
                          );
                        } else if (actorFilter === 'gobernadorRegional') {
                          return (
                            <div>
                              <div className="font-bold text-slate-900 flex items-center gap-1.5 flex-wrap">
                                <span className="bg-amber-100 text-amber-800 text-[9px] font-bold px-1.5 py-0.5 rounded uppercase font-extrabold">Gobernador</span>
                                <span>{lead.gobernadorRegional || 'Sin registrar'}</span>
                              </div>
                              <div className="text-[11px] text-slate-500 mt-1 flex flex-col gap-1 font-semibold">
                                {isRegistered(lead.emailGore) && (
                                  <span className="flex items-center gap-1"><Mail className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.emailGore}</span>
                                )}
                                {isRegistered(lead.fonoGore) && (
                                  <span className="flex items-center gap-1"><Phone className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.fonoGore}</span>
                                )}
                              </div>
                            </div>
                          );
                        } else if (actorFilter === 'concejalClave') {
                          return (
                            <div>
                              <div className="font-bold text-slate-900 flex items-center gap-1.5 flex-wrap">
                                <span className="bg-rose-100 text-rose-800 text-[9px] font-bold px-1.5 py-0.5 rounded uppercase">Concejal Clave</span>
                                <span>{lead.concejalClave || 'Sin registrar'}</span>
                              </div>
                              <div className="text-[11px] text-slate-500 mt-1 flex flex-col gap-1 font-semibold">
                                {isRegistered(lead.emailConcejal) && (
                                  <span className="flex items-center gap-1"><Mail className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.emailConcejal}</span>
                                )}
                              </div>
                            </div>
                          );
                        } else if (actorFilter === 'aprClave') {
                          return (
                            <div>
                              <div className="font-bold text-slate-900 flex items-center gap-1.5 flex-wrap">
                                <span className="bg-cyan-100 text-cyan-800 text-[9px] font-bold px-1.5 py-0.5 rounded uppercase font-black">APR Clave</span>
                                <span>{lead.aprClave || 'Sin registrar'}</span>
                              </div>
                              <div className="text-[11px] text-slate-500 mt-1 flex flex-col gap-1 font-semibold">
                                {isRegistered(lead.contactoApr) && (
                                  <span className="flex items-center gap-1"><Mail className="w-3.5 h-3.5 text-slate-400 shrink-0" /> {lead.contactoApr}</span>
                                )}
                              </div>
                            </div>
                          );
                        }
                        return null;
                      })()}
                    </td>

                    {/* Critical Distress */}
                    <td className="py-4 px-5 max-w-[200px]">
                      <div className="font-semibold text-red-700 flex items-center gap-1">
                        <Droplet className="w-3.5 h-3.5 text-red-500 flex-shrink-0" />
                        <span>{lead.estresHidrico}</span>
                      </div>
                      <div className="text-[11px] text-slate-500 line-clamp-2 mt-1" title={lead.dolorHidrico}>
                        {lead.dolorHidrico}
                      </div>
                    </td>

                    {/* Opportunity */}
                    <td className="py-4 px-5 max-w-[240px] hidden lg:table-cell">
                      <div className="text-slate-700 font-medium text-[11px] line-clamp-2" title={lead.oportunidad}>
                        {lead.oportunidad}
                      </div>
                    </td>

                    {/* Score badge */}
                    <td className="py-4 px-5">
                      <div className={`px-2.5 py-1 text-center font-bold text-xs rounded-lg border ${scoreColor}`}>
                        {lead.score}
                      </div>
                    </td>

                    {/* State tracking badge */}
                    <td className="py-4 px-5">
                      {(() => {
                        const stage = PIPELINE_STAGES.find((s) => s.id === lead.estado);
                        return (
                          <span className={`inline-block px-3 py-1 text-[10px] uppercase font-bold rounded-full ${stage?.colorClass} border border-slate-100`}>
                            {stage?.label || lead.estado}
                          </span>
                        );
                      })()}
                    </td>

                    {/* Actions button */}
                    <td className="py-4 px-5 text-right" onClick={(e) => e.stopPropagation()}>
                      <button
                        onClick={() => onSelectLead(lead)}
                        className="px-3.5 py-2 bg-ril-blue/10 text-ril-blue text-xs font-bold rounded-lg hover:bg-ril-blue hover:text-white transition-all inline-flex items-center gap-1.5 cursor-pointer shadow-xs"
                      >
                        <Eye className="w-4 h-4" />
                        <span>Ficha</span>
                      </button>
                    </td>
                  </tr>
                );
              })
            ) : (
              <tr>
                <td colSpan={9} className="py-12 text-center text-slate-400">
                  No se encontraron comunas con los filtros seleccionados para este actor.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {/* Horizontal Navigation Helper Bar at the bottom of the table */}
      <div className="p-4 bg-slate-50 border-t border-slate-200 flex flex-col sm:flex-row items-center justify-between gap-4 text-xs text-slate-500">
        <div className="flex items-center gap-2">
          <span className="inline-block w-2.5 h-2.5 rounded-full bg-ril-blue animate-pulse"></span>
          <span className="font-semibold text-slate-700">Controles de Desplazamiento Lateral:</span>
          <span>Desplaza la base de datos para visualizar todas las columnas.</span>
        </div>
        
        <div className="flex items-center gap-2.5">
          <button
            type="button"
            onClick={() => scrollTable('left')}
            className="px-4 py-2 bg-white border border-slate-300 rounded-lg text-slate-700 hover:bg-slate-100 flex items-center gap-1.5 active:scale-95 transition-all shadow-xs cursor-pointer font-bold select-none"
            title="Desplazar a la izquierda"
          >
            <ChevronLeft className="w-4 h-4 text-ril-blue" />
            <span>Desplazar Izquierda</span>
          </button>
          
          <button
            type="button"
            onClick={() => scrollTable('right')}
            className="px-4 py-2 bg-white border border-slate-300 rounded-lg text-slate-700 hover:bg-slate-100 flex items-center gap-1.5 active:scale-95 transition-all shadow-xs cursor-pointer font-bold select-none"
            title="Desplazar a la derecha"
          >
            <span>Desplazar Derecha</span>
            <ChevronRight className="w-4 h-4 text-ril-blue" />
          </button>
        </div>
      </div>
    </div>
  );
}
