-- ============================================================
-- Schema SQL para Panel de Leads Hídricos RIL-LIGHT
-- Base de datos: Cloudflare D1
-- ============================================================

-- Tabla de Leads (municipios evaluados)
CREATE TABLE IF NOT EXISTS leads (
  id                  TEXT PRIMARY KEY,
  n                   INTEGER,
  grupo               TEXT,
  region              TEXT NOT NULL,
  comuna              TEXT NOT NULL,
  estres_hidrico      TEXT,
  alcalde             TEXT,
  email_alcaldia      TEXT,
  dir_medio_ambiente  TEXT,
  email_ma            TEXT,
  tel_ma              TEXT,
  secpla_nombre       TEXT,
  secpla_email        TEXT,
  secpla_fono         TEXT,
  gobernador_regional TEXT,
  email_gore          TEXT,
  fono_gore           TEXT,
  concejal_clave      TEXT,
  email_concejal      TEXT,
  apr_clave           TEXT,
  contacto_apr        TEXT,
  dolor_hidrico       TEXT,
  oportunidad         TEXT,
  score               TEXT,
  score_numeric       INTEGER DEFAULT 0,
  estado              TEXT NOT NULL DEFAULT 'POR_PROSPECTAR',
  assigned_agent_id   TEXT DEFAULT '',
  last_contact_date   TEXT,
  next_follow_up_date TEXT,
  m3_proposed         REAL DEFAULT 0,
  contract_value      REAL DEFAULT 0,
  created_at          TEXT DEFAULT (datetime('now')),
  updated_at          TEXT DEFAULT (datetime('now'))
);

-- Tabla de Logs de Interacción (historial CRM)
CREATE TABLE IF NOT EXISTS interaction_logs (
  id         TEXT PRIMARY KEY,
  lead_id    TEXT NOT NULL,
  type       TEXT NOT NULL CHECK(type IN ('email','call','meeting','status_change','system')),
  summary    TEXT NOT NULL,
  details    TEXT,
  date       TEXT NOT NULL,
  agent_name TEXT NOT NULL,
  created_at TEXT DEFAULT (datetime('now')),
  FOREIGN KEY (lead_id) REFERENCES leads(id) ON DELETE CASCADE
);

-- Tabla de Agentes comerciales
CREATE TABLE IF NOT EXISTS agents (
  id                TEXT PRIMARY KEY,
  name              TEXT NOT NULL,
  role              TEXT,
  email             TEXT,
  color             TEXT,
  leads_assigned    INTEGER DEFAULT 0,
  won_count         INTEGER DEFAULT 0,
  proposal_count    INTEGER DEFAULT 0,
  performance_score REAL DEFAULT 0,
  rating            REAL DEFAULT 0,
  avatar            TEXT,
  created_at        TEXT DEFAULT (datetime('now'))
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_leads_estado      ON leads(estado);
CREATE INDEX IF NOT EXISTS idx_leads_region      ON leads(region);
CREATE INDEX IF NOT EXISTS idx_leads_score       ON leads(score_numeric DESC);
CREATE INDEX IF NOT EXISTS idx_interactions_lead ON interaction_logs(lead_id);
