CREATE TABLE endereco (
	id serial,
	rua varchar(200),
	numero varchar(10),
	cep varchar(10),
	bairro varchar(200),
	cidade varchar(200),
	complemento TEXT,
	primary key (id)
);

 
 create table hospital (
 	id serial,
 	nome varchar(255),
 	id_endereco int,
 	primary key (id),
 	foreign key (id_endereco) references endereco (id)
 );
 
create table medico (
	crm varchar(30),
	nome varchar(255),
	cpf varchar(14),
	data_nascimento DATE,
	data_inicio TIMESTAMP default CURRENT_TIMESTAMP,
	data_fim date,
	id_endereco int,
	primary key (crm),
	foreign key (id_endereco) references endereco(id)
);

CREATE table Paciente (
	id SERIAL,
	nome varchar(255),
	cpf varchar(14),
	data_nascimento DATE,
	id_endereco INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_endereco) REFERENCES endereco(id)
);

CREATE table Enfermeiro (
	coren varchar(15),
	nome varchar(255),
	cpf varchar(14),
	data_nascimento DATE,
	data_inicio TIMESTAMP default CURRENT_TIMESTAMP,
	data_fim date,
	id_endereco INT,
	PRIMARY KEY(coren),
	FOREIGN KEY(id_endereco) REFERENCES endereco(id)
);

create table sintoma (
	id serial,
	nome varchar(255),
	descricao text,
	primary key (id)
);

CREATE table Leito (
	id SERIAL,
	descricao TEXT,
	localizacao varchar(25),
	id_hospital INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_hospital) REFERENCES hospital(id)
);

create table registro_desfecho (
	id serial,
	situacao varchar(255),
	crm_medico varchar(30),
	primary key (id),
	foreign key (crm_medico) references medico(crm)
);

CREATE table Ficha_Clinica (
	id SERIAL,
	massa decimal,
	altura decimal,
	pressao varchar(10),
	oxigenacao_sangue INT,
	data_entrada TIMESTAMP default CURRENT_TIMESTAMP,
	data_saida date,
	id_paciente INT,
	id_registro_desfecho INT,
	id_leito INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_paciente) REFERENCES paciente(id),
	FOREIGN KEY(id_registro_desfecho) REFERENCES registro_desfecho(id),
	FOREIGN KEY(id_leito) REFERENCES leito(id)
);

create table hospital_cadastra_medico (
	id_hospital int,
	crm_medico varchar(30),
	data_cadastro TIMESTAMP default CURRENT_TIMESTAMP,
	primary key (id_hospital, crm_medico, data_cadastro),
	foreign key (id_hospital) references hospital(id),
	foreign key (crm_medico) references medico(crm)
);

create table hospital_atende_paciente (
	id_hospital int,
	id_paciente int,
	data_atendimento TIMESTAMP default CURRENT_TIMESTAMP,
	primary key (id_hospital, id_paciente, data_atendimento),
	foreign key (id_hospital) references hospital(id),
	foreign key (id_paciente) references paciente(id)
);

create table hospital_cadastra_enfermeiro (
	id_hospital int,
	coren_enfermeiro varchar(15),
	data_cadastro TIMESTAMP default CURRENT_TIMESTAMP,
	primary key (id_hospital, coren_enfermeiro, data_cadastro),
	foreign key (id_hospital) references hospital(id),
	foreign key (coren_enfermeiro) references enfermeiro(coren)
);

CREATE table Ficha_clinica_tem_sintoma (
	id_sintoma INT,
	id_ficha_clinica INT,
	data_sintoma TIMESTAMP default CURRENT_TIMESTAMP,
	PRIMARY KEY(id_sintoma, id_ficha_clinica, data_sintoma),
	FOREIGN KEY(id_sintoma) REFERENCES sintoma(id),
	FOREIGN KEY(id_ficha_clinica) REFERENCES ficha_clinica(id)
);

CREATE table Enfermeiro_Difere_Ficha_Clinica  (
	id_ficha_clinica INT,
	coren_enfermeiro varchar(15),
	data_diferimento date,
	PRIMARY KEY(id_ficha_clinica, coren_enfermeiro, data_diferimento),
	FOREIGN KEY(id_ficha_clinica) REFERENCES ficha_clinica(id),
	FOREIGN KEY(coren_enfermeiro) REFERENCES enfermeiro(coren)
);

create table medico_visita_paciente (
	crm_medico varchar(30),
	id_paciente int,
	data_visita TIMESTAMP default CURRENT_TIMESTAMP,
	primary key (crm_medico, id_paciente, data_visita),
	foreign key (crm_medico) references medico(crm),
	foreign key (id_paciente) references paciente(id)
);

create table medico_prescreve_tratamento (
	crm_medico varchar(30),
	id_paciente int,
	nome varchar(255),
	descricao text,
	data_prescricao TIMESTAMP default CURRENT_TIMESTAMP,
	data_realicacao date,
	primary key (crm_medico, id_paciente, data_prescricao),
	foreign key (crm_medico) references medico(crm),
	foreign key (id_paciente) references paciente(id)
);

CREATE table Medico_Prescreve_Exame (
	crm_medico varchar(30),
	id_paciente INT,
	nome varchar(255),
	descricao TEXT,
	data_prescricao TIMESTAMP default CURRENT_TIMESTAMP,
	data_realizacao date,
	PRIMARY KEY(crm_medico, id_paciente, data_prescricao),
	FOREIGN KEY(crm_medico) REFERENCES medico(crm),
	FOREIGN KEY(id_paciente) REFERENCES paciente(id)
);

INSERT INTO endereco (rua, numero, cep, bairro, cidade) values ('rua iremar marinho', '123', '58000-400', 'bairro dos bobos', 'campina grande');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) values ('rua juraci palhano', '22', '58000-012', 'catole', 'campina grande', 'perto de lá');
INSERT INTO endereco (rua, numero, cep, bairro, cidade, complemento) values ('avenida floriano peixoto', '912', '58000-020', 'sao josé', 'campina grande', 'perto daqui');

INSERT INTO hospital (nome, id_endereco) values ('João XXIII', 1);
INSERT INTO hospital (nome, id_endereco) values ('Trauma', 2);
INSERT INTO hospital (nome, id_endereco) values ('UPA', 3);

INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco) values ('32145321-1/BR', 'Daniel', '321.123.321-21',  '2001-05-05', 1);
INSERT INTO medico (crm, nome, cpf, data_nascimento, id_endereco, data_fim) values ('32555321-0/BR', 'Lucas', '321.123.321-21', '2001-10-03', 3, '2022-07-14');