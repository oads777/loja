const http = require('http');
const fs = require('fs');
const mysql = require('mysql');

/*

// Configurações de conexão com o banco de dados
const connection = mysql.createConnection({
    host: 'seu_host', // Por exemplo: 'localhost' ou '127.0.0.1'
    user: 'seu_usuario',
    password: 'sua_senha',
    database: 'nome_do_banco_de_dados'
});

// Conectar ao banco de dados
connection.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados:', err);
        return;
    }
    console.log('Conexão bem-sucedida ao banco de dados MySQL');
});

// Exemplo de consulta simples
connection.query('SELECT * FROM tabela', (err, rows) => {
    if (err) {
        console.error('Erro ao executar a consulta:', err);
        return;
    }
    console.log('Resultado da consulta:', rows);
});

// Fechar a conexão quando não precisar mais dela
connection.end();

*/

const server = http.createServer((req, res) => {
    fs.readFile('C:/Users/sirfa/OneDrive/Ambiente de Trabalho/UNIVERSIDADE/Loja/pagina-teste.html', (err, data) => {
        if (err) {
            console.error('Erro ao ler o arquivo:', err);
            res.writeHead(500, { 'Content-Type': 'text/plain' });
            res.end('erro interno do servidor');
        } else {
            res.writeHead(200, { 'content-type': 'text/html' });
            res.end(data);
        }

    });

});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}/`);
});