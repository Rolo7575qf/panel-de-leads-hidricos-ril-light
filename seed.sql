-- Seed data for RIL-LIGHT Leads

INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-1', 1, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Til Til', 'EHL + Decreto', 'César Mena Retamal', 'alcaldia@tiltil.cl', 'Francisca Vásquez', 'mambiente@tiltil.cl; f.vazquez@tiltil.cl', '+56 9 3947 8904 (WA)', 'Por confirmar', 'secpla@tiltil.cl (est.)', '+56 2 2710 5700 (est.)', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@tiltil.cl (est.)', 'Comité APR Til Til / JJ.VV. Sector Industrial', 'alcaldia@tiltil.cl', 'Alta presión industrial-comunitaria; plantas contaminantes', 'Reúso aguas industriales/municipales; piloto BOT/OM', 'Alta - 5/5', 5, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 105, 36855);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-2', 2, 'RilLight_Leads_Grupo1_Actores', 'RM', 'San José de Maipo', 'EHL + Decreto', 'Roberto Pérez Catalán', 'alcaldia@sanjosedemaipo.cl', 'Karina Cabellos Escobar', 'medioambiente@sanjosedemaipo.cl', '+56 2 2678 4972', 'Por confirmar', 'secpla@sanjosedemaipo.cl', '+56 2 2678 4991', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@sanjosedemaipo.cl (est.)', 'Comités APR Alto Maipo / JJ.VV. San Alfonso', '+56 2 2678 4900', 'Estrés hídrico cuenca alta; APR rurales', 'Reúso equipamiento municipal; SCADA', 'Alta - 5/5', 5, 'CONTACTADO', 'agent-3', '2026-05-03 15:10', '24 HORAS', 110, 38720);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-2', 'lead-2', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (EHL + Decreto).', '2026-05-03 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-2', 'lead-2', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso equipamiento municipal; SCADA.', '2026-05-03 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-3', 3, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Puente Alto', 'EHL', 'Matías Toledo', 'alcaldia@mpuentealto.cl', 'Miguel Verdugo Becerra', 'mverdugo@mpuentealto.cl (est.)', '+56 2 2731 5454', 'Por confirmar', 'secpla@mpuentealto.cl (est.)', '+56 2 2810 1600', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@mpuentealto.cl (est.)', 'JJ.VV. Bajos de Mena / Unión Comunal Puente Alto', 'mpuentealto.cl', 'Alta densidad; presión hídrica; riesgo racionamiento', 'Reúso riego áreas verdes; BOT', 'Alta - 5/5', 5, 'EN_NEGOCIACION', 'agent-4', '2026-05-04 11:00', NULL, 115, 40595);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-3', 'lead-3', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (EHL).', '2026-05-04 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-3', 'lead-3', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso riego áreas verdes; BOT.', '2026-05-04 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-3', 'lead-3', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Alta densidad; presión hídrica; riesgo racionamiento. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-04 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-4', 4, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Petorca', 'Decreto escasez', 'Gustavo Henríquez Toledo', 'alcaldia@municipalidadpetorca.cl', 'Jessica Beltrán', 'jbeltran@municipalidadpetorca.cl (est.)', '+56 32 2337830', 'Por confirmar', 'secpla@municipalidadpetorca.cl (est.)', '+56 32 2337830', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municipalidadpetorca.cl (est.)', 'APR Valle Petorca / Comité Agua Cabildo', '+56 32 2337830', 'Caso emblemático estrés hídrico nacional; APR en crisis', 'Tratamiento y reúso APR y servicios municipales', 'Alta - 5/5', 5, 'PROPUESTA_ENVIADA', 'agent-1', '2026-05-05 17:45', '2026-06-10', 120, 42480);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-4', 'lead-4', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-05 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-4', 'lead-4', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Tratamiento y reúso APR y servicios municipales.', '2026-05-05 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-4', 'lead-4', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Caso emblemático estrés hídrico nacional; APR en crisis. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-05 11:00', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-4', 'lead-4', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-05 17:45', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-5', 5, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'San Antonio', 'Decreto escasez', 'Omar Vera Castro', 'alcaldia@sanantonio.cl', 'Dir. DIMAO', 'dimao@sanantonio.cl (est.)', '+56 35 2583 000', 'Por confirmar', 'secpla@sanantonio.cl (est.)', '+56 35 2583 000', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@sanantonio.cl (est.)', 'JJ.VV. Lo Gallardo / APR sector rural', 'sanantonio.cl', 'Déficit hídrico costero; presión por servicios', 'Reúso riego y lavado calles', 'Alta - 4/5', 4, 'CERRADO_GANADO', 'agent-2', '2026-05-06 12:00', NULL, 100, 35500);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-5', 'lead-5', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-06 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-5', 'lead-5', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso riego y lavado calles.', '2026-05-06 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-5', 'lead-5', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Déficit hídrico costero; presión por servicios. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-06 11:00', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-5', 'lead-5', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-06 17:45', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-5', 'lead-5', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-06 12:00', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-6', 6, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Pirque', 'EHL + Decreto', 'Jaime Escudero Ramos', 'secretaria@mpirque.cl', 'Dir. DIMAO', 'dimao@mpirque.cl (est.)', '+56 22 385 8500', 'Por confirmar', 'secpla@mpirque.cl (est.)', '+56 22 385 8503', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@mpirque.cl (est.)', 'Comités APR Pirque / JJ.VV. sector San José', '+56 22 385 8500', 'APR rurales en escasez; cuenca alta', 'Reúso APR y equipamiento municipal', 'Alta - 5/5', 5, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 130, 46280);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-7', 7, 'RilLight_Leads_Grupo1_Actores', 'RM', 'San Bernardo', 'EHL + Decreto', 'Christopher White', 'alcalde@sanbernardo.cl', 'Javiera Cruz', 'dimao@sanbernardo.cl', '+56 2 2927 0583', 'Por confirmar', 'secpla@sanbernardo.cl (est.)', '+56 2 2927 0700', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@sanbernardo.cl (est.)', 'JJ.VV. Sector Las Mercedes / Unión Comunal SB', 'sanbernardo.cl', 'Alta densidad; presión áreas verdes', 'Reúso áreas verdes y equipamiento', 'Alta - 5/5', 5, 'CONTACTADO', 'agent-4', '2026-05-08 15:10', '24 HORAS', 135, 48195);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-7', 'lead-7', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (EHL + Decreto).', '2026-05-08 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-7', 'lead-7', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso áreas verdes y equipamiento.', '2026-05-08 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-8', 8, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Isla de Maipo', 'EHL + Decreto', 'Juan Pablo Olave', 'partes@islademaipo.cl', 'Enc. MA', 'medioambiente@islademaipo.cl (est.)', '+56 22 876 9101', 'Por confirmar', 'secpla@islademaipo.cl (est.)', '+56 22 876 9101', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@islademaipo.cl (est.)', 'Comité APR Isla de Maipo / JJ.VV. Cuncumén', 'islademaipo.cl', 'Agrícola; presión hídrica; gasto en aljibe', 'Reúso agrícola y servicios municipales', 'Alta - 5/5', 5, 'CERRADO_GANADO', 'agent-1', '2026-05-09 12:00', NULL, 140, 50120);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-8', 'lead-8', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (EHL + Decreto).', '2026-05-09 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-8', 'lead-8', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso agrícola y servicios municipales.', '2026-05-09 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-8', 'lead-8', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Agrícola; presión hídrica; gasto en aljibe. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-09 11:00', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-8', 'lead-8', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-09 17:45', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-8', 'lead-8', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-09 12:00', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-9', 9, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Buin', 'EHL', 'Miguel Araya Lobos', 'alcaldia@buin.cl', 'Dir. DIMAO', 'dimao@buin.cl (est.)', '+56 2 8218458', 'Por confirmar', 'secpla@buin.cl (est.)', '+56 2 8218400', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@buin.cl (est.)', 'APR Buin Rural / JJ.VV. Paine-Buin', 'buin.cl', 'EHL agrícola-urbana; gasto en agua servicios', 'Reúso áreas verdes y equipamiento', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 116, 41644);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-10', 10, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Padre Hurtado', 'EHL + Decreto', 'Felipe Muñoz Heredia', 'contacto@mph.cl', 'Dir. DIMAO', 'dimao@mph.cl (est.)', '+56 2 2430 6000', 'Miguel Muñoz Verdugo', 'mmunozv@mph.cl', '+56 2 2430 6000', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@mph.cl (est.)', 'JJ.VV. Villa Los Quillayes / Org. Comunitarias PH', 'portal.mph.cl', 'Escasez + crecimiento urbano explosivo', 'Reúso servicios municipales', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-3', '2026-05-11 11:00', NULL, 120, 43200);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-10', 'lead-10', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (EHL + Decreto).', '2026-05-11 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-10', 'lead-10', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso servicios municipales.', '2026-05-11 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-10', 'lead-10', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Escasez + crecimiento urbano explosivo. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-11 11:00', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-11', 11, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Peñaflor', 'EHL + Decreto', 'Rodrigo Cornejo Inostroza', 'alcaldia@penaflor.cl', 'Héctor Riquelme Solís', 'hector.riquelme@penaflor.cl', '+56 2 2432 7777', 'Por confirmar', 'secpla@penaflor.cl (est.)', '+56 2 2432 7777', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@penaflor.cl (est.)', 'APR Peñaflor Rural / JJ.VV. El Carmen', 'penaflor.cl', 'Escasez residencial y agrícola', 'Reúso riego áreas verdes', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 124, 44764);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-12', 12, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Talagante', 'EHL + Decreto', 'Sebastián Rosas Guerrero', 'alcaldia@munitalagante.cl (est.)', 'Javier Medina Gálvez', 'rmedina@munitalagante.cl', '+56 2 2598 9200', 'Por confirmar', 'secpla@munitalagante.cl (est.)', '+56 2 2598 9200', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@munitalagante.cl (est.)', 'JJ.VV. Sector Cerrillos / APR Talagante Rural', 'munitalagante.cl', 'Escasez agrícola y urbana', 'Reúso agrícola y servicios', 'Alta - 4/5', 4, 'CONTACTADO', 'agent-1', '2026-05-13 15:10', '24 HORAS', 128, 46336);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-12', 'lead-12', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (EHL + Decreto).', '2026-05-13 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-12', 'lead-12', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso agrícola y servicios.', '2026-05-13 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-13', 13, 'RilLight_Leads_Grupo1_Actores', 'RM', 'El Monte', 'EHL + Decreto', 'Zandra Maulén Salinas', 'alcaldesa@munielmonte.cl', 'Dir. DIMAO', 'medioambiente@munielmonte.cl (est.)', '+56 2 2817 9400', 'Por confirmar', 'secpla@munielmonte.cl (est.)', '+56 2 2817 9400', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@munielmonte.cl (est.)', 'APR El Monte / JJ.VV. Rinconada', 'munielmonte.cl', 'Escasez; gasto alto en agua', 'Reúso servicios municipales', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 132, 47916);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-14', 14, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Paine', 'EHL', 'Rodrigo Contreras Gutiérrez', 'alcaldia@paine.cl', 'Dir. DIMAO', 'dimao@paine.cl (est.)', '+56 2 2821 8600', 'Por confirmar', 'secpla@paine.cl (est.)', '+56 2 2821 8600', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@paine.cl (est.)', 'APR Huelquén / JJ.VV. Sector Pintué', 'paine.cl', 'EHL agrícola; presión hídrica en cuenca', 'Reúso equipamiento y riego', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 136, 49504);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-15', 15, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Pudahuel', 'EHL + Decreto', 'Ítalo Bravo Lizana', 'alcaldia@mpudahuel.cl (est.)', 'Dir. DAOMA', 'daoma@mpudahuel.cl (est.)', 'mpudahuel.cl', 'Por confirmar', 'secpla@mpudahuel.cl (est.)', 'mpudahuel.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@mpudahuel.cl (est.)', 'JJ.VV. Villa Oeste / Org. Medio Ambiente Pudahuel', 'mpudahuel.cl', 'EHL urbano-industrial; decreto escasez', 'Reúso industrial y servicios', 'Alta - 4/5', 4, 'PROPUESTA_ENVIADA', 'agent-4', '2026-05-16 17:45', '2026-06-10', 140, 51100);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-15', 'lead-15', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (EHL + Decreto).', '2026-05-16 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-15', 'lead-15', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso industrial y servicios.', '2026-05-16 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-15', 'lead-15', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: EHL urbano-industrial; decreto escasez. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-16 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-15', 'lead-15', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-16 17:45', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-16', 16, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Peñalolén', 'EHL', 'Miguel Concha Manso', 'alcaldia@penalolen.cl', 'Juan Carlos Riveros', 'jriveros@penalolen.cl', '+56 2 4868253', 'Por confirmar', 'secpla@penalolen.cl (est.)', 'penalolen.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@penalolen.cl (est.)', 'JJ.VV. Lo Hermida / Unión Comunal Peñalolén', 'penalolen.cl', 'EHL topografía compleja; presión áreas verdes', 'Reúso parques y equipamiento', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 144, 52704);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-17', 17, 'RilLight_Leads_Grupo1_Actores', 'RM', 'San Joaquín', 'EHL', 'Cristóbal Labra Bassa', 'alcaldia@sanjoaquin.cl (est.)', 'Dir. Higiene y MA', 'medioambiente@sanjoaquin.cl (est.)', 'sanjoaquin.cl', 'Por confirmar', 'secpla@sanjoaquin.cl (est.)', 'sanjoaquin.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@sanjoaquin.cl (est.)', 'JJ.VV. El Bosque / Org. Comunitaria San Joaquín', 'sanjoaquin.cl', 'EHL densidad equipamiento municipal', 'Reúso servicios municipales', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 111, 40737);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-18', 18, 'RilLight_Leads_Grupo1_Actores', 'RM', 'San Miguel', 'EHL', 'Carol Bown Sepúlveda', 'alcaldia@sanmiguel.cl', 'Matilde Peña Marín', 'dima@sanmiguel.cl', '+56 2 3241 9411', 'Por confirmar', 'secpla@sanmiguel.cl (est.)', '+56 2 3241 9300', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@sanmiguel.cl (est.)', 'JJ.VV. Gran Avenida / Org. Ambiental San Miguel', 'web.sanmiguel.cl', 'EHL áreas verdes; alta densidad', 'Reúso riego plazas y parques', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 114, 41952);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-19', 19, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Quinta Normal', 'EHL', 'Karina Delfino Mussa', 'alcaldia@quintanormal.cl (est.)', 'Dir. DIMAO', 'dimao@quintanormal.cl (est.)', 'comunicaciones@quintanormal.cl', 'Por confirmar', 'secpla@quintanormal.cl (est.)', 'quintanormal.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@quintanormal.cl (est.)', 'JJ.VV. Villa Portales / Unión Comunal QN', 'quintanormal.cl', 'EHL espacios públicos densos', 'Reúso plazas y jardines', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 117, 43173);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-20', 20, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Recoleta', 'EHL', 'Fares Jadue Leiva', 'alcaldia@recoleta.cl', 'Dir. DIMAO', 'dimao@recoleta.cl (est.)', 'recoleta.cl', 'Por confirmar', 'secpla@recoleta.cl (est.)', 'recoleta.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@recoleta.cl (est.)', 'JJ.VV. Barrancas / Org. Ambiental Recoleta', 'recoleta.cl', 'EHL parque urbano y alta densidad', 'Reúso áreas verdes', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 120, 44400);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-21', 21, 'RilLight_Leads_Grupo1_Actores', 'RM', 'La Florida', 'EHL', 'Daniel Reyes Morales', 'alcaldia@laflorida.cl (est.)', 'Dir. DIMAO', 'medioambiente@laflorida.cl', 'mchavez@laflorida.cl', 'Por confirmar', 'secpla@laflorida.cl (est.)', 'laflorida.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@laflorida.cl (est.)', 'JJ.VV. Rojas Magallanes / APR La Florida', 'laflorida.cl', 'EHL parques y cementerios municipales', 'Reúso servicios municipales', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 164, 60844);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-22', 22, 'RilLight_Leads_Grupo1_Actores', 'RM', 'La Granja', 'EHL', 'Claudio Arriagada Macaya', 'alcaldia@municipalidadlagranja.cl (est.)', 'Dir. DIMAO', 'dimao@municipalidadlagranja.cl (est.)', 'municipalidadlagranja.cl', 'Por confirmar', 'secpla@municipalidadlagranja.cl (est.)', 'municipalidadlagranja.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@municipalidadlagranja.cl (est.)', 'JJ.VV. Seccional 2 / Org. Comunitaria La Granja', 'municipalidadlagranja.cl', 'EHL alta densidad urbana', 'Reúso servicios municipales', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 126, 46872);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-23', 23, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Lo Prado', 'EHL', 'Maximiliano Ríos Galleguillos', 'alcaldia@loprado.cl', 'Diana Donoso', 'diana.donoso@loprado.cl', '+56 2 2577 4902', 'Por confirmar', 'secpla@loprado.cl (est.)', '+56 2 3284 9703', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@loprado.cl (est.)', 'JJ.VV. Pudahuel Norte / Unión Comunal Lo Prado', 'loprado.cl', 'EHL; dirección MA bien estructurada', 'Reúso equipamiento y riego', 'Media - 4/5', 4, 'CERRADO_GANADO', 'agent-4', '2026-05-24 12:00', NULL, 172, 64156);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-23', 'lead-23', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (EHL).', '2026-05-24 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-23', 'lead-23', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso equipamiento y riego.', '2026-05-24 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-23', 'lead-23', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: EHL; dirección MA bien estructurada. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-24 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-23', 'lead-23', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-24 17:45', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-23', 'lead-23', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-24 12:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-24', 24, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Cerro Navia', 'EHL', 'Mauro Tamayo Rozas', 'partes@cerronavia.cl (est.)', 'Jorge Flores Valenzuela', 'jorge.flores@cerronavia.cl', '+569 7211 7014', 'Por confirmar', 'secpla@cerronavia.cl (est.)', 'cerronavia.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@cerronavia.cl (est.)', 'JJ.VV. Cerro Navia Norte / Org. Ambiental CN', 'cerronavia.cl', 'EHL infraestructura limitada; alta densidad', 'Reúso servicios municipales', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 132, 49368);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-25', 25, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Colina', 'EHL', 'Isabel Valenzuela Ahumada', 'alcaldia@colina.cl (est.)', 'Dir. MA', 'medioambiente@colina.cl', '+56 2 2707 3300', 'Por confirmar', 'secpla@colina.cl (est.)', '+56 2 2707 3300', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@colina.cl (est.)', 'Comité APR Colina / JJ.VV. Las Parcelas', 'colina.cl', 'EHL expansión urbana; Plan Gestión Hídrica propio', 'Reúso áreas verdes; alineado con Plan Hídrico', 'Media - 4/5', 4, 'PROPUESTA_ENVIADA', 'agent-2', '2026-05-01 17:45', '2026-06-10', 180, 67500);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-25', 'lead-25', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (EHL).', '2026-05-01 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-25', 'lead-25', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso áreas verdes; alineado con Plan Hídrico.', '2026-05-01 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-25', 'lead-25', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: EHL expansión urbana; Plan Gestión Hídrica propio. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-01 11:00', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-25', 'lead-25', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-01 17:45', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-26', 26, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Curacaví', 'EHL', 'Cristiano Hernández Villanueva', 'secretariaalcaldia@municipalidadcuracavi.cl', 'Jorge Larroulet', 'jlarroulet@municipalidadcuracavi.cl', '+56 22-2992167', 'Pablo Nuñez', 'secretariasecpla@municipalidadcuracavi.cl', '+56 22-299 2142', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@municipalidadcuracavi.cl (est.)', 'APR Curacaví Sector Las Viscachas / JJ.VV. El Tambo', 'municipalidadcuracavi.cl', 'EHL semi-rural; sequía agrícola', 'Reúso agrícola y APR', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 138, 51888);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-27', 27, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Melipilla', 'EHL', 'Paula Gárate Rojas', 'alcaldia@melipilla.cl (est.)', 'Carlos Núñez Miranda', 'carlos.nunez@munimelipilla.cl', '+56 2 2902 7000', 'Por confirmar', 'secpla@munimelipilla.cl (est.)', '+56 2 2902 7000', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@munimelipilla.cl (est.)', 'APR Melipilla Rural / JJ.VV. Villa Los Boldos', 'melipilla.cl', 'EHL agrícola-urbano', 'Reúso riego agrícola', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 141, 53157);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-28', 28, 'RilLight_Leads_Grupo1_Actores', 'RM', 'Alhué', 'EHL', 'Marcela Chamorro Macías', 'alcalde@munialahue.cl (est.)', 'Dir. DIMAO', 'medioambiente@munialahue.cl (est.)', 'munialahue.cl', 'Por confirmar', 'secpla@munialahue.cl (est.)', 'munialahue.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@munialahue.cl (est.)', 'APR Alhué / Comité Agua Rural Los Quillayes', 'munialahue.cl', 'EHL rural; alta vulnerabilidad hídrica', 'Reúso APR y servicios rurales', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 144, 54432);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-29', 29, 'RilLight_Leads_Grupo1_Actores', 'RM', 'María Pinto', 'EHL', 'Jessica Mualim Fajuri', 'alcaldia@mariapinto.cl (est.)', 'Dir. DIMAO', 'medioambiente@mariapinto.cl (est.)', 'mariapinto.cl', 'Por confirmar', 'secpla@mariapinto.cl (est.)', 'mariapinto.cl', 'Claudio Orrego Larraín', 'gobernador@gobiernosantiago.cl (est.)', '+56 2 2672 5000', 'Por confirmar', 'concejo@mariapinto.cl (est.)', 'APR María Pinto / Comité Agua Rural El Asiento', 'mariapinto.cl', 'EHL rural; estrés hídrico activo', 'Reúso agrícola y APR', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 147, 55713);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-30', 30, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Cabildo', 'Decreto escasez', 'Víctor Donoso Oyanedel', 'alcaldia@municipiocabildo.cl (est.)', 'Jefe Depto. MA', 'medioambiente@municipiocabildo.cl (est.)', '+56 9 8920 3190', 'Por confirmar', 'secpla@municipiocabildo.cl (est.)', '600 612 2133 Anx.210', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municipiocabildo.cl (est.)', 'APR Valle Petorca / Comités Agua Ligua-Petorca', 'municipiocabildo.cl', 'Valle Petorca; escasez extrema APR', 'Reúso APR y agrícola', 'Alta - 5/5', 5, 'CONTACTADO', 'agent-3', '2026-05-06 15:10', '24 HORAS', 100, 38000);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-30', 'lead-30', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-06 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-30', 'lead-30', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso APR y agrícola.', '2026-05-06 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-31', 31, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'La Ligua', 'Decreto escasez', 'Patricio Pallares Valenzuela', 'alcaldia@laligua.cl', 'Dir. DIMAO', 'dimao@laligua.cl (est.)', 'comunadelaligua.cl', 'Felipe Vergara Lucero', 'secpla@laligua.cl', '+56 9 5703 0680', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@laligua.cl (est.)', 'APR La Ligua / Comité Agua Rural Valle Ligua', 'comunadelaligua.cl', 'Agrícola muy golpeada por sequía; APR en riesgo', 'Reúso riego agrícola y APR', 'Alta - 5/5', 5, 'EN_NEGOCIACION', 'agent-4', '2026-05-07 11:00', NULL, 105, 40005);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-31', 'lead-31', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-07 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-31', 'lead-31', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso riego agrícola y APR.', '2026-05-07 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-31', 'lead-31', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Agrícola muy golpeada por sequía; APR en riesgo. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-07 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-32', 32, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Zapallar', 'Decreto escasez', 'Gustavo Alessandri', 'alcaldia@munizapallar.cl', 'Dir. DIMAO', 'medioambiente@munizapallar.cl (est.)', 'munizapallar.cl', 'Por confirmar', 'secpla@munizapallar.cl (est.)', 'munizapallar.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@munizapallar.cl (est.)', 'Org. Turismo Zapallar / JJ.VV. Cachagua', 'munizapallar.cl', 'Litoral turístico; estrés hídrico fuerte', 'Reúso turismo y áreas verdes', 'Alta - 4/5', 4, 'PROPUESTA_ENVIADA', 'agent-1', '2026-05-08 17:45', '2026-06-10', 88, 33616);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-32', 'lead-32', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-08 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-32', 'lead-32', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso turismo y áreas verdes.', '2026-05-08 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-32', 'lead-32', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Litoral turístico; estrés hídrico fuerte. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-08 11:00', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-32', 'lead-32', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-08 17:45', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-33', 33, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Papudo', 'Decreto escasez', 'Claudia Adasme', 'alcaldia@municipalidadpapudo.cl (est.)', 'Dir. DIMAO', 'medioambiente@municipalidadpapudo.cl', 'munipapudo.cl', 'Por confirmar', 'secpla@municipalidadpapudo.cl (est.)', 'munipapudo.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municipalidadpapudo.cl (est.)', 'JJ.VV. Papudo / Comité APR Los Aromos', 'munipapudo.cl', 'Litoral; déficit hídrico residencial-turístico', 'Reúso servicios turísticos', 'Alta - 4/5', 4, 'CERRADO_GANADO', 'agent-2', '2026-05-09 12:00', NULL, 92, 35236);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-33', 'lead-33', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-09 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-33', 'lead-33', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso servicios turísticos.', '2026-05-09 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-33', 'lead-33', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Litoral; déficit hídrico residencial-turístico. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-09 11:00', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-33', 'lead-33', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-09 17:45', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-33', 'lead-33', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-09 12:00', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-34', 34, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Putaendo', 'Decreto escasez', 'Mauricio Quiroz Chamorro', 'alcaldia@muniputaendo.cl (est.)', 'Dir. DIMAO', 'medioambiente@muniputaendo.cl (est.)', 'muniputaendo.cl', 'Por confirmar', 'secpla@muniputaendo.cl (est.)', 'muniputaendo.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@muniputaendo.cl (est.)', 'APR Putaendo / Comité Agua Aconcagua Rural', 'muniputaendo.cl', 'Interior agrícola; APR bajo estrés', 'Reúso agrícola municipal', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 96, 36864);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-35', 35, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'San Felipe', 'Decreto escasez', 'Carmen Castillo', 'alcaldia@munisanfelipe.cl (est.)', 'Dir. DIMAO', 'medioambiente@munisanfelipe.cl (est.)', 'munisanfelipe.cl', 'Por confirmar', 'secpla@munisanfelipe.cl (est.)', 'munisanfelipe.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@munisanfelipe.cl (est.)', 'APR Aconcagua / JJ.VV. Sector Rural San Felipe', 'munisanfelipe.cl', 'Valle Aconcagua; alta presión riego', 'Reúso urbano y agrícola', 'Alta - 4/5', 4, 'CERRADO_PERDIDO', 'agent-4', '2026-05-11 09:30', NULL, 100, 38500);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-35', 'lead-35', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-11 09:30', 'Sistema');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-36', 36, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Santa María', 'Decreto escasez', 'Claudio Zurita', 'alcaldia@imsantamaria.cl (est.)', 'Dir. DIMAO', 'medioambiente@imsantamaria.cl (est.)', 'imsantamaria.cl', 'Por confirmar', 'secpla@imsantamaria.cl (est.)', 'imsantamaria.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@imsantamaria.cl (est.)', 'APR Santa María Rural / JJ.VV. Rinconada', 'imsantamaria.cl', 'Interior; decreto escasez activo', 'Reúso agrícola municipal', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 104, 40144);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-37', 37, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Catemu', 'Decreto escasez', 'Rodrigo Díaz Brito', 'alcaldia@municatemu.cl (est.)', 'Daniela Albornoz', 'medioambiente@municatemu.cl (est.)', 'municatemu.cl', 'Por confirmar', 'secpla@municatemu.cl (est.)', 'municatemu.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municatemu.cl (est.)', 'APR Catemu / JJ.VV. El Algarrobo', 'municatemu.cl', 'Aconcagua; economía rural; escasez hídrica', 'Reúso agrícola', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 108, 41796);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-38', 38, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Panquehue', 'Decreto escasez', 'Gonzalo Vergara', 'alcaldia@impanquehue.cl (est.)', 'Dir. DIMAO', 'medioambiente@impanquehue.cl (est.)', 'impanquehue.cl', 'Por confirmar', 'secpla@impanquehue.cl (est.)', 'impanquehue.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@impanquehue.cl (est.)', 'APR Panquehue / JJ.VV. Sector Valle', 'impanquehue.cl', 'Agrícola; escasez hídrica Aconcagua', 'Reúso agrícola', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 112, 43456);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-39', 39, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Llay Llay', 'Decreto escasez', 'Edgardo González', 'alcaldia@municipalidadllayllay.cl (est.)', 'Samia Espinoza / Monserrat Pérez', 'medioambiente@municipalidadllayllay.cl', '+56 34 237 9148', 'Por confirmar', 'secpla@municipalidadllayllay.cl (est.)', '+56 34 237 9100', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municipalidadllayllay.cl (est.)', 'APR Llay Llay / JJ.VV. Sector Riego Intensivo', 'municipalidadllayllay.cl', 'Riego intensivo; escasez cuenca', 'Reúso agrícola', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-4', '2026-05-15 11:00', NULL, 116, 45124);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-39', 'lead-39', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-15 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-39', 'lead-39', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso agrícola.', '2026-05-15 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-39', 'lead-39', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Riego intensivo; escasez cuenca. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-15 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-40', 40, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Nogales', 'Decreto escasez', 'Leslie Pacheco Ramírez', 'alcaldia@muninogales.cl', 'Dir. DIMAO', 'medioambiente@muninogales.cl (est.)', 'muninogales.cl', 'Por confirmar', 'secpla@muninogales.cl (est.)', 'muninogales.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@muninogales.cl (est.)', 'APR Nogales Rural / JJ.VV. Sector Agrícola', 'muninogales.cl', 'Decreto escasez; actividad agrícola', 'Reúso agrícola', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 120, 46800);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-41', 41, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'La Cruz', 'Decreto escasez', 'Filomena Navia Hevia', 'alcaldia@lacruz.cl (est.)', 'Dir. DIMAO', 'medio_ambiente@lacruz.cl', 'lacruz.cl', 'Por confirmar', 'secpla@lacruz.cl (est.)', 'lacruz.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@lacruz.cl (est.)', 'APR La Cruz / Horticultura Org. Los Vilos', 'lacruz.cl', 'Horticultura-fruticultura; escasez hídrica', 'Reúso agrícola', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 124, 48484);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-42', 42, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Hijuelas', 'Decreto escasez', 'Verónica Rossat Arriagada', 'alcaldia@munihijuelas.cl (est.)', 'Dir. DIMAO', 'medioambiente@munihijuelas.cl (est.)', 'munihijuelas.cl', 'Por confirmar', 'secpla@munihijuelas.cl (est.)', 'munihijuelas.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@munihijuelas.cl (est.)', 'APR Hijuelas / JJ.VV. Sector Frutícola', 'munihijuelas.cl', 'Agrícola intensivo; escasez Aconcagua', 'Reúso agrícola', 'Alta - 4/5', 4, 'CONTACTADO', 'agent-3', '2026-05-18 15:10', '24 HORAS', 128, 50176);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-42', 'lead-42', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-18 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-42', 'lead-42', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso agrícola.', '2026-05-18 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-43', 43, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'La Calera', 'Decreto escasez', 'Johnny Piraino Meneses', 'alcaldia@lacalera.cl (est.)', 'Dir. DIMAO', 'medioambiente@lacalera.cl (est.)', '+56 33 212 0800', 'Por confirmar', 'secpla@lacalera.cl (est.)', '+56 33 212 0800', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@lacalera.cl (est.)', 'JJ.VV. Sector Industrial La Calera / APR Rural', 'lacalera.cl', 'Centro urbano industrial; escasez', 'Reúso industrial y municipal', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 132, 51876);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-44', 44, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Quillota', 'Decreto escasez', 'Luis Mella Gajardo', 'alcaldia@quillota.cl (est.)', 'Dir. DIMAO', 'medioambiente@quillota.cl', 'quillota.cl', 'Por confirmar', 'secpla@quillota.cl (est.)', 'quillota.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@quillota.cl (est.)', 'APR Quillota Rural / JJ.VV. Sector Frutícola', 'quillota.cl', 'Aconcagua; peso urbano-agrícola', 'Reúso urbano y riego', 'Alta - 4/5', 4, 'PROPUESTA_ENVIADA', 'agent-1', '2026-05-20 17:45', '2026-06-10', 136, 53584);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-44', 'lead-44', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-20 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-44', 'lead-44', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso urbano y riego.', '2026-05-20 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-44', 'lead-44', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Aconcagua; peso urbano-agrícola. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-20 11:00', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-44', 'lead-44', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-20 17:45', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-45', 45, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Quintero', 'Decreto escasez', 'Rolando Silva', 'alcaldia@muniquintero.cl (est.)', 'Dir. DIMAO', 'fiscalizacion.ambiental@muniquintero.cl', 'muniquintero.cl', 'Por confirmar', 'secpla@muniquintero.cl (est.)', 'muniquintero.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@muniquintero.cl (est.)', 'JJ.VV. Quintero / Movimiento Ambiental Quintero-Puchuncaví', 'muniquintero.cl', 'Costero industrial; escasez; alta contaminación', 'Reúso industrial costero', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 140, 55300);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-46', 46, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Limache', 'Decreto escasez', 'Luciano Valenzuela Romero', 'alcaldia@munilimache.cl (est.)', 'Dir. DIMAO', 'contacto@munilimache.cl', 'munilimache.cl', 'Por confirmar', 'secpla@munilimache.cl (est.)', 'munilimache.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@munilimache.cl (est.)', 'APR Limache Rural / JJ.VV. Sector Agrícola', 'munilimache.cl', 'Decreto escasez activo', 'Reúso agrícola y servicios', 'Alta - 4/5', 4, 'CONTACTADO', 'agent-3', '2026-05-22 15:10', '24 HORAS', 144, 57024);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-46', 'lead-46', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-22 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-46', 'lead-46', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso agrícola y servicios.', '2026-05-22 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-47', 47, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Olmué', 'Decreto escasez', 'Jorge Jil Herrera', 'alcaldia@olmue.cl', 'Dir. DIMAO', 'medioambiente@olmue.cl (est.)', 'olmue.cl', 'Por confirmar', 'secpla@olmue.cl (est.)', 'olmue.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@olmue.cl (est.)', 'APR Olmué / JJ.VV. Granizo', 'olmue.cl', 'Decreto escasez; rural semi-urbano', 'Reúso APR y equipamiento', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-4', '2026-05-23 11:00', NULL, 148, 58756);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-47', 'lead-47', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-23 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-47', 'lead-47', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso APR y equipamiento.', '2026-05-23 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-47', 'lead-47', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Decreto escasez; rural semi-urbano. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-23 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-48', 48, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Algarrobo', 'Decreto escasez', 'Marcos González', 'alcaldia@municipalidadalgarrobo.cl (est.)', 'Dir. DIMAO', 'medioambiente@municipalidadalgarrobo.cl', 'municipalidadalgarrobo.cl', 'Por confirmar', 'secpla@municipalidadalgarrobo.cl (est.)', 'municipalidadalgarrobo.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municipalidadalgarrobo.cl (est.)', 'Org. Turismo Algarrobo / JJ.VV. Las Cruces', 'municipalidadalgarrobo.cl', 'Litoral turístico; escasez', 'Reúso servicios turísticos', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 152, 60496);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-49', 49, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Cartagena', 'Decreto escasez', 'Lidia Silva', 'alcaldia@municartagena.cl (est.)', 'Dir. DIMAO', 'medioambiente@municartagena.cl (est.)', 'municartagena.cl', 'Por confirmar', 'secpla@municartagena.cl (est.)', 'municartagena.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@municartagena.cl (est.)', 'JJ.VV. Cartagena Playa / APR Rural', 'municartagena.cl', 'Litoral; déficit hídrico costero', 'Reúso servicios y riego', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 156, 62244);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-50', 50, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'El Quisco', 'Decreto escasez', 'José Jofré', 'oirs@elquisco.cl', 'Dir. MA Aseo y Ornato', 'medioambiente@elquisco.cl', '+56 35 245 6125', 'Por confirmar', 'secpla@elquisco.cl (est.)', '+56 35 245 6100', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@elquisco.cl (est.)', 'JJ.VV. El Quisco / Org. Turística Litoral', 'elquisco.cl', 'Litoral; escasez residencial', 'Reúso servicios turísticos', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 160, 64000);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-51', 51, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'El Tabo', 'Decreto escasez', 'Alfonso Muñoz', 'alcaldia@eltabo.cl (est.)', 'Dir. DIMAO', 'reciclaje@eltabo.cl', 'eltabo.cl', 'Por confirmar', 'secpla@eltabo.cl (est.)', 'eltabo.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@eltabo.cl (est.)', 'JJ.VV. El Tabo / Org. Medioambiental Litoral', 'eltabo.cl', 'Litoral; déficit hídrico', 'Reúso servicios comunales', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 164, 65764);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-52', 52, 'RilLight_Leads_Grupo1_Actores', 'Valparaíso', 'Santo Domingo', 'Decreto escasez', 'Fernando Rodríguez Larrain', 'alcaldia@santodomingo.cl (est.)', 'Dir. DIMAO', 'partes@santodomingo.cl', 'santodomingo.cl', 'Por confirmar', 'secpla@santodomingo.cl (est.)', 'santodomingo.cl', 'Rodrigo Mundaca Cabrera', 'gobernador@gobiernovalparaiso.cl (est.)', '+56 32 2626 200', 'Por confirmar', 'concejo@santodomingo.cl (est.)', 'JJ.VV. Santo Domingo / APR Sector Rural', 'santodomingo.cl', 'Litoral; escasez hídrica', 'Reúso servicios municipales', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 168, 67536);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-53', 53, 'Grupo 2', 'Coquimbo', 'Punitaqui', 'Decreto escasez', 'Carlos Araya Bugueño', 'alcaldia@punitaqui.cl', 'Sandra Díaz', 'medioambiente@punitaqui.cl', '+56 53 2262 100', 'Secpla', 'secpla@punitaqui.cl', '+56 53 2262 120', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@punitaqui.cl', 'Secado de pozos comunitarios; escasez crítica de APR', 'comite.punitaqui@apr.cl', 'Pozos agrícolas secos y sequía extrema', 'Planta de filtración móvil y reúso', 'Alta - 5/5', 5, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 215, 86645);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-54', 54, 'Grupo 2', 'Coquimbo', 'La Higuera', 'Decreto escasez', 'Yerko Galleguillos', 'alcaldia@lahiguera.cl', 'Uberlinda Aqueveque', 'u.aqueveque@lahiguera.cl', '+56 51 2235 600', 'Secpla', 'secpla@lahiguera.cl', '+56 51 2235 610', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@lahiguera.cl', 'Comités APR La Higuera', 'lahiguera.cl', 'Conflicto por agua minera vs consumo humano', 'Desalinización y reúso municipal', 'Alta - 5/5', 5, 'CERRADO_GANADO', 'agent-3', '2026-05-05 12:00', NULL, 220, 88880);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-54', 'lead-54', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-05 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-54', 'lead-54', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Desalinización y reúso municipal.', '2026-05-05 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-54', 'lead-54', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Conflicto por agua minera vs consumo humano. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-05 11:00', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-54', 'lead-54', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-05 17:45', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-54', 'lead-54', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-05 12:00', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-55', 55, 'Grupo 2', 'Coquimbo', 'Río Hurtado', 'Decreto escasez', 'Juana Olivares', 'contacto@riohurtado.cl', 'Carmen Juana', 'carmen.juana@riohurtado.cl', '+56 53 2280 400', 'Secpla', 'secpla@riohurtado.cl', '+56 53 2280 410', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@riohurtado.cl', 'APR Hurtado / Río Hurtado Valle', 'riohurtado.cl', 'Sequía extrema del Río Hurtado y APR desabastecidos', 'Optimización SCADA de pozos rurales', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-4', '2026-05-06 11:00', NULL, 180, 72900);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-55', 'lead-55', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-06 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-55', 'lead-55', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Optimización SCADA de pozos rurales.', '2026-05-06 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-55', 'lead-55', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Sequía extrema del Río Hurtado y APR desabastecidos. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-06 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-56', 56, 'Grupo 2', 'O''Higgins', 'Rancagua', 'Decreto escasez', 'Emerson Avendaño', 'alcaldia@rancagua.cl', 'Raimundo Agliati', 'ragliati@rancagua.cl', '+56 72 2203 300', 'Secpla', 'secpla@rancagua.cl', '+56 72 2203 310', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Pedro Hernández', 'consejo@rancagua.cl', 'APR sector poniente', 'rancagua.cl', 'Estrés de napas para riego de parques urbanos', 'Reúso de aguas grises en estadio municipal', 'Media - 4/5', 4, 'PROPUESTA_ENVIADA', 'agent-1', '2026-05-07 17:45', '2026-06-10', 184, 74704);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-56', 'lead-56', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-07 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-56', 'lead-56', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso de aguas grises en estadio municipal.', '2026-05-07 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-56', 'lead-56', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Estrés de napas para riego de parques urbanos. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-07 11:00', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-56', 'lead-56', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-07 17:45', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-57', 57, 'Grupo 2', 'O''Higgins', 'San Fernando', 'Decreto escasez', 'Pablo Silva Pérez', 'alcaldia@sanfernando.cl', 'Carlos Muñoz', 'cmuñoz@sanfernando.cl', '+56 72 2715 100', 'Secpla', 'secpla@sanfernando.cl', '+56 72 2715 110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Robert Arias', 'consejo@sanfernando.cl', 'APR Valle Tinguiririca', 'sanfernando.cl', 'Sequía cuenca del Tinguiririca y APR agrícolas', 'Monitoreo inteligente y recirculado en vivero municipal', 'Alta - 5/5', 5, 'CONTACTADO', 'agent-2', '2026-05-08 15:10', '24 HORAS', 235, 95645);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-57', 'lead-57', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-08 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-57', 'lead-57', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Monitoreo inteligente y recirculado en vivero municipal.', '2026-05-08 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-58', 58, 'Grupo 2', 'Coquimbo', 'Illapel', 'Decreto escasez', 'Denis Cortés Vargas', 'alcalde@illapel.cl', 'Marcos Sandoval', 'medioambiente@illapel.cl', '+56 53 252 5100', 'Secpla Illapel', 'secpla@illapel.cl', '+56 53 252 5110', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@illapel.cl', 'APR Choapa / Illapel Rural', 'illapel.cl', 'Pozos agrícolas secos y sequía extrema en Choapa', 'Tratamiento modular para riego de forraje', 'Alta - 5/5', 5, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 240, 97920);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-59', 59, 'Grupo 2', 'Coquimbo', 'Ovalle', 'Decreto escasez', 'Jonathan Acuña Rojas', 'alcalde@ovalle.cl', 'DIMAO Ovalle', 'dimao@ovalle.cl', '+56 53 262 1475', 'Secpla', 'secpla@ovalle.cl', '+56 53 262 1400', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@ovalle.cl', 'APR Embalse Recoleta / Ovalle', 'ovalle.cl', 'Colapso del embalse Recoleta; crisis hídrica total', 'Recuperación de aguas residuales para cinturón hortícola', 'Alta - 5/5', 5, 'EN_NEGOCIACION', 'agent-4', '2026-05-10 11:00', NULL, 245, 100205);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-59', 'lead-59', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-10 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-59', 'lead-59', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Recuperación de aguas residuales para cinturón hortícola.', '2026-05-10 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-59', 'lead-59', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Colapso del embalse Recoleta; crisis hídrica total. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-10 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-60', 60, 'Grupo 2', 'Coquimbo', 'Vicuña', 'Decreto escasez', 'Rafael Vera Castillo', 'contacto@vicunamunicipalidad.cl', 'Francisco Ruiz', 'medioambiente@vicunavalley.cl', '+56 51 267 0310', 'Secpla', 'secpla@vicunamunicipalidad.cl', '+56 51 267 0300', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@vicuna.cl', 'APR Elqui Valley / Vicuña Rural', 'vicunamunicipalidad.cl', 'Altas temperaturas y evaporación crítica del Río Elqui', 'Planta purificadora autónoma para APR alejado', 'Alta - 4/5', 4, 'CONTACTADO', 'agent-1', '2026-05-11 15:10', '24 HORAS', 80, 32800);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-60', 'lead-60', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-11 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-60', 'lead-60', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Planta purificadora autónoma para APR alejado.', '2026-05-11 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-61', 61, 'Grupo 2', 'Coquimbo', 'Monte Patria', 'Decreto escasez', 'Cristian Herrera Peña', 'alcaldia@montepatria.cl', 'Raúl Tapia', 'rtapia@montepatria.cl', '+56 53 235 4400', 'Secpla', 'secpla@montepatria.cl', '+56 53 235 4410', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@montepatria.cl', 'APR Monte Patria / La Paloma', 'montepatria.cl', 'Secado completo del embalse La Paloma; migración rural', 'Reúso de efluentes de alcantarillado para forestación urbana', 'Alta - 5/5', 5, 'PROPUESTA_ENVIADA', 'agent-2', '2026-05-12 17:45', '2026-06-10', 105, 43155);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-61', 'lead-61', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-12 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-61', 'lead-61', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso de efluentes de alcantarillado para forestación urbana.', '2026-05-12 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-61', 'lead-61', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Secado completo del embalse La Paloma; migración rural. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-12 11:00', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-61', 'lead-61', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-12 17:45', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-62', 62, 'Grupo 2', 'Coquimbo', 'Combarbalá', 'Decreto escasez', 'Pedro Castillo Díaz', 'alcalde@combarbala.cl', 'Jorge Cortés', 'medioambiente@combarbala.cl', '+56 53 274 1250', 'Secpla', 'secpla@combarbala.cl', '+56 53 274 1200', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@combarbala.cl', 'Comités APR Combarbalá', 'combarbala.cl', 'Dependencia crítica de camiones aljibe', 'Unidad móvil de potabilización de agua de vertiente', 'Alta - 5/5', 5, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 110, 45320);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-63', 63, 'Grupo 2', 'Coquimbo', 'Canela', 'Decreto escasez', 'Bernardo Leyton Lemus', 'alcaldia@canela.cl', 'Esteban Olivares', 'e.olivares@canela.cl', '+56 53 254 1160', 'Secpla Canela', 'secpla@canela.cl', '+56 53 254 1100', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@canela.cl', 'APR Canela Minera / Crianceros', 'canela.cl', 'Crisis de pequeños crianceros de cabras por falta de agua', 'Piloto de recirculación de aguas en bebederos comunales', 'Media - 4/5', 4, 'CERRADO_GANADO', 'agent-4', '2026-05-14 12:00', NULL, 92, 37996);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-63', 'lead-63', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-14 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-63', 'lead-63', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Piloto de recirculación de aguas en bebederos comunales.', '2026-05-14 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-63', 'lead-63', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Crisis de pequeños crianceros de cabras por falta de agua. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-14 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-63', 'lead-63', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-14 17:45', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-63', 'lead-63', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-14 12:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-64', 64, 'Grupo 2', 'Coquimbo', 'Los Vilos', 'Decreto escasez', 'Christian Gross Hidalgo', 'alcaldia@losvilos.cl', 'DIMAO Los Vilos', 'dimao@losvilos.cl', '+56 53 254 1133', 'Secpla', 'secpla@losvilos.cl', '+56 53 254 1100', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@losvilos.cl', 'APR Quilimarí / Los Vilos', 'losvilos.cl', 'Escasez de agua potable por intrusión salina en pozos costeros', 'Mini desaladora portátil para escuela rural', 'Alta - 5/5', 5, 'CONTACTADO', 'agent-1', '2026-05-15 15:10', '24 HORAS', 120, 49680);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-64', 'lead-64', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-15 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-64', 'lead-64', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Mini desaladora portátil para escuela rural.', '2026-05-15 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-65', 65, 'Grupo 2', 'Coquimbo', 'Salamanca', 'Decreto escasez', 'Gerardo Rojas Escudero', 'alcaldia@salamanca.cl', 'Juan Pablo Cortés', 'jcortes@salamanca.cl', '+56 53 255 1100', 'Secpla', 'secpla@salamanca.cl', '+56 53 255 1110', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@salamanca.cl', 'APR Chalinga / Salamanca', 'salamanca.cl', 'Presión hídrica minera e impacto en napas subterráneas', 'Filtros industriales para APR con metales pesados', 'Alta - 4/5', 4, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 100, 41500);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-66', 66, 'Grupo 2', 'Coquimbo', 'La Serena', 'Decreto escasez', 'Roberto Jacob Jure', 'alcalde@laserena.cl', 'Héctor Rosales', 'hrosales@laserena.cl', '+56 51 220 6600', 'Secpla', 'secpla@laserena.cl', '+56 51 220 6610', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@laserena.cl', 'APR Altovalsol / Las Rojas', 'laserena.cl', 'Bajo nivel del Embalse Puclaro; amenaza a riego de parques', 'Planta de tratamiento terciario para lavados públicos', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 78, 32448);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-67', 67, 'Grupo 2', 'Coquimbo', 'Coquimbo', 'Decreto escasez', 'Ali Manouchehri Moghadam', 'alcalde@coquimbo.cl', 'DIMAO Coquimbo', 'medioambiente@coquimbo.cl', '+56 51 233 4400', 'Secpla', 'secpla@coquimbo.cl', '+56 51 233 4410', 'Gore Coquimbo', 'gobernador@gorecoquimbo.cl', '+56 51 220 7100', 'Por confirmar', 'consejo@coquimbo.cl', 'APR Pan de Azúcar / El Sauce', 'coquimbo.cl', 'Red de agua saturada; necesidad urgente de riego de áreas verdes', 'Reúso de lagunas de lodos inactivas', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-4', '2026-05-18 11:00', NULL, 108, 45036);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-67', 'lead-67', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-18 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-67', 'lead-67', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso de lagunas de lodos inactivas.', '2026-05-18 15:10', 'Carlos Valenzuela');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-67', 'lead-67', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Red de agua saturada; necesidad urgente de riego de áreas verdes. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-18 11:00', 'Carlos Valenzuela');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-68', 68, 'Grupo 2', 'O''Higgins', 'Rengo', 'Decreto escasez', 'Carlos Soto Gonzalez', 'alcalde@rengo.cl', 'Sandra Valenzuela', 'svalenzuela@rengo.cl', '+56 72 251 3105', 'Secpla Rengo', 'secpla@rengo.cl', '+56 72 251 3100', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@rengo.cl', 'APR Chanqueahue / Rengo', 'rengo.cl', 'Alta evaporación en tranques de riego frutícola', 'Cubiertas flotantes y sensores de caudal SCADA', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 112, 46816);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-69', 69, 'Grupo 2', 'O''Higgins', 'San Vicente', 'Decreto escasez', 'Jaime González Ramírez', 'alcalde@sanvicente.cl', 'Jaime Flores', 'jflores@sanvicente.cl', '+56 72 236 1200', 'Secpla', 'secpla@sanvicente.cl', '+56 72 236 1210', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@sanvicente.cl', 'APR Toquihua / El Tambo', 'sanvicente.cl', 'Colmatación de canales de riego e incapacidad de llenado APR', 'Reúso de escorrentías urbanas purificadas', 'Media - 3/5', 3, 'CONTACTADO', 'agent-2', '2026-05-20 15:10', '24 HORAS', 87, 36453);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-69', 'lead-69', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-20 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-69', 'lead-69', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso de escorrentías urbanas purificadas.', '2026-05-20 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-70', 70, 'Grupo 2', 'O''Higgins', 'Santa Cruz', 'Decreto escasez', 'William Arévalo Cornejo', 'alcaldia@santacruz.cl', 'Claudia López', 'clopez@santacruz.cl', '+56 72 282 2300', 'Secpla Santa Cruz', 'secpla@santacruz.cl', '+56 72 282 2310', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@santacruz.cl', 'APR Apalta / Santa Cruz Rural', 'santacruz.cl', 'Demanda hídrica vitivinícola competitiva frente a APR', 'Piloto de recirculación hídrica corporativa-comunal', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-3', '2026-05-21 11:00', NULL, 120, 50400);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-70', 'lead-70', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-21 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-70', 'lead-70', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Piloto de recirculación hídrica corporativa-comunal.', '2026-05-21 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-70', 'lead-70', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Demanda hídrica vitivinícola competitiva frente a APR. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-21 11:00', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-71', 71, 'Grupo 2', 'O''Higgins', 'Chimbarongo', 'Decreto escasez', 'Marco Contreras Jorquera', 'alcalde@chimbarongo.cl', 'Dir. Medio Ambiente', 'medioambiente@chimbarongo.cl', '+56 72 278 1100', 'Secpla', 'secpla@chimbarongo.cl', '+56 72 278 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@chimbarongo.cl', 'APR Codegua / Chimbarongo', 'chimbarongo.cl', 'Falta de pozos profundos para APR de mimbreros', 'Telemetría SCADA solar para control de pozos', 'Media - 3/5', 3, 'CERRADO_PERDIDO', 'agent-4', '2026-05-22 09:30', NULL, 93, 39153);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-71', 'lead-71', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Carlos Valenzuela debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-22 09:30', 'Sistema');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-72', 72, 'Grupo 2', 'O''Higgins', 'Pichidegua', 'Decreto escasez', 'Marcos Fuentes Cornejo', 'alcaldia@pichidegua.cl', 'Carlos Gaete', 'medioambiente@pichidegua.cl', '+56 72 235 1200', 'Secpla', 'secpla@pichidegua.cl', '+56 72 235 1210', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@pichidegua.cl', 'APR Pichidegua Centro / San Roberto', 'pichidegua.cl', 'Sequía severa de canales y pérdida de cultivos', 'Reúso del 95% del agua industrial de viñas', 'Alta - 4/5', 4, 'PROPUESTA_ENVIADA', 'agent-1', '2026-05-23 17:45', '2026-06-10', 128, 54016);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-72', 'lead-72', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Sofía Medina debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-23 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-72', 'lead-72', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Reúso del 95% del agua industrial de viñas.', '2026-05-23 15:10', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-72', 'lead-72', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Sequía severa de canales y pérdida de cultivos. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-23 11:00', 'Sofía Medina');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-72', 'lead-72', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-23 17:45', 'Sofía Medina');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-73', 73, 'Grupo 2', 'O''Higgins', 'Graneros', 'Decreto escasez', 'Claudio Segovia Cofré', 'alcaldia@graneros.cl', 'Patricio Leyton', 'medioambiente@graneros.cl', '+56 72 247 1100', 'Secpla', 'secpla@graneros.cl', '+56 72 247 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@graneros.cl', 'APR Graneros Central', 'graneros.cl', 'Bajo nivel freático por bombeo industrial desmedido', 'Auditoría de caudal y telemetría en pozos municipales', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-2', NULL, NULL, 99, 41877);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-74', 74, 'Grupo 2', 'O''Higgins', 'Las Cabras', 'Decreto escasez', 'Juan Pablo Flores Astorga', 'alcaldia@lascabras.cl', 'Ignacio Tapia', 'itapia@lascabras.cl', '+56 72 250 1100', 'Secpla', 'secpla@lascabras.cl', '+56 72 250 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@lascabras.cl', 'APR Llallauquén / Rapel', 'lascabras.cl', 'Estrés severo por turismo y regantes de Lago Rapel', 'Sistema de filtrado ultra violeta para agua potable rural', 'Alta - 4/5', 4, 'CONTACTADO', 'agent-3', '2026-05-25 15:10', '24 HORAS', 136, 57664);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-74', 'lead-74', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-25 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-74', 'lead-74', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Sistema de filtrado ultra violeta para agua potable rural.', '2026-05-25 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-75', 75, 'Grupo 2', 'O''Higgins', 'Mostazal', 'Decreto escasez', 'Santiago Gárate Guajardo', 'alcaldia@mostazal.cl', 'Juan Salinas', 'jsalinas@mostazal.cl', '+56 72 249 1100', 'Secpla Mostazal', 'secpla@mostazal.cl', '+56 72 249 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@mostazal.cl', 'APR Mostazal Secano', 'mostazal.cl', 'Alta desertificación y escasez en el secano interior', 'Tratamiento de lodos húmedos y recirculado', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 140, 59500);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-76', 76, 'Grupo 2', 'O''Higgins', 'Requínoa', 'Decreto escasez', 'Waldo Valdivia Montecinos', 'alcaldia@requinoa.cl', 'Francisco Rojas', 'frojas@requinoa.cl', '+56 72 251 1100', 'Secpla', 'secpla@requinoa.cl', '+56 72 251 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@requinoa.cl', 'APR El Abra / Requínoa', 'requinoa.cl', 'Falta de agua para riego de plazas públicas', 'Válvulas neumáticas automáticas para optimizar caudal diario', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 144, 61344);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-77', 77, 'Grupo 2', 'O''Higgins', 'Machalí', 'Decreto escasez', 'Juan Carlos Abud Parra', 'alcalde@machali.cl', 'Claudio Aravena', 'medioambiente@machali.cl', '+56 72 273 1100', 'Secpla Machalí', 'secpla@machali.cl', '+56 72 273 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@machali.cl', 'APR Coya / Machalí', 'machali.cl', 'Fuerte expansión residencial de media altura desprovista de agua', 'Recuperación de aguas de condominios para áreas verdes', 'Alta - 4/5', 4, 'CERRADO_GANADO', 'agent-2', '2026-05-03 12:00', NULL, 148, 63196);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-77', 'lead-77', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-03 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-77', 'lead-77', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Recuperación de aguas de condominios para áreas verdes.', '2026-05-03 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-77', 'lead-77', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Fuerte expansión residencial de media altura desprovista de agua. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-03 11:00', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-77', 'lead-77', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-03 17:45', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-77', 'lead-77', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-03 12:00', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-78', 78, 'Grupo 2', 'O''Higgins', 'Doñihue', 'Decreto escasez', 'Pabla Ponce Sougarret', 'alcaldia@donihue.cl', 'Enrique Céspedes', 'ecespedes@donihue.cl', '+56 72 246 1100', 'Secpla', 'secpla@donihue.cl', '+56 72 246 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@donihue.cl', 'APR Lo Miranda / Doñihue', 'donihue.cl', 'Dificultad de llenado de piscinas de piscicultura artesanal', 'Planta modular compacta de recirculación', 'Media - 3/5', 3, 'POR_PROSPECTAR', 'agent-3', NULL, NULL, 114, 48792);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-79', 79, 'Grupo 2', 'O''Higgins', 'Coltauco', 'Decreto escasez', 'Félix Sánchez Figueroa', 'alcaldia@coltauco.cl', 'Daniela Oyarzún', 'medioambiente@coltauco.cl', '+56 72 242 1100', 'Secpla Coltauco', 'secpla@coltauco.cl', '+56 72 242 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@coltauco.cl', 'APR Loreto / Coltauco', 'coltauco.cl', 'Falta de agua para APR de sectores altos', 'Estación de bombeo de emergencia combinada', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-4', NULL, NULL, 156, 66924);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-80', 80, 'Grupo 2', 'O''Higgins', 'Peumo', 'Decreto escasez', 'Carlos Aliaga Donoso', 'alcaldia@peumo.cl', 'Fabiola Cabello', 'fcabello@peumo.cl', '+56 72 256 1100', 'Secpla Peumo', 'secpla@peumo.cl', '+56 72 256 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@peumo.cl', 'APR Peumo Central', 'peumo.cl', 'Falta de agua para pequeños productores de paltos', 'Piloto de aspersión ultrasónica de bajo caudal', 'Media - 4/5', 4, 'POR_PROSPECTAR', 'agent-1', NULL, NULL, 160, 68800);
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-81', 81, 'Grupo 2', 'O''Higgins', 'Navidad', 'Decreto escasez', 'Yanko Blumen Antivilo', 'alcaldia@navidad.cl', 'Constanza Leyton', 'medioambiente@navidad.cl', '+56 72 284 1100', 'Secpla Navidad', 'secpla@navidad.cl', '+56 72 284 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@navidad.cl', 'APR Rapel costero / Navidad', 'navidad.cl', 'Erosión extrema del suelo y sequía del secano costero', 'Planta de niebla y purificación de vertientes marinas', 'Alta - 4/5', 4, 'EN_NEGOCIACION', 'agent-2', '2026-05-07 11:00', NULL, 164, 70684);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-81', 'lead-81', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Gabriel Castro debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-07 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-81', 'lead-81', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Planta de niebla y purificación de vertientes marinas.', '2026-05-07 15:10', 'Gabriel Castro');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-81', 'lead-81', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Erosión extrema del suelo y sequía del secano costero. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-07 11:00', 'Gabriel Castro');
INSERT OR IGNORE INTO leads (
      id, n, grupo, region, comuna, estres_hidrico, alcalde, email_alcaldia,
      dir_medio_ambiente, email_ma, tel_ma, secpla_nombre, secpla_email, secpla_fono,
      gobernador_regional, email_gore, fono_gore, concejal_clave, email_concejal,
      apr_clave, contacto_apr, dolor_hidrico, oportunidad, score, score_numeric,
      estado, assigned_agent_id, last_contact_date, next_follow_up_date,
      m3_proposed, contract_value
    ) VALUES ('lead-82', 82, 'Grupo 2', 'O''Higgins', 'Pichilemu', 'Decreto escasez', 'Cristian Pozo Parraguez', 'alcalde@pichilemu.cl', 'DIMAO Pichilemu', 'dimao@pichilemu.cl', '+56 72 291 1100', 'Secpla Pichilemu', 'secpla@pichilemu.cl', '+56 72 291 1110', 'Pablo Silva Amaya', 'gobernador@goreohiggins.cl', '+56 72 235 1200', 'Por confirmar', 'consejo@pichilemu.cl', 'APR Cáhuil / Pichilemu', 'pichilemu.cl', 'Colapso hídrico en temporada estacional de surf/turismo', 'Planta de reúso de aguas grises para complexes públicos', 'Alta - 5/5', 5, 'CERRADO_GANADO', 'agent-3', '2026-05-08 12:00', NULL, 210, 90720);
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('sys-init-82', 'lead-82', 'system', 'Asignación de Lead', 'Lead asignado automáticamente al agente Antonia Flores debido al alto estrés hídrico registrado (Decreto escasez).', '2026-05-08 09:30', 'Sistema');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-call-82', 'lead-82', 'call', 'Llamada preliminar con Dir. Medio Ambiente', 'Se contactó al departamento de Medio Ambiente para agendar reunión virtual. Mostraron interés en la tecnología de membranas (reúso) por la oportunidad de: Planta de reúso de aguas grises para complexes públicos.', '2026-05-08 15:10', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-meet-82', 'lead-82', 'meeting', 'Reunión Técnica de Diagnóstico', 'Presentación corporativa de Consorcio Ril Ligth S.A. Evaluamos el dolo hídrico: Colapso hídrico en temporada estacional de surf/turismo. El municipio solicita una propuesta estimativa de m³ diarios a recircular.', '2026-05-08 11:00', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-proposal-82', 'lead-82', 'email', 'Propuesta Económica & Proyecto Técnico Enviado', 'Envío oficial de propuesta formal y anteproyecto bajo modelo B.O.T (Build-Operate-Transfer). Se propone recircular el 95% del caudal del equipamiento deportivo/verde comunal.', '2026-05-08 17:45', 'Antonia Flores');
INSERT OR IGNORE INTO interaction_logs (
        id, lead_id, type, summary, details, date, agent_name
      ) VALUES ('int-won-82', 'lead-82', 'status_change', 'Firma de Contrato / Convenio de Colaboración', 'El alcalde de la comuna aprobó oficialmente adjudicar el proyecto piloto de reúso de agua para servicios municipales. Compromiso de instalación rápido.', '2026-05-08 12:00', 'Antonia Flores');
INSERT OR IGNORE INTO agents (
      id, name, role, email, color, leads_assigned, won_count, proposal_count, performance_score, rating, avatar
    ) VALUES ('1', 'Carlos Mendoza', 'Ingeniero de Proyectos Senior', 'c.mendoza@rillight.cl', '#3B82F6', 0, 0, 0, 0, 5.0, 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face');
INSERT OR IGNORE INTO agents (
      id, name, role, email, color, leads_assigned, won_count, proposal_count, performance_score, rating, avatar
    ) VALUES ('2', 'Andrea Valenzuela', 'Consultora de Economía Circular', 'a.valenzuela@rillight.cl', '#10B981', 0, 0, 0, 0, 5.0, 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=80&h=80&fit=crop&crop=face');
INSERT OR IGNORE INTO agents (
      id, name, role, email, color, leads_assigned, won_count, proposal_count, performance_score, rating, avatar
    ) VALUES ('3', 'Roberto Díaz', 'Gestor de Cuentas Públicas', 'r.diaz@rillight.cl', '#F59E0B', 0, 0, 0, 0, 5.0, 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&h=80&fit=crop&crop=face');
