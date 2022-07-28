SELECT DISTINCT h.nome
FROM ficha_clinica fc
INNER JOIN leito l ON (fc.id_leito = l.id)
INNER JOIN hospital h ON (l.id_hospital = h.id)
WHERE ((fc.data_entrada BETWEEN '2020-03-01' AND '2020-10-22') AND (fc.data_saida IS NULL));

SELECT p.nome as "nome paciente", s.nome as "nome sintoma", m.nome AS "nome medico"
FROM ficha_clinica fc
INNER JOIN paciente p ON (fc.id_paciente = p.id)
INNER JOIN ficha_clinica_tem_sintoma fcts ON (fcts.id_ficha_clinica = fc.id)
INNER JOIN sintoma s ON (fcts.id_sintoma = s.id)
INNER JOIN medico_prescreve_tratamento mpt ON (mpt.id_paciente = p.id)
INNER JOIN medico m ON (mpt.crm_medico = m.crm)
WHERE (m.nome = 'Carlos'); --TROCAR DANIEL POR CARLOS, ACRESCENTAR CARLOS NO BANCO KKKKKK E SEUS SINTOMAS E PACIENTES E LOGO TUDO

SELECT mpe.data_prescricao AS "id exame", mpe.crm_medico, m.nome AS "nome medico", mpe.id_paciente, mpe.nome
FROM medico_Prescreve_Exame mpe
INNER JOIN medico m ON (mpe.crm_medico = m.crm)
WHERE ((m.nome = 'Joao') AND (mpe.data_prescricao BETWEEN '2020-06-01' AND '2020-09-30'));

SELECT h.nome, COUNT(p.id) as "total de pacientes"
FROM hospital_atende_paciente hap
INNER JOIN hospital h ON (hap.id_hospital = h.id)
INNER JOIN paciente p ON (hap.id_paciente = p.id)
INNER JOIN ficha_clinica fc ON (fc.id_paciente = p.id)
WHERE ((fc.id_leito is not NULL) AND (fc.data_entrada BETWEEN '2020-05-01' AND '2020-07-30') AND (fc.data_saida IS NULL))
GROUP BY h.nome;


SELECT h.nome, (COUNT(hce.coren_enfermeiro) / ( select COUNT(e.coren) FROM enfermeiro e)) AS "media"
FROM hospital h
INNER JOIN hospital_cadastra_enfermeiro hce ON (hce.id_hospital = h.id)
INNER JOIN enfermeiro e ON (hce.coren_enfermeiro = e.coren)
GROUP BY (h.nome);









SELECT h.nome, COUNT(hce.coren_enfermeiro) / COUNT(e.coren) AS "media enfermeiros", COUNT(hcm.crm_medico) / COUNT(m.crm) AS "media medicos"
FROM hospital h
INNER JOIN hospital_cadastra_medico hcm ON (hcm.id_hospital = h.id)
INNER JOIN medico m ON (M.crm = HCM.crm_medico)
INNER JOIN hospital_cadastra_enfermeiro hce ON (hce.id_hospital = h.id)
INNER JOIN enfermeiro e ON (e.coren = hce.coren_enfermeiro)
GROUP BY (h.nome);