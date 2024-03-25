create database teste;

use teste;

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    estado CHAR(100),
    data_prevista DATE,
    data_envio DATE
);

CREATE TABLE ticket (
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATE,
    assunto CHAR(150),
    descricao CHAR(255),
    estado BIT,
    nome_utilizador CHAR(200)
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome CHAR(255),
    preco DOUBLE,
    estado BIT,
    marca CHAR(255),
    quantidade INT,
    imagem LONGBLOB
);

CREATE TABLE metodo_pagamento (
    id_metodo_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    nome CHAR(100),
    taxa DOUBLE,
    disponibilidade BIT,
    data_transacao DATE
);

CREATE TABLE carrinho (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_metodo_pagamento INT,
    preco_total DOUBLE,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_metodo_pagamento) REFERENCES metodo_pagamento(id_metodo_pagamento)
);

CREATE TABLE administrador (
    id_super_utilizador INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE cliente (
    id_standard_utilizador INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE utilizadores (
    id_utilizador INT AUTO_INCREMENT PRIMARY KEY,
    id_administrador INT,
    id_cliente INT,
    id_carrinho INT,
    id_pedido INT,
    id_ticket INT,
    nome CHAR(255),
    morada CHAR(255),
    email CHAR(150),
    data_nascimento DATE,
    palavra_pass CHAR(75),
    data_registo DATE,
    FOREIGN KEY (id_administrador) REFERENCES administrador(id_super_utilizador),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_standard_utilizador),
    FOREIGN KEY (id_carrinho) REFERENCES carrinho(id_carrinho),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket)
);


ALTER TABLE pedido
ADD COLUMN id_utilizador INT,
ADD FOREIGN KEY (id_utilizador) REFERENCES utilizadores (id_utilizador);

ALTER TABLE ticket
ADD COLUMN id_utilizador INT,
ADD FOREIGN KEY (id_utilizador) REFERENCES utilizadores (id_utilizador);

ALTER TABLE metodo_pagamento
ADD COLUMN id_carrinho INT,
ADD FOREIGN KEY (id_carrinho) REFERENCES carrinho (id_carrinho);

ALTER TABLE carrinho
ADD COLUMN id_utilizador INT,
ADD FOREIGN KEY (id_utilizador) REFERENCES utilizadores (id_utilizador);

ALTER TABLE utilizadores
ADD FOREIGN KEY (id_cliente) REFERENCES cliente (id_standard_utilizador);