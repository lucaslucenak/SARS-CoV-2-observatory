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


--SELECT * FROM medico_Prescreve_Exame;
--SELECT * FROM endereco;
--SELECT * FROM hospital;
--SELECT * FROM hospital;
--SELECT * FROM hospital;
--SELECT * FROM medico;
--SELECT * FROM paciente;
--SELECT * FROM enfermeiro;
--SELECT * FROM sintoma;
--SELECT * FROM leito;
--SELECT * FROM registro_desfecho;
--SELECT * FROM ficha_clinica;
--SELECT * FROM hospital_cadastra_medico;
--SELECT * FROM hospital_atende_paciente;
--SELECT * FROM hospital_cadastra_enfermeiro;
--SELECT * FROM ficha_clinica_tem_sintoma;
--SELECT * FROM enfermeiro_difere_ficha_clinica;
--SELECT * FROM medico_visita_paciente;
--SELECT * FROM medico_prescreve_tratamento;
