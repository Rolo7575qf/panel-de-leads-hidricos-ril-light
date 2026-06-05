import express from 'express';
import path from 'path';
import { createServer as createViteServer } from 'vite';
import { GoogleGenAI } from '@google/genai';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();

let aiClient: GoogleGenAI | null = null;

function getGeminiClient(): GoogleGenAI {
  if (!aiClient) {
    const apiKey = process.env.GEMINI_API_KEY;
    if (!apiKey) {
      throw new Error('GEMINI_API_KEY is not defined. Please add it to your secrets panel.');
    }
    aiClient = new GoogleGenAI({
      apiKey,
      httpOptions: {
        headers: {
          'User-Agent': 'aistudio-build',
        },
      },
    });
  }
  return aiClient;
}

async function startServer() {
  const app = express();
  const PORT = 3000;

  // Middleware to parse JSON bodies
  app.use(express.json());

  // API endpoint for generating tailored sales follow-ups
  app.post('/api/gemini/suggest-followup', async (req, res) => {
    try {
      const { 
        comuna, 
        region, 
        alcalde, 
        dirMedioAmbiente, 
        dolorHidrico, 
        oportunidad, 
        estresHidrico, 
        tone, 
        agentName,
        customContext
      } = req.body;

      if (!comuna) {
        res.status(400).json({ error: 'La comuna es requerida para contextualizar.' });
        return;
      }

      const client = getGeminiClient();

      const systemInstruction = `
Eres un especialista comercial e ingeniero hídrico de primer nivel en la empresa chilena "Consorcio RIL-LIGHT S.A.". 
Tu misión es redactar comunicaciones corporativas hiper-personalizadas dirigidas a alcaldes, alcaldesas o directores de medio ambiente de municipios de Chile.
La empresa se especializa en tratamiento de residuos industriales líquidos (RILes), recuperación y gestión hídrica, y operación de plantas de tratamiento con más de 20 años de experiencia.

Pautas de Voz y Tono de la marca RIL-LIGHT (Página 7 del manual):
1. Tono Técnico-preciso: Usa datos tangibles. Di cosas como "Recirculamos hasta el 95 % del caudal con UF (Ultrafiltración), RO (Ósmosis Inversa) y NF (Nanofiltración)" o "Cumplimos con DS 90/2000, DS 46/2021 y RCAs vigentes, con monitoreo en línea y reportes automáticos a la SMA".
2. Tono Orientado a resultados: Destaca indicadores medibles, por ejemplo, "Reducimos hasta un 30 % los costos energéticos de tu planta/servicios desde el primer año".
3. Sostenible-concreto: No uses frases vacías como "expertos líderes". Enfócate en soluciones reales de economía circular y mitigación de escasez hídrica.
4. Relación: Actúa como un Socio Estratégico, no como un mero proveedor de servicios ("Diseñamos, construimos, operamos y transferimos tu planta bajo el modelo B.O.T - Build-Operate-Transfer").

Estructura de la carta o correo electrónico que debes redactar:
- Saludo profesional personalizado (ej. "Estimado Alcalde ${alcalde || 'de ' + comuna}" o "Estimada Sra. Directora de Medio Ambiente, ${dirMedioAmbiente || 'de la comuna'}").
- Introducción respetuosa vinculando la realidad del agua a nivel regional o municipal.
- Reconocimiento específico del Dolor Hídrico del municipio (${dolorHidrico}) y su nivel de estrés hídrico según datos (${estresHidrico}).
- Presentación de la Oportunidad de Solución específica (${oportunidad}) explicando técnicamente cómo RIL-LIGHT puede solucionarlo mediante reuso de aguas grises/negras, equipamiento municipal de SCADA, u optimización de APR rurales.
- Ofrecimiento de soluciones técnicas mediante la suite de servicios de RIL-LIGHT (como "Recuperación y Gestión Hídrica" o "Operación y Mantenimiento 24/7").
- Llamado a la acción (CTA) claro y profesional para coordinar una breve reunión diagnóstica técnica sin costo.
- Despedida formal a nombre del agente asignado: "${agentName || 'Representante Comercial'}" de Consorcio RIL-LIGHT S.A.
- Incluir un pie de página de la firma institucional con dirección (Pintor Cicarelli 585, San Joaquín, Santiago) y teléfono (+56 22 556 7311).

Escribe el mensaje directamente en un formato de correo electrónico elegante en Español con Markdown enriquecido. Que se sienta humano, inteligente, pragmático y altamente convincente.
`;

      const prompt = `
Contexto de Generación:
- Comuna: ${comuna} (Región: ${region})
- Destinatario 1 (Alcaldía): Alcalde/Alcaldesa ${alcalde || 'Por confirmar'}
- Destinatario 2 (Medio Ambiente): Director(a) ${dirMedioAmbiente || 'Por confirmar'}
- Nivel de Estrés Hídrico: ${estresHidrico}
- Dolores Críticos de Agua del Municipio: ${dolorHidrico}
- Oportunidad Identificada: ${oportunidad}
- Enfoque/Tono predominante: ${tone || 'tecnico-profesional'}
- Contexto adicional de la conversación actual: ${customContext || 'Ninguno adicional'}
- Firmante: ${agentName || 'Consultor Técnico RIL-LIGHT'}

Por favor, redacta el borrador perfecto de seguimiento comercial o de propuesta de valor para este lead que convenza al municipio de concertar una llamada técnica.
`;

      const response = await client.models.generateContent({
        model: 'gemini-3.5-flash',
        contents: prompt,
        config: {
          systemInstruction,
          temperature: 0.7,
        },
      });

      const messageText = response.text || 'Sin respuesta de la IA.';

      res.json({ text: messageText });
    } catch (error: any) {
      console.error('Error in /api/gemini/suggest-followup:', error);
      res.status(500).json({ error: error.message || 'Error interno del servidor generando el seguimiento.' });
    }
  });

  // Serve static files / Vite middleware
  if (process.env.NODE_ENV !== 'production') {
    const vite = await createViteServer({
      server: { middlewareMode: true },
      appType: 'spa',
    });
    app.use(vite.middlewares);
  } else {
    const distPath = path.join(process.cwd(), 'dist');
    app.use(express.static(distPath));
    app.get('*', (req, res) => {
      res.sendFile(path.join(distPath, 'index.html'));
    });
  }

  app.listen(PORT, '0.0.0.0', () => {
    console.log(`[RIL-LIGHT Server] Ready & running on port http://localhost:${PORT}`);
  });
}

startServer();
