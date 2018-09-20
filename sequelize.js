const Sequelize = require('sequelize') 

const sequelize = new Sequelize( 
  process.env.DATABASE_URL
 ) 
 
const Notebook = sequelize.define('note', {
  id: {
  type: Sequelize.INTEGER,
  primaryKey: true,
  autoIncrement: true
  },
  text: Sequelize.STRING
});

sequelize.sync({ force: true })
  .then(() => {
    console.log(`Database & tables created!`)
  })

module.exports =  Notebook
