import type { VercelRequest, VercelResponse } from '@vercel/node';

const CF_ACCOUNT_ID = process.env.CLOUDFLARE_ACCOUNT_ID!;
const CF_DATABASE_ID = process.env.CLOUDFLARE_DATABASE_ID!;
const CF_API_TOKEN = process.env.CLOUDFLARE_API_TOKEN!;

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
    throw new Error(`D1 query failed: ${err}`);
  }

  const data = await response.json() as any;
  if (!data.success) {
    throw new Error(`D1 error: ${JSON.stringify(data.errors)}`);
  }
  return data.result?.[0];
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  // CORS headers
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(200).end();

  try {
    // GET /api/leads — list all leads
    if (req.method === 'GET') {
      const result = await queryD1(
        `SELECT l.*, 
          (SELECT json_group_array(json_object(
            'id', i.id, 'type', i.type, 'summary', i.summary,
            'details', i.details, 'date', i.date, 'agentName', i.agent_name
          )) FROM interaction_logs i WHERE i.lead_id = l.id) as interactions_json
        FROM leads l ORDER BY l.score_numeric DESC, l.n ASC`
      );

      const leads = (result?.results || []).map((row: any) => ({
        ...row,
        interactions: row.interactions_json ? JSON.parse(row.interactions_json) : [],
        interactions_json: undefined,
        scoreNumeric: row.score_numeric,
        assignedAgentId: row.assigned_agent_id,
        lastContactDate: row.last_contact_date,
        nextFollowUpDate: row.next_follow_up_date,
        m3Proposed: row.m3_proposed,
        contractValue: row.contract_value,
        estresHidrico: row.estres_hidrico,
        emailAlcaldia: row.email_alcaldia,
        dirMedioAmbiente: row.dir_medio_ambiente,
        emailMA: row.email_ma,
        telMA: row.tel_ma,
        secplaNombre: row.secpla_nombre,
        secplaEmail: row.secpla_email,
        secplaFono: row.secpla_fono,
        gobernadorRegional: row.gobernador_regional,
        emailGore: row.email_gore,
        fonoGore: row.fono_gore,
        concejalClave: row.concejal_clave,
        emailConcejal: row.email_concejal,
        aprClave: row.apr_clave,
        contactoApr: row.contacto_apr,
        dolorHidrico: row.dolor_hidrico,
      }));

      return res.json({ leads });
    }

    // POST /api/leads — create a new lead
    if (req.method === 'POST') {
      const lead = req.body;
      const id = lead.id || `lead-${Date.now()}`;

      await queryD1(
        `INSERT INTO leads (
          id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
          dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
          gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
          apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
          estado, assigned_agent_id, last_contact_date, next_follow_up_date,
          m3_proposed, contract_value
        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
        [
          id, lead.n, lead.grupo, lead.region, lead.comuna, lead.estresHidrico,
          lead.alcalde, lead.emailAlcaldia, lead.dirMedioAmbiente, lead.emailMA,
          lead.telMA, lead.secplaNombre, lead.secplaEmail, lead.secplaFono,
          lead.gobernadorRegional, lead.emailGore, lead.fonoGore, lead.concejalClave,
          lead.emailConcejal, lead.aprClave, lead.contactoApr, lead.dolorHidrico,
          lead.oportunidad, lead.score, lead.scoreNumeric, lead.estado,
          lead.assignedAgentId, lead.lastContactDate, lead.nextFollowUpDate,
          lead.m3Proposed, lead.contractValue,
        ]
      );

      return res.status(201).json({ id, success: true });
    }

    return res.status(405).json({ error: 'Method not allowed' });
  } catch (error: any) {
    console.error('[api/leads] Error:', error);
    return res.status(500).json({ error: error.message });
  }
}
