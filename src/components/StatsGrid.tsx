import React from 'react';
import { Lead } from '../types';
import { Database, UserCheck, Shield, Users, MapPin, Layers } from 'lucide-react';

interface StatsGridProps {
  leads: Lead[];
}

export default function StatsGrid({ leads }: StatsGridProps) {
  const totalLeads = leads.length;

  // Region dynamic counts
  const regionsMap = leads.reduce((acc, lead) => {
    acc[lead.region] = (acc[lead.region] || 0) + 1;
    return acc;
  }, {} as Record<string, number>);

  // Actor registration counters
  // Helper to check if a value is actually valid/registered and not placeholder
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

  const alcaldeCount = leads.filter((l) => isRegistered(l.alcalde)).length;
  const dirMedioAmbienteCount = leads.filter((l) => isRegistered(l.dirMedioAmbiente)).length;
  
  // SECPLA: if we have secplaNombre, and we also check that it's not a generic placeholder
  const secplaCount = leads.filter((l) => isRegistered(l.secplaNombre) && !l.secplaNombre.toLowerCase().includes('secpla')).length || leads.filter((l) => isRegistered(l.secplaNombre)).length;
  
  // Gobernador: is usually registered (e.g. "Claudio Orrego", "Rodrigo Mundaca", "Gore Coquimbo", etc.)
  const gobernadorCount = leads.filter((l) => isRegistered(l.gobernadorRegional)).length;
  
  // Concejal
  const concejalCount = leads.filter((l) => isRegistered(l.concejalClave)).length;
  
  // APR Clave
  const aprCount = leads.filter((l) => isRegistered(l.aprClave)).length;

  // Percentages of database coverage
  const alcaldePercent = totalLeads > 0 ? ((alcaldeCount / totalLeads) * 100).toFixed(1) : '0.0';
  const dmaPercent = totalLeads > 0 ? ((dirMedioAmbienteCount / totalLeads) * 100).toFixed(1) : '0.0';

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8 animate-fade-in text-slate-800 dark:text-slate-100">
      
      {/* 1. MUNICIPALIDADES REGISTRADAS */}
      <div className="bg-white dark:bg-[#121E36] p-6 rounded-xl border border-slate-200/80 dark:border-slate-800 flex flex-col justify-between shadow-sm relative overflow-hidden group hover:shadow-md hover:border-ril-blue/40 transition-all duration-300">
        <div className="absolute right-3 top-3 opacity-10 text-ril-blue dark:text-blue-400 group-hover:scale-110 group-hover:opacity-20 transition-all duration-300">
          <Database className="w-14 h-14" />
        </div>
        <div>
          <span className="text-[10px] uppercase font-bold tracking-wider text-slate-500 dark:text-slate-400 block mb-1">Mapeo de Comunas</span>
          <h3 className="text-4xl font-extrabold text-slate-900 dark:text-white tracking-tight mb-2 font-sans">{totalLeads}</h3>
        </div>
        <div className="text-[11px] text-slate-500 dark:text-slate-400 mt-2 pt-3 border-t border-slate-100 dark:border-slate-800">
          <span className="font-bold">Distribución Territorial:</span>
          <div className="grid grid-cols-2 gap-x-2 gap-y-1 mt-1 font-semibold">
            {Object.entries(regionsMap).map(([region, count]) => (
              <div key={region} className="truncate">
                <span className="text-slate-800 dark:text-slate-200">{count}</span> {region}
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* 2. CONTACTOS DE ALCALDE */}
      <div className="bg-white dark:bg-[#121E36] p-6 rounded-xl border border-slate-200/80 dark:border-slate-800 flex flex-col justify-between shadow-sm relative overflow-hidden group hover:shadow-md hover:border-indigo-500/40 transition-all duration-300">
        <div className="absolute right-3 top-3 opacity-10 text-indigo-500 group-hover:scale-110 group-hover:opacity-20 transition-all duration-300">
          <UserCheck className="w-14 h-14" />
        </div>
        <div>
          <span className="text-[10px] uppercase font-bold tracking-wider text-slate-500 dark:text-slate-400 block mb-1">Contactos de Alcalde</span>
          <h3 className="text-4xl font-extrabold text-indigo-600 dark:text-indigo-400 tracking-tight mb-2 font-sans">
            {alcaldeCount} <span className="text-xs font-normal text-slate-400 dark:text-slate-500">registrados</span>
          </h3>
        </div>
        <div className="text-[11px] text-slate-500 dark:text-slate-400 flex flex-col mt-2 pt-3 border-t border-slate-100 dark:border-slate-800">
          <div className="flex justify-between">
            <span>Tasa de Cobertura:</span>
            <span className="font-bold text-slate-800 dark:text-white">{alcaldePercent}%</span>
          </div>
          <div className="w-full bg-slate-100 dark:bg-slate-800 h-1.5 rounded-full mt-1.5 overflow-hidden">
            <div 
              className="bg-indigo-500 h-full rounded-full transition-all duration-550" 
              style={{ width: `${alcaldePercent}%` }}
            />
          </div>
        </div>
      </div>

      {/* 3. CONTACTOS MEDIO AMBIENTE (DMA / DIMAO) */}
      <div className="bg-white dark:bg-[#121E36] p-6 rounded-xl border border-slate-200/80 dark:border-slate-800 flex flex-col justify-between shadow-sm relative overflow-hidden group hover:shadow-md hover:border-emerald-500/40 transition-all duration-300">
        <div className="absolute right-3 top-3 opacity-10 text-emerald-500 group-hover:scale-110 group-hover:opacity-20 transition-all duration-300">
          <Shield className="w-14 h-14" />
        </div>
        <div>
          <span className="text-[10px] uppercase font-bold tracking-wider text-slate-500 dark:text-slate-400 block mb-1">Dirección Medio Ambiente</span>
          <h3 className="text-4xl font-extrabold text-emerald-600 dark:text-emerald-400 tracking-tight mb-2 font-sans">
            {dirMedioAmbienteCount} <span className="text-xs font-normal text-slate-400 dark:text-slate-500">registrados</span>
          </h3>
        </div>
        <div className="text-[11px] text-slate-500 dark:text-slate-400 flex flex-col mt-2 pt-3 border-t border-slate-100 dark:border-slate-800">
          <div className="flex justify-between">
            <span>Tasa de Cobertura (DMA):</span>
            <span className="font-bold text-slate-800 dark:text-white">{dmaPercent}%</span>
          </div>
          <div className="w-full bg-slate-100 dark:bg-slate-800 h-1.5 rounded-full mt-1.5 overflow-hidden">
            <div 
              className="bg-emerald-500 h-full rounded-full transition-all duration-550" 
              style={{ width: `${dmaPercent}%` }}
            />
          </div>
        </div>
      </div>

      {/* 4. TOTAL OTROS ACTORES CLAVES registrados */}
      <div className="bg-white dark:bg-[#121E36] p-6 rounded-xl border border-slate-200/80 dark:border-slate-800 flex flex-col justify-between shadow-sm relative overflow-hidden group hover:shadow-md hover:border-ril-blue/40 transition-all duration-300">
        <div className="absolute right-3 top-3 opacity-10 text-ril-blue dark:text-blue-400 group-hover:scale-110 group-hover:opacity-20 transition-all duration-300">
          <Users className="w-14 h-14" />
        </div>
        <div>
          <span className="text-[10px] uppercase font-bold tracking-wider text-slate-500 dark:text-slate-400 block mb-1">Otros Actores Detallados</span>
          <h3 className="text-4xl font-extrabold text-ril-black dark:text-white tracking-tight mb-2 font-sans">
            {goberndorCountAndOthers(secplaCount, gobernadorCount, concejalCount, aprCount)} <span className="text-xs font-normal text-slate-400 dark:text-slate-500">contactos</span>
          </h3>
        </div>
        <div className="text-[10px] text-slate-500 dark:text-slate-400 mt-2 pt-3 border-t border-slate-100 dark:border-slate-800 font-semibold grid grid-cols-2 gap-x-2 gap-y-1">
          <div><span className="font-bold text-slate-800 dark:text-white">{goberndorUniqueCount(leads, gobernadorCount)}</span> Gores</div>
          <div><span className="font-bold text-slate-800 dark:text-white">{secplaCount}</span> Secplas</div>
          <div><span className="font-bold text-slate-800 dark:text-white">{concejalCount}</span> Concejales</div>
          <div><span className="font-bold text-slate-800 dark:text-white">{aprCount}</span> APR Claves</div>
        </div>
      </div>

    </div>
  );
}

// Helper to calculate total of other actors
function goberndorCountAndOthers(secpla: number, gober: number, concejal: number, apr: number): number {
  return secpla + gober + concejal + apr;
}

// Helper to count unique regional governors registered
function goberndorUniqueCount(leads: Lead[], rawCount: number): number {
  const uniques = new Set(
    leads
      .map((l) => l.gobernadorRegional)
      .filter((g) => g && g.toLowerCase().trim() !== '' && !g.toLowerCase().includes('confirmar'))
  );
  return uniques.size > 0 ? uniques.size : rawCount;
}
