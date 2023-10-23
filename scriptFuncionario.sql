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

/*Delete*/
delete from funcionarios where  idFunc = 6;

/*Buscar o ID e o nome do funcionario ordenando o nome alfabeticamente (descendente, de A a Z)*/
select idFunc as ID_funcionarios, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;
select idFunc as ID_funcionarios, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios order by nomeFunc desc;
select idFunc as ID_funcionarios, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> "null" order by idFunc desc;


insert into funcionarios(nomeFunc, login,email, senha, cargo)values("Jose","joseloretto","zeze@senac.com.br",md5("123@senac"),"Gerencia");

insert into funcionarios(nomeFunc, login,email, senha, cargo)values("luciano","lulu","luciano@senac.com.br",md5("123@senac"),"Gerencia");

insert into funcionarios(nomeFunc, login,email, senha, cargo)values("luciano","lulu","luciano@senac.com.br",md5("123@senac"),"Gerencia");

insert into funcionarios(nomeFunc, login,email, senha, cargo)values("Matheus","teteu","matheus@senac.com.br",md5("123@senac"),"Gerencia");

select * from funcionarios;

select * from funcionarios where cargo = "gerencia" order by idFunc desc;

create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    preco decimal(10,2) not null,
    tipoCama varchar(20),
    varanda char(3)
);

alter table quartos add column numeroQuarto varchar(10) not null after andar;
alter table quartos add column cafeDaManha char(10) not null after preco;
alter table quartos add column foto varchar(255) not null after descricao;

select * from quartos;


describe quartos;

insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda)value("5°","505","superior Premier",3,"não","Familiar","Excelente hotel, em meio a muita vegetação",750.50,"Queen size","sim");
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda)value("9°","905","superior Premier Twin",9,"sim","single","Excelente hotel, em meio a muita vegetação e mulheres",700.50,"King size","não");
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda)value("10°","1005","superior Twin",10,"sim","single","Excelente hotel, em meio a muita vegetação e mulheres brancas",1000.50,"King size","não");
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, cafeDaManha, preco, tipoCama, varanda)value("11°","1105","superior Twin",11,"sim","single","Excelente hotel, em meio a muita vegetação e mulheres brancas"," https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp","sim",400.50,"King size","sim");

update quartos set cafeDaManha = "sim" where idQuarto = 1;
update quartos set cafeDaManha = "sim" where idQuarto = 2;
update quartos set cafeDaManha = "sim" where idQuarto = 3;

update quartos set situacao = "sim" where idQuarto = 1;
update quartos set cafeDaManha = "sim" where idQuarto = 1;

update quartos set foto = "https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp" where idQuarto = 1;
update quartos set foto = "https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp" where idQuarto = 2;
update quartos set foto = "https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp" where idQuarto = 3;
update quartos set foto = "https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp" where idQuarto = ;

select * from quartos;
/*_____________________________________________________________________________________________________________*/

/*primeiro exercicio (quarto disponivel)*/
select idQuarto as ID_Quarto, andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as esta_disponivel from quartos where situacao <> "não" order by tipoQuarto desc;

/*Segundo exercicio(café da manhã, diponivel)*/
select idQuarto as ID_Quarto, andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as esta_disponivel, cafeDaManha as mãeTemCafé from quartos where situacao <> "não" and cafeDaManha <> "não" order by tipoQuarto desc;

/*Terceiro exercicio(varanda,café da manha e disponivel)*/
select andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as esta_disponivel, cafeDaManha as mãeTemCafé, varanda as tem_varandinha from quartos where situacao <> "não" and cafeDaManha <> "não" and varanda <> "não" order by tipoQuarto desc;

/*Quarto exercicio(abaixo de 700, disponivel)*/
select andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as esta_disponivel, cafeDaManha as mãeTemCafé, varanda as tem_varandinha, preco as vaiPagarQuanto from quartos where situacao <> "não" and preco < 700;




 