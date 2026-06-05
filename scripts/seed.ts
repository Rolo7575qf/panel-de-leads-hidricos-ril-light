/**
 * seed.ts — Script para poblar Cloudflare D1 con los leads de initialLeads.ts
 * 
 * USO:
 *   1. Copia .env.example → .env y completa las variables de Cloudflare
 *   2. npx tsx scripts/seed.ts
 *
 * El script hace INSERT OR IGNORE para no duplicar registros si se ejecuta
 * más de una vez.
 */

import { getInitialLeads } from '../src/data/initialLeads';
import * as dotenv from 'dotenv';

dotenv.config();

const CF_ACCOUNT_ID = process.env.CLOUDFLARE_ACCOUNT_ID;
const CF_DATABASE_ID = process.env.CLOUDFLARE_DATABASE_ID;
const CF_API_TOKEN = process.env.CLOUDFLARE_API_TOKEN;

if (!CF_ACCOUNT_ID || !CF_DATABASE_ID || !CF_API_TOKEN) {
  console.error('❌ Faltan variables de entorno de Cloudflare. Verifica tu archivo .env');
  process.exit(1);
}

const D1_URL = `https://api.cloudflare.com/client/v4/accounts/${CF_ACCOUNT_ID}/d1/database/${CF_DATABASE_ID}/query`;

async function queryD1(sql: string, params: any[] = []) {
  const response = await fetch(D1_URL, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${CF_API_TOKEN}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ sql, params }),
  });

  if (!response.ok) {
    const err = await response.text();
    throw new Error(`D1 query failed [${response.status}]: ${err}`);
  }

  const data = await response.json() as any;
  if (!data.success) {
    throw new Error(`D1 error: ${JSON.stringify(data.errors)}`);
  }
  return data.result?.[0];
}

async function batchInsert(leads: ReturnType<typeof getInitialLeads>) {
  let inserted = 0;
  let skipped = 0;

  for (const lead of leads) {
    try {
      await queryD1(
        `INSERT OR IGNORE INTO leads (
          id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
          dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
          gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
          apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
          estado, assigned_agent_id, last_contact_date, next_follow_up_date,
          m3_proposed, contract_value
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
        [
          lead.id, lead.n, lead.grupo, lead.region, lead.comuna,
          lead.estresHidrico, lead.alcalde, lead.emailAlcaldia,
          lead.dirMedioAmbiente, lead.emailMA, lead.telMA,
          lead.secplaNombre, lead.secplaEmail, lead.secplaFono,
          lead.gobernadorRegional, lead.emailGore, lead.fonoGore,
          lead.concejalClave, lead.emailConcejal, lead.aprClave,
          lead.contactoApr, lead.dolorHidrico, lead.oportunidad,
          lead.score, lead.scoreNumeric, lead.estado,
          lead.assignedAgentId || '',
          lead.lastContactDate || null,
          lead.nextFollowUpDate || null,
          lead.m3Proposed || 0,
          lead.contractValue || 0,
        ]
      );

      // Insert initial interaction logs
      for (const interaction of lead.interactions || []) {
        await queryD1(
          `INSERT OR IGNORE INTO interaction_logs (id, lead_id, type, summary, details, date, agent_name)
           VALUES (?, ?, ?, ?, ?, ?, ?)`,
          [interaction.id, lead.id, interaction.type, interaction.summary, interaction.details, interaction.date, interaction.agentName]
        );
      }

      inserted++;
      if (inserted % 10 === 0) {
        console.log(`  → ${inserted}/${leads.length} leads insertados...`);
      }
    } catch (err: any) {
      console.warn(`  ⚠️  Lead ${lead.id} (${lead.comuna}) omitido: ${err.message}`);
      skipped++;
    }
  }

  return { inserted, skipped };
}

async function main() {
  console.log('🌊 RIL-LIGHT — Seed de Cloudflare D1');
  console.log('=====================================');
  console.log(`📦 Account: ${CF_ACCOUNT_ID}`);
  console.log(`🗄️  Database: ${CF_DATABASE_ID}`);
  console.log('');

  const leads = getInitialLeads();
  console.log(`🔢 Total de leads a insertar: ${leads.length}`);
  console.log('');
  console.log('⏳ Iniciando inserción...');

  try {
    const { inserted, skipped } = await batchInsert(leads);
    console.log('');
    console.log('✅ Seed completado:');
    console.log(`   • Insertados: ${inserted}`);
    console.log(`   • Omitidos (ya existían): ${skipped}`);
  } catch (err: any) {
    console.error('❌ Error durante el seed:', err.message);
    process.exit(1);
  }
}

main();
