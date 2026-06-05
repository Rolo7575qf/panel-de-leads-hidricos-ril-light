import React, { useState } from 'react';
import { Lead, LeadState } from '../types';
import { X, Plus, Info, Check, Upload, Award } from 'lucide-react';

interface ImportLeadsModalProps {
  onClose: () => void;
  onImportLeads: (newLeads: Omit<Lead, 'id' | 'interactions'>[]) => void;
  currentCount: number;
}

export default function ImportLeadsModal({ onClose, onImportLeads, currentCount }: ImportLeadsModalProps) {
  const [importMode, setImportMode] = useState<'manual' | 'csv'>('manual');

  // Manual Form States
  const [comuna, setComuna] = useState('');
  const [region, setRegion] = useState('RM');
  const [alcalde, setAlcalde] = useState('');
  const [emailAlcaldia, setEmailAlcaldia] = useState('');
  const [estresHidrico, setEstresHidrico] = useState('EHL + Decreto');
  const [dolorHidrico, setDolorHidrico] = useState('');
  const [oportunidad, setOportunidad] = useState('');
  const [score, setScore] = useState('Alta - 4/5');

  // CSV paste states
  const [csvText, setCsvText] = useState('');
  const [importFeedback, setImportFeedback] = useState<string | null>(null);

  const handleManualSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!comuna.trim()) return;

    const scoreNumeric = parseInt(score.match(/\d/)?.[0] || '3');

    const leadObject: Omit<Lead, 'id' | 'interactions'> = {
      n: currentCount + 1,
      grupo: 'Grupo 2',
      region,
      comuna,
      estresHidrico,
      alcalde: alcalde || 'Por confirmar',
      emailAlcaldia: emailAlcaldia || 'contacto@municipalidad.cl',
      dirMedioAmbiente: 'Por confirmar',
      emailMA: 'medioambiente@municipalidad.cl',
      telMA: 'Por confirmar',
      secplaNombre: 'Por confirmar',
      secplaEmail: 'secpla@municipalidad.cl',
      secplaFono: 'Por confirmar',
      gobernadorRegional: region === 'RM' ? 'Claudio Orrego Larraín' : 'Rodrigo Mundaca Cabrera',
      emailGore: region === 'RM' ? 'gobernador@gobiernosantiago.cl' : 'gobernador@gobiernovalparaiso.cl',
      fonoGore: 'Por confirmar',
      concejalClave: 'Por confirmar',
      emailConcejal: 'consejo@municipalidad.cl',
      aprClave: 'Comité APR Local de la Comuna',
      contactoApr: 'Por confirmar',
      dolorHidrico: dolorHidrico || 'Por definir',
      oportunidad: oportunidad || 'Evaluación de tratamiento de reuso',
      score,
      scoreNumeric,
      estado: 'POR_PROSPECTAR' as LeadState,
      assignedAgentId: 'agent-1',
      m3Proposed: scoreNumeric * 50,
      contractValue: scoreNumeric * 6500
    };

    onImportLeads([leadObject]);
    setComuna('');
    setAlcalde('');
    setEmailAlcaldia('');
    setDolorHidrico('');
    setOportunidad('');
    setImportFeedback('¡Municipio importado exitosamente!');
    setTimeout(() => {
      setImportFeedback(null);
      onClose();
    }, 1500);
  };

  const handleCsvImport = () => {
    if (!csvText.trim()) return;

    const lines = csvText.split('\n');
    const parsedLeads: Omit<Lead, 'id' | 'interactions'>[] = [];
    let errorCount = 0;

    lines.forEach((line, idx) => {
      if (!line.trim() || idx === 0 && line.toLowerCase().includes('comuna')) return; // skip header or empty lines

      // Safe split considering comma separators
      const parts = line.split(',');
      if (parts.length >= 7) {
        const parsedRegion = parts[0].trim() || 'RM';
        const parsedComuna = parts[1].trim();
        const parsedAlcalde = parts[2].trim() || 'Por confirmar';
        const parsedEstres = parts[3].trim() || 'EHL';
        const parsedEmail = parts[4].trim() || 'contacto@municipalidad.cl';
        const parsedDolor = parts[5].trim() || 'Por definir';
        const parsedOportunidad = parts[6].trim() || 'Reuso de agua';
        
        if (parsedComuna) {
          const scoreNum = 4;
          parsedLeads.push({
            n: currentCount + parsedLeads.length + 1,
            grupo: 'Grupo 2',
            region: parsedRegion,
            comuna: parsedComuna,
            estresHidrico: parsedEstres,
            alcalde: parsedAlcalde,
            emailAlcaldia: parsedEmail,
            dirMedioAmbiente: 'Por confirmar',
            emailMA: 'medioambiente@municipalidad.cl',
            telMA: 'Por confirmar',
            secplaNombre: 'Por confirmar',
            secplaEmail: 'secpla@municipalidad.cl',
            secplaFono: 'Por confirmar',
            gobernadorRegional: parsedRegion === 'RM' ? 'Claudio Orrego Larraín' : 'Rodrigo Mundaca Cabrera',
            emailGore: parsedRegion === 'RM' ? 'gobernador@gobiernosantiago.cl' : 'gobernador@gobiernovalparaiso.cl',
            fonoGore: 'Por confirmar',
            concejalClave: 'Por confirmar',
            emailConcejal: 'consejo@municipalidad.cl',
            aprClave: 'APR Comunal',
            contactoApr: 'Por confirmar',
            dolorHidrico: parsedDolor,
            oportunidad: parsedOportunidad,
            score: 'Alta - 4/5',
            scoreNumeric: scoreNum,
            estado: 'POR_PROSPECTAR' as LeadState,
            assignedAgentId: 'agent-2',
            m3Proposed: scoreNum * 40,
            contractValue: scoreNum * 5000
          });
        } else {
          errorCount++;
        }
      } else {
        errorCount++;
      }
    });

    if (parsedLeads.length > 0) {
      onImportLeads(parsedLeads);
      setCsvText('');
      setImportFeedback(`¡Se importaron ${parsedLeads.length} municipios con éxito! (Lineas omitidas/erróneas: ${errorCount})`);
      setTimeout(() => {
        setImportFeedback(null);
        onClose();
      }, 2000);
    } else {
      setImportFeedback('Error: Formato CSV inválido o vacío. Revisa la pauta de ejemplo.');
    }
  };

  return (
    <div className="fixed inset-0 bg-slate-900/45 backdrop-blur-sm z-50 flex items-center justify-center p-4 overflow-y-auto animate-fade-in">
      
      <div className="bg-white w-full max-w-lg rounded-2xl border border-slate-200 shadow-2xl overflow-hidden flex flex-col my-8">
        
        {/* Header */}
        <div className="bg-ril-black text-white p-5 flex items-center justify-between border-b border-white/10">
          <div className="flex items-center gap-2">
            <Upload className="w-5 h-5 text-ril-blue" />
            <h3 className="text-sm font-bold uppercase tracking-wider text-white">Importador de Leads Mapeados</h3>
          </div>
          <button onClick={onClose} className="p-1.5 hover:bg-white/10 transition-colors cursor-pointer text-white rounded-lg">
            <X className="w-4 h-4" />
          </button>
        </div>

        {/* Option tabs */}
        <div className="flex border-b border-slate-200 bg-slate-50/50 p-1.5 gap-1.5 text-xs">
          <button
            onClick={() => setImportMode('manual')}
            className={`flex-1 py-2.5 rounded-lg text-center font-bold uppercase transition-all cursor-pointer ${
              importMode === 'manual' ? 'bg-ril-blue text-white shadow-sm' : 'text-slate-500 hover:text-slate-800 hover:bg-slate-100/60'
            }`}
          >
            Formulario Manual
          </button>
          <button
            onClick={() => setImportMode('csv')}
            className={`flex-1 py-2.5 rounded-lg text-center font-bold uppercase transition-all cursor-pointer ${
              importMode === 'csv' ? 'bg-ril-blue text-white shadow-sm' : 'text-slate-500 hover:text-slate-800 hover:bg-slate-100/60'
            }`}
          >
            Importación Masiva CSV
          </button>
        </div>

        {/* Content body */}
        <div className="p-6 overflow-y-auto bg-white max-h-[55vh] text-xs">
          
          {importFeedback && (
            <div className={`p-4 mb-4 border rounded-xl ${importFeedback.startsWith('Error') ? 'bg-red-50 text-red-700 border-red-150' : 'bg-emerald-50 text-emerald-800 border-emerald-150'}`}>
              <div className="flex items-center gap-2 font-bold select-none">
                {importFeedback.startsWith('Error') ? '⚠️' : <Check className="w-4 h-4 text-emerald-600 animate-bounce" />}
                <span>{importFeedback}</span>
              </div>
            </div>
          )}

          {importMode === 'manual' ? (
            <form onSubmit={handleManualSubmit} className="space-y-4">
              <div className="grid grid-cols-2 gap-3">
                <div className="col-span-2">
                  <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Nombre Comuna *</label>
                  <input
                    type="text"
                    required
                    value={comuna}
                    onChange={(e) => setComuna(e.target.value)}
                    className="w-full p-2.5 border border-slate-300 rounded-lg bg-slate-50/20 text-xs font-medium focus:ring-2 focus:ring-ril-blue/15 focus:outline-none"
                    placeholder="Ej. Quilicura"
                  />
                </div>

                <div>
                  <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Región / Grupo</label>
                  <select
                    value={region}
                    onChange={(e) => setRegion(e.target.value)}
                    className="w-full p-2.5 border border-slate-300 rounded-lg bg-white font-semibold text-slate-700 focus:outline-none"
                  >
                    <option value="RM">Región Metropolitana</option>
                    <option value="Valparaíso">Región de Valparaíso</option>
                  </select>
                </div>

                <div>
                  <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Regulación Hídrica</label>
                  <select
                    value={estresHidrico}
                    onChange={(e) => setEstresHidrico(e.target.value)}
                    className="w-full p-2.5 border border-slate-300 rounded-lg bg-white font-semibold text-slate-700 focus:outline-none"
                  >
                    <option value="EHL">Estrés Hídrico Alto (EHL)</option>
                    <option value="EHL + Decreto">EHL + Decreto de Escasez</option>
                    <option value="Decreto escasez">Decreto escasez Activo</option>
                  </select>
                </div>

                <div>
                  <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Alcalde/Alcaldesa</label>
                  <input
                    type="text"
                    value={alcalde}
                    onChange={(e) => setAlcalde(e.target.value)}
                    className="w-full p-2.5 border border-slate-300 rounded-lg bg-slate-50/20 text-xs font-medium focus:ring-2 focus:ring-ril-blue/15 focus:outline-none"
                    placeholder="Ej. Juan Pérez"
                  />
                </div>

                <div>
                  <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Email Alcaldía</label>
                  <input
                    type="email"
                    value={emailAlcaldia}
                    onChange={(e) => setEmailAlcaldia(e.target.value)}
                    className="w-full p-2.5 border border-slate-300 rounded-lg bg-slate-50/20 text-xs font-medium focus:ring-2 focus:ring-ril-blue/15 focus:outline-none"
                    placeholder="alcaldia@municipalidad.cl"
                  />
                </div>
              </div>

              <div>
                <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Dolor Hídrico Comunal</label>
                <textarea
                  rows={2}
                  value={dolorHidrico}
                  onChange={(e) => setDolorHidrico(e.target.value)}
                  className="w-full p-2.5 border border-slate-300 rounded-lg bg-slate-50/20 text-xs font-medium focus:ring-2 focus:ring-ril-blue/15 focus:outline-none"
                  placeholder="Ej. Alto consumo de agua en riego de parques y cementerios..."
                />
              </div>

              <div>
                <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Oportunidad Identificada Ril Ligth</label>
                <textarea
                  rows={2}
                  value={oportunidad}
                  onChange={(e) => setOportunidad(e.target.value)}
                  className="w-full p-2.5 border border-slate-300 rounded-lg bg-slate-50/20 text-xs font-medium focus:ring-2 focus:ring-ril-blue/15 focus:outline-none"
                  placeholder="Ej. Reuso del efluente para riego de áreas verdes urbanas..."
                />
              </div>

              <div className="pt-2">
                <button
                  type="submit"
                  className="px-4 py-3 bg-ril-blue hover:bg-ril-darkblue text-white text-xs font-bold uppercase tracking-wider rounded-lg transition-all w-full cursor-pointer text-center flex items-center justify-center gap-1.5 shadow-sm active:scale-99 hover:scale-[1.01]"
                >
                  <Plus className="w-4 h-4" />
                  <span>Dar de alta Municipio</span>
                </button>
              </div>
            </form>
          ) : (
            <div className="space-y-4">
              <div className="bg-slate-50 p-4 border border-slate-200 rounded-xl space-y-1.5 text-slate-500">
                <div className="font-bold text-slate-800 flex items-center gap-1">
                  <Info className="w-4 h-4 text-ril-blue" />
                  <span>Guía de Importación Rápida</span>
                </div>
                <p className="leading-snug">
                  Pega filas con formato CSV separadas por comas. Recuerda incluir las columnas en el siguiente orden estricto:
                </p>
                <code className="block bg-white p-2.5 border border-slate-200 text-[10px] font-mono whitespace-pre text-slate-800 rounded-lg overflow-x-auto">
                  Región,Comuna,Alcalde,Estrés Hídrico,Email,Dolor,Oportunidad
                </code>
                <span className="block text-[10px] font-bold text-slate-600 mt-1">Ejemplo:</span>
                <code className="block bg-white p-2.5 border border-slate-200 text-[10.5px] font-mono text-ril-blue select-all leading-normal rounded-lg">
                  RM,Huechuraba,Carlos Cuadrado,EHL,alcaldia@huechuraba.cl,Presión en áreas verdes,Reuso de efluente planta municipal
                </code>
              </div>

              <div>
                <label className="text-[10px] uppercase font-bold tracking-wider text-slate-500 block mb-1">Pegar contenido CSV</label>
                <textarea
                  rows={6}
                  value={csvText}
                  onChange={(e) => setCsvText(e.target.value)}
                  className="w-full p-3 border border-slate-300 rounded-lg font-mono text-[10.5px] focus:outline-none bg-slate-50/20 focus:ring-2 focus:ring-ril-blue/15"
                  placeholder="RM,Conchalí,René de la Vega,EHL,alcalde@conchali.cl,Dolor hídrico local,Reuso industrial"
                />
              </div>

              <div className="pt-2">
                <button
                  onClick={handleCsvImport}
                  className="px-4 py-3 bg-ril-blue hover:bg-ril-darkblue text-white text-xs font-bold uppercase tracking-wider rounded-lg transition-all w-full cursor-pointer text-center flex items-center justify-center gap-1.5 shadow-sm active:scale-99 hover:scale-[1.01]"
                >
                  <Upload className="w-4 h-4" />
                  <span>Procesar Importación Masiva</span>
                </button>
              </div>
            </div>
          )}

        </div>

        {/* Footer */}
        <div className="p-4.5 bg-slate-50 border-t border-slate-200 text-right">
          <button
            onClick={onClose}
            className="px-5 py-2 bg-white text-slate-700 text-xs font-bold uppercase tracking-wider border border-slate-300 rounded-lg cursor-pointer hover:bg-slate-50 transition-all hover:border-slate-450"
          >
            Cancelar
          </button>
        </div>

      </div>

    </div>
  );
}
