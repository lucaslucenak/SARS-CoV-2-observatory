CREATE TABLE endereco (
	id SERIAL,
	rua VARCHAR(200),
	numero VARCHAR(10),
	cep VARCHAR(10),
	bairro VARCHAR(200),
	cidade VARCHAR(200),
	complemento TEXT,
	PRIMARY KEY (id)
);

 CREATE table hospital (
 	id SERIAL,
 	nome VARCHAR(255),
 	id_endereco INT,
 	PRIMARY KEY (id),
 	FOREIGN KEY (id_endereco) REFERENCES endereco (id)
 );
 
CREATE table medico (
	crm VARCHAR(30),
	nome VARCHAR(255),
	cpf VARCHAR(14),
	data_nascimento DATE,
	data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	data_fim DATE,
	id_endereco INT,
	PRIMARY KEY (crm),
	FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);

CREATE table Paciente (
	id SERIAL,
	nome VARCHAR(255),
	cpf VARCHAR(14),
	data_nascimento DATE,
	id_endereco INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_endereco) REFERENCES endereco(id)
);

CREATE table Enfermeiro (
	coren VARCHAR(15),
	nome VARCHAR(255),
	cpf VARCHAR(14),
	data_nascimento DATE,
	data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	data_fim DATE,
	id_endereco INT,
	PRIMARY KEY(coren),
	FOREIGN KEY(id_endereco) REFERENCES endereco(id)
);

CREATE table sintoma (
	id SERIAL,
	nome VARCHAR(255) UNIQUE,
	descricao TEXT,
	PRIMARY KEY (id)
);

CREATE table Leito (
	id SERIAL,
	descricao TEXT,
	localizacao VARCHAR(25),
	id_hospital INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_hospital) REFERENCES hospital(id)
);

CREATE table registro_desfecho (
	id SERIAL,
	situacao VARCHAR(255),
	crm_medico VARCHAR(30),
	PRIMARY KEY (id),
	FOREIGN KEY (crm_medico) REFERENCES medico(crm)
);

CREATE table ficha_clinica (
	id SERIAL,
	massa DECIMAL,
	altura DECIMAL,
	pressao VARCHAR(10),
	oxigenacao_sangue INT,
	data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	data_saida DATE,
	id_paciente INT,
	id_registro_desfecho INT,
	id_leito INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_paciente) REFERENCES paciente(id),
	FOREIGN KEY(id_registro_desfecho) REFERENCES registro_desfecho(id),
	FOREIGN KEY(id_leito) REFERENCES leito(id)
);

CREATE table hospital_cadastra_medico (
	id_hospital INT,
	crm_medico VARCHAR(30),
	data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id_hospital, crm_medico, data_cadastro),
	FOREIGN KEY (id_hospital) REFERENCES hospital(id),
	FOREIGN KEY (crm_medico) REFERENCES medico(crm)
);

CREATE table hospital_atende_paciente (
	id_hospital INT,
	id_paciente INT,
	data_atendimento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id_hospital, id_paciente, data_atendimento),
	FOREIGN KEY (id_hospital) REFERENCES hospital(id),
	FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

CREATE table hospital_cadastra_enfermeiro (
	id_hospital INT,
	coren_enfermeiro VARCHAR(15),
	data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id_hospital, coren_enfermeiro, data_cadastro),
	FOREIGN KEY (id_hospital) REFERENCES hospital(id),
	FOREIGN KEY (coren_enfermeiro) REFERENCES enfermeiro(coren)
);

CREATE table ficha_clinica_tem_sintoma (
	id_sintoma INT,
	id_ficha_clinica INT,
	data_sintoma TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(id_sintoma, id_ficha_clinica, data_sintoma),
	FOREIGN KEY(id_sintoma) REFERENCES sintoma(id),
	FOREIGN KEY(id_ficha_clinica) REFERENCES ficha_clinica(id)
);

CREATE table Enfermeiro_Difere_Ficha_Clinica  (
	id_ficha_clinica INT,
	coren_enfermeiro VARCHAR(15),
	data_diferimento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(id_ficha_clinica, coren_enfermeiro, data_diferimento),
	FOREIGN KEY(id_ficha_clinica) REFERENCES ficha_clinica(id),
	FOREIGN KEY(coren_enfermeiro) REFERENCES enfermeiro(coren)
);

CREATE table medico_visita_paciente (
	crm_medico VARCHAR(30),
	id_paciente INT,
	data_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (crm_medico, id_paciente, data_visita),
	FOREIGN KEY (crm_medico) REFERENCES medico(crm),
	FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

CREATE table medico_prescreve_tratamento (
	crm_medico VARCHAR(30),
	id_paciente INT,
	nome VARCHAR(255),
	descricao TEXT,
	data_prescricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	data_realicacao DATE,
	PRIMARY KEY (crm_medico, id_paciente, data_prescricao),
	FOREIGN KEY (crm_medico) REFERENCES medico(crm),
	FOREIGN KEY (id_paciente) REFERENCES paciente(id)
);

CREATE table medico_Prescreve_Exame (
	crm_medico VARCHAR(30),
	id_paciente INT,
	nome VARCHAR(255),
	descricao TEXT,
	data_prescricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	data_realizacao DATE,
	PRIMARY KEY(crm_medico, id_paciente, data_prescricao),
	FOREIGN KEY(crm_medico) REFERENCES medico(crm),
	FOREIGN KEY(id_paciente) REFERENCES paciente(id)
);


INSERT INTO endereco (rua, numero, cep, bairro, cidade) VALUES ('rua iremar marinho', '123', '58000-400', 'bairro dos bobos', 'campina grande');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) VALUES ('rua juraci palhano', '22', '58000-012', 'catole', 'campina grande', 'perto de lá');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) VALUES ('avenida floriano peixoto', '912', '58000-020', 'sao josé', 'campina grande', 'perto daqui');

