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
	primary key (crm)
);

create table sintoma (
	id serial,
	nome varchar(255),
	descricao text,
	primary key (id)
);

create table registro_desfecho (
	id serial,
	situacao varchar(255),
	crm_medico varchar(30),
	primary key (id),
	foreign key (crm_medico) references medico(crm)
);

create table hospital_cadastra_medico (
	id_hospital int,
	crm_medico varchar(30),
	primary key (id_hospital, crm_medico),
	foreign key (id_hospital) references hospital(id),
	foreign key (crm_medico) references medico(crm)
);

create table hospital_atende_paciente (
	id_hospital int,
	id_paciente int,
	primary key (id_hospital, id_paciente),
	foreign key (id_hospital) references hospital(id),
	foreign key (id_paciente) references paciente(id)
);

create table hospital_cadastra_enfermeiro (
	id_hospital int,
	coren_enfermeiro varchar(15),
	primary key (id_hospital, coren_enfermeiro),
	foreign key (id_hospital) references hospital(id),
	foreign key (coren_enfermeiro) references enfermeiro(coren)
);

create table medico_visita_paciente (
	crm_medico varchar(30),
	id_paciente int,
	data_visita date default current_date,
	primary key (crm_medico, id_paciente),
	foreign key (crm_medico) references medico(crm),
	foreign key (id_paciente) references paciente(id)
);


create table medico_prescreve_tratamento (
	crm_medico varchar(30),
	id_paciente int,
	id serial,
	nome varchar(255),
	descricao text,
	data_prescricao date default current_date,
	data_realicacao date,
	primary key (crm_medico, id_paciente, id),
	foreign key (crm_medico) references medico(crm),
	foreign key (id_paciente) references paciente(id)
);