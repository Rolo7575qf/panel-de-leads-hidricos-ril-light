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
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,PATCH,DELETE,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(200).end();

  const { id } = req.query;
  if (!id || typeof id !== 'string') {
    return res.status(400).json({ error: 'Lead ID is required' });
  }

  try {
    // GET /api/leads/:id
    if (req.method === 'GET') {
      const result = await queryD1(
        `SELECT l.*, 
          (SELECT json_group_array(json_object(
            'id', i.id, 'type', i.type, 'summary', i.summary,
            'details', i.details, 'date', i.date, 'agentName', i.agent_name
          )) FROM interaction_logs i WHERE i.lead_id = l.id) as interactions_json
        FROM leads l WHERE l.id = ?`,
        [id]
      );

      if (!result?.results?.[0]) {
        return res.status(404).json({ error: 'Lead not found' });
      }

      const row = result.results[0];
      return res.json({
        ...row,
        interactions: row.interactions_json ? JSON.parse(row.interactions_json) : [],
        interactions_json: undefined,
        scoreNumeric: row.score_numeric,
        assignedAgentId: row.assigned_agent_id,
      });
    }

    // PATCH /api/leads/:id — update lead fields and optionally add an interaction log
    if (req.method === 'PATCH') {
      const {
        estado,
        assignedAgentId,
        lastContactDate,
        nextFollowUpDate,
        m3Proposed,
        contractValue,
        interaction, // optional: { type, summary, details, agentName }
      } = req.body;

      // Build dynamic update query
      const fields: string[] = [];
      const values: any[] = [];

      if (estado !== undefined) { fields.push('estado = ?'); values.push(estado); }
      if (assignedAgentId !== undefined) { fields.push('assigned_agent_id = ?'); values.push(assignedAgentId); }
      if (lastContactDate !== undefined) { fields.push('last_contact_date = ?'); values.push(lastContactDate); }
      if (nextFollowUpDate !== undefined) { fields.push('next_follow_up_date = ?'); values.push(nextFollowUpDate); }
      if (m3Proposed !== undefined) { fields.push('m3_proposed = ?'); values.push(m3Proposed); }
      if (contractValue !== undefined) { fields.push('contract_value = ?'); values.push(contractValue); }

      if (fields.length > 0) {
        values.push(id);
        await queryD1(`UPDATE leads SET ${fields.join(', ')} WHERE id = ?`, values);
      }

      // Insert interaction log if provided
      if (interaction) {
        const logId = `int-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`;
        const now = new Date().toISOString().slice(0, 16).replace('T', ' ');
        await queryD1(
          `INSERT INTO interaction_logs (id, lead_id, type, summary, details, date, agent_name)
           VALUES (?, ?, ?, ?, ?, ?, ?)`,
          [logId, id, interaction.type, interaction.summary, interaction.details, now, interaction.agentName]
        );
      }

      return res.json({ success: true });
    }

    // DELETE /api/leads/:id
    if (req.method === 'DELETE') {
      await queryD1('DELETE FROM interaction_logs WHERE lead_id = ?', [id]);
      await queryD1('DELETE FROM leads WHERE id = ?', [id]);
      return res.json({ success: true });
    }

    return res.status(405).json({ error: 'Method not allowed' });
  } catch (error: any) {
    console.error(`[api/leads/${id}] Error:`, error);
    return res.status(500).json({ error: error.message });
  }
}
