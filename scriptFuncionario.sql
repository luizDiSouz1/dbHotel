/*Banco de dados para gerenciamento de um hotel*/

create database dbHotel

show databases;

show tables;

use dbHotel; 

create table funcionarios (
	idFunc int primary key auto_increment,
    nomeFunc varchar (100) not null,
    login varchar(20) not null unique,
    email varchar(50) not null unique,
    senha varchar(255) not null,
    cargo varchar(20)
);

describe funcionarios;

insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Administrador","admin","administrator@senac.com.br",md5("admin"),"Administrador");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Laura Lopes","lauralopes","lauralopes@senac.com.br",md5("123@senac"),"Gerencia");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Victoria Cardoso","victoriacardoso","victoriacardoso@senac.com.br",md5("123@senac"),"rh");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Breno Silva","brenosilva","brenosilva@senac.com.br",md5("123@senac"),"contabilidade");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Pamella Pereto","pamellapereto","pamellapereto@senac.com.br",md5("123@senac"),"ti");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Felipe Coelho","fellipe","fellipecoelho@senac.com.br", md5("123@senac"),"Contador");

insert into funcionarios(nomeFunc, login, email, senha, cargo)values("luciano","lulu","luciano@senac.com.br",md5("123@senac"),"Gerencia");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Matheus","teteu","matheus@senac.com.br",md5("123@senac"),"Gerencia");
insert into funcionarios(nomeFunc, login, email, senha, cargo)values("Jose","joseloretto","zeze@senac.com.br",md5("123@senac"),"Gerencia");

select * from funcionarios;

select idFunc as ID_funcionarios, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;
select idFunc as ID_funcionarios, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios order by nomeFunc desc;
select idFunc as ID_funcionarios, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo <> "null" order by idFunc asc;

create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    numeroQuarto varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar(50) not null,
    descricao text,
    foto varchar(255) not null,
    preco decimal(10,2) not null,
    cafeDaManha char(10) not null,
    precoCafe decimal(10,2),
    tipoCama varchar(20),
    varanda char(3)
    );
    
describe quartos;
    
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto,preco,cafeDaManha, precoCafe, tipoCama,varanda)value("5°","505","superior Premier",3,"não","Familiar","Excelente hotel, em meio a muita vegetação","https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp",750.50,"sim", 60.00 ,"Queen size","sim");
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto,preco,cafeDaManha, tipoCama, varanda)value("9°","905","superior Premier Twin",9,"não","single","Excelente hotel, em meio a muita vegetação e mulheres","https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp",700.50,"não","King size","não");
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto,preco,cafeDaManha, precoCafe, tipoCama,varanda)value("10°","1005","superior Twin",10,"sim","single","Excelente hotel, em meio a muita vegetação e mulheres brancas","https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp",1000.50,"sim", 60.00, "King size","não");
insert into quartos(andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, foto, preco,cafeDaManha, precoCafe, tipoCama,varanda)value("11°","1105","superior Twin",11,"sim","single","Excelente hotel, em meio a muita vegetação e mulheres brancas","https://imgb.ifunny.co/images/8de995299506f0da6e55…2c29f4f4633f70a61661a282b7954fb62ac6229f47_1.webp",400.50,"sim", 60.00, "King size","sim");


select * from quartos;
select idQuarto as ID_Quarto, andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as reservado from quartos where situacao = "não" order by tipoQuarto desc;
select idQuarto as ID_Quarto, andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as reservado, cafeDaManha as mãeTemCafé from quartos where situacao = "não" and cafeDaManha <> "não" order by tipoQuarto asc;
select andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as reservado, cafeDaManha as mãeTemCafé, varanda as tem_varandinha from quartos where situacao = "não" and cafeDaManha <> "não" and varanda <> "não" order by tipoQuarto asc;
select andar as andar_quarto, tipoQuarto as tipo_Quarto, nome as descrição_quartos, situacao as reservado, cafeDaManha as mãeTemCafé, varanda as tem_varandinha, preco as vaiPagarQuanto from quartos where situacao = "não" and preco < 1000;

create table clientes(
	idCliente int primary key auto_increment,
    nomeCompleto varchar (200) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) unique,
    celular varchar(30)
    ); 
    
insert into clientes (nomeCompleto, cpf, rg, email, celular) values ("José de Assis","829.942.570-09","45.353.222-8","josedeassis@gmail.com","(96)99338-2803");
insert into clientes (nomeCompleto, cpf, rg, email, celular) values ("Adriana Calcanhoto","452.552.655-08","48.353.888-8","adrianacalcanhoto@gmail.com","(96)98345-2807");

create table pedido(
	idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente","Finalizado","Cancelado")not null,
    idCliente int not null,
    foreign key(idCliente) references clientes(idCliente)
); 

/*abertura de pedidos*/

insert into pedido (statusPedido, idCliente) values ("Pendente",1);
insert into pedido (statusPedido, idCliente) values ("Pendente",2);

select * from pedido;
select * from pedido inner join clientes on pedido.idCliente = clientes.idCliente;

create table reservas (
	idReserva int primary key auto_increment,
	idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedido(idPedido),
    foreign key (idQuarto) references quartos(idQuarto),
    checkin datetime not null,
    checkout datetime not null
);

insert into reservas (idPedido,idQuarto,checkin, checkout) values (1,1,"2023-11-02 14:00:00","2023-11-05 12:00:00");
insert into reservas (idPedido,idQuarto,checkin, checkout) values (1,2,"2023-11-02 14:00:00","2023-11-05 12:00:00");


/*inserido 09.11 */
insert into reservas (idPedido,idQuarto,checkin, checkout) values (2,3,"2023-02-17 14:00:00","2023-02-20 15:00:00");
select * from reservas;
describe clientes;

/*
OBJETIVO: Selecionar o nome do cliente, seu cpf e email, o id do pdido do cliente , a data do pedido, quais quartos e seus nomes, assim como os andares em que estãoptimize,
os números de cada quarto, e suas datas de checkin e checkout*/

select clientes.nomeCompleto, clientes.cpf, clientes.email, pedido.idPedido, pedido.dataPedido, quartos.tipoQuarto,
quartos.nome, quartos.andar, quartos.numeroQuarto, quartos.preco from 
clientes inner join pedido on clientes.idCliente = pedido.idCliente inner join reservas on reservas.idPedido = pedido.idPedido
inner join quartos on reservas.idQuarto = quartos.idQuarto; 

/* Objetivo: somar o total que o cliente devera pagar ao concluir as reservas dos quartos */

select sum (quartos.preco) as Total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto;

select * from clientes;
select * from pedido;
select * from quartos;

/*OBJETIVO: somar o total que o cliente deverá pagar ao concluir as reservas dos quartos*/
select sum(quartos.preco) as Total from reservas inner join quartos on reservas.idQuarto = quartos.idQuarto where idPedido = 1;


/* select reservas.idReserva, pedido.idPedido, 
quartos.idQuarto, quartos.nome, quartos.andar, quartos.numeroQuarto
from (reservas inner join pedido on reservas.idPedido = pedido.idPedido)
inner join quartos on reservas.idQuarto = quartos.idQuarto; */