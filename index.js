const express = require('express')
const app = express()
const path = require('path')
const { engine } = require('express-handlebars')
const bodyParser = require('body-parser')
const Sequelize = require('sequelize')
const Post = require('./models/Post')
const PostLogin = require('./models/Post')



//Config
    //Template Engine
    app.engine('handlebars', engine());
    app.set('view engine', 'handlebars');

    //Body-Parser (.json/.xml files)
    app.use(bodyParser.urlencoded({extended: false}))
    app.use(bodyParser.json())



    //Paths Declaration
    app.use('/public', express.static(path.join(__dirname, 'public')));

    app.get('/website', function (req, res) {
        res.render('website');
    })

    app.get('/admin-panel', function (req, res) {
        res.render(path.join(__dirname, 'public', 'admin-panel'));
    })

    app.get('/register', function (req, res) {
        res.render('views', 'register');
    })



    //Posts Declarations
    app.post('/register-done', function (req, res) {
        PostLogin.create({
            username: req.body.username,
            password: req.body.password
        }).then(function(){
            res.send("Login Criado com Sucesso")
        }).catch(function (erro) {
            res.send("Erro: " + erro)
        })

        res.send("Username: "+req.body.username+" Password: "+req.body.password)
    })



    //End File
    app.use((req, res) => {
        res.status(404);
        res.send(`<h1>Error 404: Request not found!</h1>`);
    });
    
    app.listen(8081, () => {
        console.log("App listening on port 8081");
    })
