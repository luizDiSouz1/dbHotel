show databases;

create database dbHotel;

create table funcionarios (
	idFunc int primary key auto_increment,
    nomeFunc varchar (100) not null,
    login varchar(20) not null unique,
    senha varchar(255) not null,
    cargo varchar(20)
);

show tables;

/*inserir um novo funcionario na tabela, com nome, login, senha criptografada e cargo*/
insert into funcionarios(nomeFunc, login, senha, cargo)values("Administrador","admin",md5("admin"),"Administrador");

/*ler/Buscar as informações da tabela funcionarios*/

drop table funcionarios;

/*Selecionar o banco */
use dbHotel; 

/* Adicionar o campo email tabela funcionarios*/
alter table funcionarios add column email varchar(50);

/*modificar o campo email para que se torne obrigatório, ou seja, nao nulo (not null)*/
alter table funcionarios modify column email varchar(50) not null;

show tables;

/*descreve os campos da tabela funcionarios*/
describe funcionarios;

insert into funcionarios(nomeFunc, login, senha, cargo)values("Pamella Pereto","pamellapereto",md5("123@senac"),"ti");
insert into funcionarios(nomeFunc, login, senha, cargo)values("Breno Silva","brenosilva",md5("123@senac"),"contabilidade");
insert into funcionarios(nomeFunc, login, senha, cargo)values("Victoria Cardoso","victoriacardoso",md5("123@senac"),"rh");
insert into funcionarios(nomeFunc, login,senha)values("Laura Lopes","lauralopes",md5("123@senac"));

/*inserir um novo funcionario na tabela com nome, login, senha criptografada*/
insert into funcionarios(nomeFunc, login,senha)values("Felipe Coelho","fellipe",md5("123@senac"));
select * from funcionarios;

/*Update*/
/*Atualizar o campo login na tabela funcionario especificando o id*/

update funcionarios set login = "fellipecoelho" where idFunc = 6;
select * from funcionarios;

update funcionarios set cargo = "Gerencia" where idFunc = 3;
select * from funcionarios;

/*excluir um campo existente da tabela*/
alter table funcionarios drop column email;

describe funcionarios;

alter table funcionarios add column email varchar(50);
alter table funcionarios add column email varchar(50) not null;

describe funcionarios;  

alter table funcionarios drop column email;
alter table funcionarios add column email varchar(50) not null;

/*Reposicionar o campo email para que ele fique após o campo login*/
alter table funcionarios modify column email varchar(50) not null after login;

update funcionarios set email = "administrator@senac.com.br" where idFunc = 1;
update funcionarios set email = "lauralopes@senac.com.br" where idFunc = 2;
update funcionarios set email = "victoriacardoso@senac.com.br" where idFunc = 3;
update funcionarios set email = "brenosilva@senac.com.br" where idFunc = 4;
update funcionarios set email = "pamellapereto@senac.com.br" where idFunc = 5;
update funcionarios set email = "fellipecoelho@senac.com.br" where idFunc = 6;

select * from funcionarios;

/*Buscar o login e a senha da tabela funcionarios em que login seja admin e senha seja admin*/
select login as login, senha from funcionarios where login = "admin" and senha = md5("admin");