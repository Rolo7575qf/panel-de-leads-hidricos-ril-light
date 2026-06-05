import React, { useState } from 'react';
import { Database, TrendingUp, Layers, UserCheck, ChevronLeft, ChevronRight, ChevronDown, ChevronUp } from 'lucide-react';

interface SidebarProps {
  currentTab: string;
  setCurrentTab: (tab: string) => void;
}

export default function Sidebar({ currentTab, setCurrentTab }: SidebarProps) {
  const [isCollapsed, setIsCollapsed] = useState(false);
  const [isMenuOpen, setIsMenuOpen] = useState(true); // Accordion state for menu items

  const menuItems = [
    { id: 'dashboard', label: 'Dashboard & Analítica', icon: TrendingUp },
    { id: 'database', label: 'Base de Contactos', icon: Database },
    { id: 'pipeline', label: 'Pipeline de Ventas', icon: Layers },
  ];

  return (
    <aside 
      className={`bg-ril-black text-white flex flex-col transition-all duration-300 relative border-r border-white/10 z-30 shrink-0
        h-auto w-full md:sticky md:top-0 md:h-screen
        ${isCollapsed ? 'md:w-20' : 'md:w-64'}
      `}
    >
      {/* Top Bar with Logo & Collapse Button */}
      <div className="p-4 flex items-center justify-between border-b border-white/10">
        {!isCollapsed && (
          <div className="flex flex-col bg-ril-black py-2 px-1 rounded-sm select-none">
            <div className="leading-none inline-flex items-baseline">
              <span className="font-sans text-2xl font-black italic tracking-tighter text-white inline-block transform skew-x-3">Ril</span>
              <span className="text-2xl font-light italic tracking-tight text-ril-blue ml-1.5 transform skew-x-1">Ligth</span>
            </div>
          </div>
        )}
        {isCollapsed && (
          <div className="mx-auto flex flex-col bg-ril-black p-1 rounded-sm select-none">
            <span className="text-xl font-black italic tracking-tighter text-white transform skew-x-3">RL</span>
          </div>
        )}

        {/* Adjust/Collapse Button (Accordion style sidebar extension toggle) */}
        <button
          onClick={() => setIsCollapsed(!isCollapsed)}
          className="hidden md:flex p-1.5 rounded-lg bg-white/5 hover:bg-white/15 text-slate-300 hover:text-white transition-all cursor-pointer border border-white/10"
          title={isCollapsed ? "Expandir Menú" : "Contraer Menú"}
        >
          {isCollapsed ? <ChevronRight className="w-4 h-4" /> : <ChevronLeft className="w-4 h-4" />}
        </button>
      </div>

      {/* Subtitle / App status description */}
      {!isCollapsed && (
        <div className="px-4 py-3 bg-white/5 border-b border-white/5 hidden md:block">
          <p className="text-[10px] text-zinc-400 font-sans italic uppercase tracking-wider">
            Consola de Gestión Hídrica
          </p>
        </div>
      )}

      {/* Navigation Accordion Layout */}
      <div className="flex-1 py-4 px-3 overflow-y-auto space-y-2">
        <div className="space-y-1">
          {/* Accordion Header to fold/unfold menu */}
          {!isCollapsed ? (
            <button
              onClick={() => setIsMenuOpen(!isMenuOpen)}
              className="w-full flex items-center justify-between px-3 py-2 text-[10px] uppercase tracking-wider font-extrabold text-slate-400 hover:text-white transition-colors text-left"
            >
              <span>Navegación Sistema</span>
              {isMenuOpen ? <ChevronUp className="w-3.5 h-3.5" /> : <ChevronDown className="w-3.5 h-3.5" />}
            </button>
          ) : (
            <div className="w-full border-b border-white/5 pb-2 mb-2" />
          )}

          {/* Accordion Content */}
          {(isMenuOpen || isCollapsed) && (
            <nav className="space-y-1.5 animate-fade-in">
              {menuItems.map((tab) => {
                const Icon = tab.icon;
                const isActive = currentTab === tab.id;
                return (
                  <button
                    key={tab.id}
                    onClick={() => setCurrentTab(tab.id)}
                    className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-xs md:text-sm font-semibold transition-all duration-200 cursor-pointer text-left ${
                      isActive
                        ? 'bg-ril-blue text-white shadow-md shadow-ril-blue/20 scale-[1.01]'
                        : 'text-slate-300 hover:text-white hover:bg-white/10'
                    }`}
                  >
                    <Icon className={`w-4 h-4 shrink-0 ${isActive ? 'text-white' : 'text-slate-400'}`} />
                    {!isCollapsed && <span className="truncate">{tab.label}</span>}
                  </button>
                );
              })}
            </nav>
          )}
        </div>
      </div>

      {/* Bottom status badge */}
      {!isCollapsed && (
        <div className="p-4 border-t border-white/10 bg-white/5 text-[10px] text-zinc-400 hidden md:block leading-snug">
          <div>Consorcio Ril Ligth S.A.</div>
          <div className="text-[9px] text-zinc-500 mt-1">v2.2 · Santiago, Chile</div>
        </div>
      )}
    </aside>
  );
}
