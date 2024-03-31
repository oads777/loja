const db = require('./db')


const PostLogin = db.sequelize.define('testes', {
    username: {
        type: db.Sequelize.STRING
    },
    password: {
        type: db.Sequelize.STRING
    }
})


module.exports = PostLogin