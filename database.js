const Sequelize = require('sequelize')
const sequelize = new Sequelize('teste', 'root', 'root', {
	host:"localhost",
	dialect: 'mysql'
})

sequelize.authenticate().then(function(){
	console.log("Connected!!")
}).catch(function(error){
	console.log("Error: "+error)
})