show databases;

create database dbHotel;

use dbHotel;

create table funcionarios (
	idFunc int primary key auto_increment,
    /*nomeFunc varchar (100) not null,*/
    login varchar(20) not null unique,
    senha varchar(255) not null,
    cargo varchar(20)
);

show tables;

/*inserir um novo funcionario na tabela, com nome, login, senha criptografada e cargo*/
insert into funcionarios(nomeFunc, login, senha, cargo)values("Administrador","admin",md5("admin"),"Administrador");

/*ler/Buscar as informações da tabela funcionarios*/


drop table funcionarios;

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

update funcionarios set login = "fellipecoelho" where idFunc = 15;
select * from funcionarios;

update funcionarios set cargo = "Gerencia" where idFunc = 12;
select * from funcionarios;