INSERT INTO hospital (nome, id_endereco) VALUES ('João XXIII', 1);
INSERT INTO hospital (nome, id_endereco) VALUES ('Trauma', 2);
INSERT INTO hospital (nome, id_endereco) VALUES ('UPA', 3);

INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco) VALUES ('32145321-1/BR', 'Daniel', '321.123.321-21',  '2001-05-05', 1);
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_fim) VALUES ('32555321-0/BR', 'Lucas', '321.123.321-21', '2001-10-03', 3, '2022-07-14');

INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Vinicius', '999.888.777-22', '2020-04-13', 2);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Joseilton', '992.458.877-02', '2010-03-13', 2);

INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, data_fim, id_endereco) VALUES ('453627PB', 'Jailma', '321.123.943-21', '1997-05-05', '2005-05-05', 1);
INSERT INTO enfermeiro (coren, nome, cpf, data_nascimento, id_endereco) VALUES ('453927PB', 'Joselito', '321.123.947-21', '1992-05-05', 1);

INSERT INTO sintoma (nome, descricao) VALUES ('Febre', 'Temperatura maior ou igual a 38°C');
INSERT INTO sintoma (nome, descricao) VALUES ('Tosse', 'Tosse com catarro');

INSERT INTO leito (descricao, localizacao, id_hospital) VALUES ('Leito para estado crônico', 'Quarto 54B', 1);
INSERT INTO leito (descricao, localizacao, id_hospital) VALUES ('Leito para entubamento', 'Quarto 51B', 2);

INSERT INTO registro_desfecho (situacao, crm_medico) VALUES ('Saudável', '32145321-1/BR');
INSERT INTO registro_desfecho (situacao, crm_medico) VALUES ('Falecido', '32145321-1/BR');

INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, data_saida, id_paciente, id_registro_desfecho, id_leito) VALUES (80.45, 1.79, '12/8', 98, '2022-07-14', 1, 2, 1);
INSERT INTO ficha_clinica (massa, altura, pressao, oxigenacao_sangue, data_saida, id_paciente, id_registro_desfecho, id_leito) VALUES (100.85, 1.58, '15/9', 96, '2018-02-24', 2, 1, 1);

INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (1, '32145321-1/BR');
INSERT INTO hospital_cadastra_medico (id_hospital, crm_medico) VALUES (3, '32555321-0/BR');

INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (1, 1);
INSERT INTO hospital_atende_paciente (id_hospital, id_paciente) VALUES (3, 2);

INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (1, '453627PB');
INSERT INTO hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) VALUES (2, '453627PB');

INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (1, 2);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) VALUES (2, 1);

INSERT INTO enfermeiro_difere_ficha_clinica (id_ficha_clinica, coren_enfermeiro) VALUES (1, '453627PB');
INSERT INTO enfermeiro_difere_ficha_clinica (id_ficha_clinica, coren_enfermeiro) VALUES (2, '453927PB');

INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('32555321-0/BR', 2);
INSERT INTO medico_visita_paciente (crm_medico, id_paciente) VALUES ('32555321-0/BR', 1);

INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('32145321-1/BR', 2, 'Caixa de espelhos', 'modalidade terapêutica baseada no feedback visual, como forma de construção de uma nova imagem mental do membro afetado, promovendo a reorganização cortical', '2022-07-18');
INSERT INTO medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) VALUES ('32145321-1/BR', 1, 'Crisoterapia', 'consiste na utilização de ouro ou os sais desse mineral no tratamento curativo ou paliativo de seres humanos', '2022-07-20');

INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, descricao, data_realizacao) VALUES ('32555321-0/BR', 1, 'Exame de sangue', 'Imunoglobinas e hemoglobinas', '2022-07-15');
INSERT INTO medico_Prescreve_Exame (crm_medico, id_paciente, nome, data_realizacao) VALUES ('32555321-0/BR', 2, 'Glicemia', '2022-07-18');

SELECT * FROM medico_Prescreve_Exame;
SELECT * FROM endereco;
SELECT * FROM hospital;
SELECT * FROM medico;
SELECT * FROM paciente;
SELECT * FROM enfermeiro;
SELECT * FROM sintoma;
SELECT * FROM leito;
SELECT * FROM registro_desfecho;
SELECT * FROM ficha_clinica;
SELECT * FROM hospital_cadastra_medico;
SELECT * FROM hospital_atende_paciente;
SELECT * FROM hospital_cadastra_enfermeiro;
SELECT * FROM ficha_clinica_tem_sintoma;
SELECT * FROM enfermeiro_difere_ficha_clinica;
SELECT * FROM medico_visita_paciente;
SELECT * FROM medico_prescreve_tratamento;
