INSERT INTO endereco (rua, numero, cep, bairro, cidade) VALUES ('rua iremar marinho', '123', '58000-400', 'bairro dos bobos', 'campina grande');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) VALUES ('rua juraci palhano', '22', '58000-012', 'catole', 'campina grande', 'perto de lá');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) VALUES ('avenida floriano peixoto', '912', '58000-020', 'sao josé', 'campina grande', 'perto daqui');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) VALUES ('rua alguma coisa da silva', '234', '12345-020', 'centro', 'campina grande', 'perto do são josé');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) VALUES ('rua almirante filho', '412', '58654-020', 'liberdade', 'campina grande', 'perto do catolé');

INSERT INTO hospital (nome, id_endereco) VALUES ('João XXIII', 1);
INSERT INTO hospital (nome, id_endereco) VALUES ('Trauma', 2);
INSERT INTO hospital (nome, id_endereco) VALUES ('UPA', 3);

INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_inicio) VALUES ('32145321-1/BR', 'Daniel', '321.123.321-21',  '2001-05-05', 1, '2020-05-14');
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_fim, data_inicio) VALUES ('32555321-0/BR', 'Lucas', '321.123.321-21', '2001-10-03', 3, '2022-07-14', '2020-08-25');
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_inicio) VALUES ('67555321-0/BR', 'Carlos', '331.122.321-29', '2001-10-03', 3, '2020-08-25');
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_inicio) VALUES ('97125321-0/BR', 'Joao', '888.333.222-44', '2001-10-03', 3, '2020-08-25');
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_inicio) VALUES ('20865321-0/BR', 'Farias', '111.333.222-44', '1905-10-03', 3, '2020-08-25');
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_inicio) VALUES ('00865321-0/BR', 'Montecarlos', '555.222.333-11', '2000-10-03', 2, '2020-08-25');

INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Vinicius', '999.888.777-22', '2020-04-13', 4);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Joseilton', '992.458.877-02', '2010-03-13', 4);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Maria', '912.478.817-82', '2010-01-13', 5);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Gabriel', '012.978.827-72', '2017-04-13', 5);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Mariano', '912.958.117-92', '2005-08-13', 5);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Jonatan', '912.912.912-91', '2001-11-13', 4);

INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, data_fim, id_endereco) VALUES ('453627PB', 'Jailma', '321.123.943-21', '1997-05-05', '2005-05-05', 1);
INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, id_endereco) VALUES ('453927PB', 'Joselito', '321.123.947-21', '1992-05-05', 1);
INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, id_endereco) VALUES ('321927PB', 'Jeremias', '000.000.947-21', '1995-12-05', 1);
INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, id_endereco) VALUES ('213927PB', 'Vanderleia', '321.123.947-21', '2000-12-05', 1);
INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, id_endereco) VALUES ('444927PB', 'Marisvaldo', '321.123.947-21', '1980-05-01', 1);

INSERT INTO sintoma (nome, descricao) VALUES ('Febre', 'Temperatura maior ou igual a 38°C');
INSERT INTO sintoma (nome, descricao) VALUES ('Tosse', 'Tosse com catarro');
INSERT INTO sintoma (nome, descricao) VALUES ('Sinusite', 'Moderada');

INSERT INTO leito (descricao, localizacao, id_hospital) VALUES ('Leito para estado crônico', 'Quarto 54B', 1);
INSERT INTO leito (descricao, localizacao, id_hospital) VALUES ('Leito para entubamento', 'Quarto 51B', 2);

INSERT INTO registro_desfecho (situacao, crm_medico) VALUES ('Saudável', '32145321-1/BR');
--INSERT INTO registro_desfecho (situacao, crm_medico) VALUES ('Falecido', '32145321-1/BR');

INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, id_paciente, id_leito, data_entrada) VALUES (80.45, 1.79, '12/8', 98, 1, 1, '2020-06-24');
INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, id_paciente, id_leito, data_entrada) VALUES (100.85, 1.58, '15/9', 96, 2, 1, '2020-08-31');
INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, id_paciente, id_registro_desfecho, id_leito, data_entrada, data_saida) VALUES (75.85, 1.78, '18/10', 99, 3, 1, 2, '2020-08-31', '2021-01-01');
INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, id_paciente, id_leito, data_entrada, data_saida) VALUES (58.45, 1.58, '15/9', 98, 4, 1, '2020-08-31', '2021-01-01');
INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, id_paciente, id_leito, data_entrada) VALUES (68.40, 1.75, '12/8', 99, 5, 2, '2020-05-10');
INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, id_paciente, id_leito, data_entrada) VALUES (84.65, 1.95, '17/20', 98, 6, 2, '2020-05-12');

INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (1, '32145321-1/BR');
INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (3, '32555321-0/BR');
INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (2, '67555321-0/BR');
INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (2, '97125321-0/BR');
INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (3, '20865321-0/BR');
INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (2, '00865321-0/BR');

INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (1, 1);
INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (3, 2);
INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (2, 4);
INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (2, 5);
INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (2, 6);

INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (1, '453627PB');
INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (3, '453627PB');
INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (3, '321927PB');
INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (2, '213927PB');
INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (3, '444927PB');

INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (1, 2);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (2, 1);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (1, 1);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (2, 4);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (1, 4);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (1, 5);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (2, 6);

INSERT INTO enfermeiro_difere_ficha_clinica (id_ficha_clinica, coren_enfermeiro) VALUES (1, '453627PB');
INSERT INTO enfermeiro_difere_ficha_clinica (id_ficha_clinica, coren_enfermeiro) VALUES (2, '453927PB');

INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('32555321-0/BR', 2);
INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('32555321-0/BR', 1);
INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('97125321-0/BR', 4);
INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('97125321-0/BR', 3);
INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('97125321-0/BR', 6);

INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('32145321-1/BR', 2, 'Caixa de espelhos', 'modalidade terapêutica baseada no feedback visual, como forma de construção de uma nova imagem mental do membro afetado, promovendo a reorganização cortical', '2022-07-18');
INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('67555321-0/BR', 1, 'Crisoterapia', 'consiste na utilização de ouro ou os sais desse mineral no tratamento curativo ou paliativo de seres humanos', '2022-07-20');
INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('97125321-0/BR', 4, 'Crisoterapia', 'consiste na utilização de ouro ou os sais desse mineral no tratamento curativo ou paliativo de seres humanos', '2022-07-20');
INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('97125321-0/BR', 3, 'Caixa de espelhos', 'modalidade terapêutica baseada no feedback visual, como forma de construção de uma nova imagem mental do membro afetado, promovendo a reorganização cortical', '2022-08-23');
INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('67555321-0/BR', 5, 'Crisoterapia', 'consiste na utilização de ouro ou os sais desse mineral no tratamento curativo ou paliativo de seres humanos', '2022-07-20');
INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('67555321-0/BR', 6, 'Crisoterapia', 'consiste na utilização de ouro ou os sais desse mineral no tratamento curativo ou paliativo de seres humanos', '2022-07-20');

INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, descricao, data_realizacao, data_prescricao) VALUES ('97125321-0/BR', 1, 'Exame de sangue', 'Imunoglobinas e hemoglobinas', '2022-07-15', '2020-07-1');
INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, data_realizacao, data_prescricao) VALUES ('32555321-0/BR', 2, 'Glicemia', '2022-07-18', '2020-09-25');
INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, data_realizacao, data_prescricao) VALUES ('97125321-0/BR', 4, 'Glicemia', '2022-07-18', '2020-09-25');
INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, descricao, data_realizacao, data_prescricao) VALUES ('97125321-0/BR', 5, 'Exame de sangue', 'Imunoglobinas e hemoglobinas', '2022-07-20', '2020-07-28');
INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, descricao, data_realizacao, data_prescricao) VALUES ('97125321-0/BR', 6, 'Exame de sangue', 'Imunoglobinas e hemoglobinas', '2022-07-20', '2020-07-28');
