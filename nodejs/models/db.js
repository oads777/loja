const Sequelize = require('sequelize')

const sequelize = new Sequelize('teste2', 'root', 'root', {
	host: "localhost",
	dialect: 'mysql'
})

module.exports = {
	Sequelize: Sequelize,
	sequelize: sequelize
}