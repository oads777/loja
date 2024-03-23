create database teste2;

use teste2

create table pedido(
    id_pedido int primary key,
    id_utilizador int foreign key references utilizadores (id_utilizador),
    estado char(100),
    data_prevista date,
    data_envio date,
)

create table ticket(
    id_ticket int primary key,
    id_utilizador int foreign key references utilizadores (id_utilizador),
    data_abertura date,
    assunto char(150),
    descricao char(300),
    estado bit,
    nome_utilizador char(200),
)

create table produto(
    id_produto int primary key,
    id_carrinho int foreign key references carrinho (id_carrinho),
    nome char(255),
    preco money,
    estado bit,
    marca char(255),
    quantidade int,
    imagem image,
)

create table metodo_pagamento(
    id_metodo_pagamento int primary key,
    id_carrinho int foreign key references carrinho (id_carrinho),
    nome char (100),
    taxa money,
    disponibilidade bit,
    data_transacao date,
)

create table carrinho(
    id_carrinho int primary key,
    id_produto int foreign key references produto (id_produto),
    id_utilizador int foreign key references utilizadores (id_utilizador),
    id_metodo_pagamento int foreign key references metodo_pagamento (id_metodo_pagamento),
    preco_total money,
)

create table administrador(
    id_super_utilizador int primary key,
)

create table cliente(
    id_standard_utilizador int primary key,
)

create table utilizadores(
    id_utilizador int primary key,
    id_administrador int foreign key references administrador (id_super_utilizador),
    id_cliente int foreign key references cliente (id_standard_utilizador),
    id_carrinho int foreign key references carrinho (id_carrinho),
    id_pedido int foreign key references pedido (id_pedido),
    id_ticket int foreign key references ticket (id_ticket),
    nome char(255),
    morada char(255),
    email char(150),
    data_nascimento date,
    palavra_pass char(75),
    data_registo date,
	)


	alter table pedido
	add id_utilizador int,
	foreign key (id_utilizador) references utilizadores (id_utilizador)

	alter table ticket
	add id_utilizador int, 
	foreign key (id_utilizador) references utilizadores (id_utilizador)

	alter table produto
	add id_carrinho int,
	foreign key (id_carrinho) references carrinho (id_carrinho)

	alter table metodo_pagamento
	add id_carrinho int,
	foreign key (id_carrinho) references carrinho (id_carrinho)

	alter table carrinho
	add id_utilizador int,
	foreign key (id_utilizador) references utilizadores (id_utilizador)

	alter table utilizadores
	add foreign key (id_cliente) references cliente (id_standard_utilizador)