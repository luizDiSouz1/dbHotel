show databases;

create database dbPadaria;

use dbPadaria;

create table fornecedores (
idFornecedor int primary key auto_increment ,
nomeFornecedor varchar(50) not null,
cnpjFornecedor varchar(20) not null,
telefoneFornecedor varchar(20),
emailFornecedor varchar(50) not null unique,
cep varchar(9),
enderecoFornecedor varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado varchar(2)
);

insert into fornecedores(nomeFornecedor, cnpjFornecedor, emailFornecedor, telefoneFornecedor, cep, enderecoFornecedor, numeroEndereco, bairro, cidade, estado) values ("Ronaldo", "28.946.201/0001-79", "ronaldo@gmail.com", "(11) 5727-5567", "06133-005", "Rua Castanho Luiz Morato", "136", "Grande Rancho", "São Paulo", "SP");

select * from fornecedores;

create table produtos (
	idProduto int primary key auto_increment,
	nomeProduto varchar(50) not null,
	descricaoProduto text,
	precoProduto decimal (10,2) not null,
	estoqueProduto int not null,
	categoriaProduto enum ("Pães", "Bolos", "Confeteira", "Salgados"),
	idFornecedor int not null,
	foreign key (idFornecedor) references fornecedores(idFornecedor)
);

insert into produtos(nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("Tapioquinha", "Tapioca doceo com cobertura de chocolate", "5.50", 12, "Salgados", 1);

insert into produtos(nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("Pizza", "Pizza com cobertura de queijo.", "18.10", 8, "Salgados", 1);

insert into produtos(nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("Brioche", "salgado enroladinho", "2.00", 100, "Pães", 1);

select * from produtos where categoriaProduto = "Pães";

select * from produtos where precoProduto < 50.00 order by precoProduto asc;

create table clientes (
	idCliente int primary key auto_increment,
	nomeCliente varchar(50),
	cpfCliente varchar(15) not null unique,
	telefoneCliente varchar(20),
	emailCliente varchar(50) unique,
	cep varchar(9),
	enderecoCliente varchar(100),
	numeroEndereco varchar(10),
	bairro varchar(40), 
	cidade varchar(40),
	estado varchar(2)
);

insert into clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado) values ("Luiz Marcato", "228.719.568-98", "(91) 3555-7811", "luizmarcato@hotmail.com", "04918-040", "Myclick apt 201, bloco b", "200", "Jardim São Francisco", "São Paulo", "SP");

select * from clientes;

create table pedidos (
	idPedido int primary key auto_increment,
	dataPedido timestamp default current_timestamp,
	statusPedido enum ("Pendente", "Finalizado", "Cancelado"),
	idCliente int not null,
	foreign key (idCliente) references clientes(idCliente)
);

insert into pedidos (statusPedido, idCliente) values ("Finalizado", 1);

select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;

create table itensPedidos (
idItensPedidos int primary key auto_increment,
idPedido int not null,
foreign key (idPedido) references pedidos(idPedido),
idProduto int not null,
foreign key (idProduto) references produtos(idProduto),
quantidade int not null
);

insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 1, 2);

insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 2, 1);

select itensPedidos.idItensPedidos, pedidos.idPedido, produtos.idProduto, clientes.nomeCliente;