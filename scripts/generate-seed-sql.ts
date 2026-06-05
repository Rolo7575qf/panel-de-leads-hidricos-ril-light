import { getInitialLeads } from '../src/data/initialLeads';
import * as fs from 'fs';
import * as path from 'path';

function escapeSql(val: any): string {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'string') {
    return `'${val.replace(/'/g, "''")}'`;
  }
  if (typeof val === 'number') {
    return val.toString();
  }
  if (typeof val === 'boolean') {
    return val ? '1' : '0';
  }
  return `'${JSON.stringify(val).replace(/'/g, "''")}'`;
}

async function main() {
  const leads = getInitialLeads();
  let sqlContent = '-- Seed data for RIL-LIGHT Leads\n\n';

  for (const lead of leads) {
    const leadFields = [
      escapeSql(lead.id),
      escapeSql(lead.n),
      escapeSql(lead.grupo),
      escapeSql(lead.region),
      escapeSql(lead.comuna),
      escapeSql(lead.estresHidrico),
      escapeSql(lead.alcalde),
      escapeSql(lead.emailAlcaldia),
      escapeSql(lead.dirMedioAmbiente),
      escapeSql(lead.emailMA),
      escapeSql(lead.telMA),
      escapeSql(lead.secplaNombre),
      escapeSql(lead.secplaEmail),
      escapeSql(lead.secplaFono),
      escapeSql(lead.gobernadorRegional),
      escapeSql(lead.emailGore),
      escapeSql(lead.fonoGore),
      escapeSql(lead.concejalClave),
      escapeSql(lead.emailConcejal),
      escapeSql(lead.aprClave),
      escapeSql(lead.contactoApr),
      escapeSql(lead.dolorHidrico),
      escapeSql(lead.oportunidad),
      escapeSql(lead.score),
      escapeSql(lead.scoreNumeric),
      escapeSql(lead.estado),
      escapeSql(lead.assignedAgentId || ''),
      escapeSql(lead.lastContactDate || null),
      escapeSql(lead.nextFollowUpDate || null),
      escapeSql(lead.m3Proposed || 0),
      escapeSql(lead.contractValue || 0)
    ].join(', ');

    sqlContent += `INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES (${leadFields});\n`;

    for (const inter of lead.interactions || []) {
      const interFields = [
        escapeSql(inter.id),
        escapeSql(lead.id),
        escapeSql(inter.type),
        escapeSql(inter.summary),
        escapeSql(inter.details),
        escapeSql(inter.date),
        escapeSql(inter.agentName)
      ].join(', ');

      sqlContent += `INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES (${interFields});\n`;
    }
  }

  // Add agent seeds
  const agents = [
    { id: '1', name: 'Carlos Mendoza', role: 'Ingeniero de Proyectos Senior', email: 'c.mendoza@rillight.cl', color: '#3B82F6', avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face' },
    { id: '2', name: 'Andrea Valenzuela', role: 'Consultora de Economía Circular', email: 'a.valenzuela@rillight.cl', color: '#10B981', avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=80&h=80&fit=crop&crop=face' },
    { id: '3', name: 'Roberto Díaz', role: 'Gestor de Cuentas Públicas', email: 'r.diaz@rillight.cl', color: '#F59E0B', avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&h=80&fit=crop&crop=face' }
  ];

  for (const agent of agents) {
    const agentFields = [
      escapeSql(agent.id),
      escapeSql(agent.name),
      escapeSql(agent.role),
      escapeSql(agent.email),
      escapeSql(agent.color),
      '0', '0', '0', '0', '5.0',
      escapeSql(agent.avatar)
    ].join(', ');

    sqlContent += `INSERT OR IGNORE INTO agents (
      id, name, role, email, color, leads_assigned, won_count, proposal_count, performance_score, rating, avatar
    ) VALUES (${agentFields});\n`;
  }

  fs.writeFileSync(path.join(process.cwd(), 'seed.sql'), sqlContent);
  console.log('✅ seed.sql generado exitosamente.');
}

main();
