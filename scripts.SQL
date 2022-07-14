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
	nome varchar(255) unique,
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

CREATE table ficha_clinica (
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

CREATE table ficha_clinica_tem_sintoma (
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
	data_diferimento TIMESTAMP default CURRENT_TIMESTAMP,
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

CREATE table medico_Prescreve_Exame (
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

INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Vinicius', '999.888.777-22', '2020-04-13', 2);
INSERT INTO paciente (nome, cpf, data_nascimento, id_endereco) VALUES ('Paciente Joseilton', '992.458.877-02', '2010-03-13', 2);

insert into enfermeiro (coren, nome, cpf, data_nascimento, data_fim, id_endereco) values ('453627PB', 'Jailma', '321.123.943-21', '1997-05-05', '2005-05-05', 1);
insert into enfermeiro (coren, nome, cpf, data_nascimento, id_endereco) values ('453927PB', 'Joselito', '321.123.947-21', '1992-05-05', 1);

INSERT INTO sintoma (nome, descricao) values ('Febre', 'Temperatura maior ou igual a 38°C');
INSERT INTO sintoma (nome, descricao) values ('Tosse', 'Tosse com catarro');

insert into leito (descricao, localizacao, id_hospital) values ('Leito para estado crônico', 'Quarto 54B', 1);
insert into leito (descricao, localizacao, id_hospital) values ('Leito para entubamento', 'Quarto 51B', 2);

insert into registro_desfecho (situacao, crm_medico) VALUES ('Saudável', '32145321-1/BR');
insert into registro_desfecho (situacao, crm_medico) VALUES ('Falecido', '32145321-1/BR');

insert into ficha_clinica (massa, altura, pressao, oxigenacao_sangue, data_saida, id_paciente, id_registro_desfecho, id_leito) values (80.45, 1.79, '12/8', 98, '2022-07-14', 1, 2, 1);
insert into ficha_clinica (massa, altura, pressao, oxigenacao_sangue, data_saida, id_paciente, id_registro_desfecho, id_leito) values (100.85, 1.58, '15/9', 96, '2018-02-24', 2, 1, 1);

insert into hospital_cadastra_medico (id_hospital, crm_medico) values (1, '32145321-1/BR');
insert into hospital_cadastra_medico (id_hospital, crm_medico) values (3, '32555321-0/BR');

insert into hospital_atende_paciente (id_hospital, id_paciente) values (1, 1);
insert into hospital_atende_paciente (id_hospital, id_paciente) values (3, 2);

insert into hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) values (1, '453627PB');
insert into hospital_cadastra_enfermeiro (id_hospital, coren_enfermeiro) values (2, '453627PB');

INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) values (1, 2);
INSERT INTO ficha_clinica_tem_sintoma (id_sintoma, id_ficha_clinica) values (2, 1);

insert into enfermeiro_difere_ficha_clinica (id_ficha_clinica, coren_enfermeiro) values (1, '453627PB');
insert into enfermeiro_difere_ficha_clinica (id_ficha_clinica, coren_enfermeiro) values (2, '453927PB');

insert into medico_visita_paciente (crm_medico, id_paciente) values ('32555321-0/BR', 2);
insert into medico_visita_paciente (crm_medico, id_paciente) values ('32555321-0/BR', 1);

insert into medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) values ('32145321-1/BR', 2, 'Caixa de espelhos', 'modalidade terapêutica baseada no feedback visual, como forma de construção de uma nova imagem mental do membro afetado, promovendo a reorganização cortical', '2022-07-18');
insert into medico_prescreve_tratamento (crm_medico, id_paciente, nome, descricao, data_realicacao) values ('32145321-1/BR', 1, 'Crisoterapia', 'consiste na utilização de ouro ou os sais desse mineral no tratamento curativo ou paliativo de seres humanos', '2022-07-20');

insert into medico_Prescreve_Exame (crm_medico, id_paciente, nome, descricao, data_realizacao) values ('32555321-0/BR', 1, 'Exame de sangue', 'Imunoglobinas e hemoglobinas', '2022-07-15');
insert into medico_Prescreve_Exame (crm_medico, id_paciente, nome, data_realizacao) values ('32555321-0/BR', 2, 'Glicemia', '2022-07-18');

select * from medico_Prescreve_Exame;
SELECT * FROM endereco;
select * from hospital;
select * from medico;
SELECT * from paciente;
select * from enfermeiro;
select * from sintoma;
select * from leito;
select * from registro_desfecho;
select * from ficha_clinica;
select * from hospital_cadastra_medico;
select * from hospital_atende_paciente;
select * from hospital_cadastra_enfermeiro;
SELECT * from ficha_clinica_tem_sintoma;
select * from enfermeiro_difere_ficha_clinica;
select * from medico_visita_paciente;
select * from medico_prescreve_tratamento;
