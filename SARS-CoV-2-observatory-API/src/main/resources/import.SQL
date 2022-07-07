INSERT INTO tb_endereco (rua, numero, cep, bairro, cidade, complemento) values ('rua dos bobos', '0', '0000', 'bairro dos bobos', 'cidade dos bobos', 'complemento bobo');

INSERT INTO tb_hospital (nome, id_endereco) values ('hospital dos bosos', 1);

INSERT INTO tb_medico (crm, nome, cpf, id_endereco) values ('crmbobo', 'medico bobo', 'cpf bobo', 1);

INSERT INTO tb_hospital_cadastra_medico (id_hospital, crm_medico) values (1, 'crmbobo')