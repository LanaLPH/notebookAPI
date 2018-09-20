const express = require('express')
const bodyParser = require('body-parser')
const Notebook = require('./sequelize') 

const app = express()
app.use(bodyParser.urlencoded({extended:true}))
 
// seedDB()
require('dotenv').config();

app.get('/',(req,res) => {
    res.send('Welcome to Nodejs Postgres Sequelize')
})
 // get all notes
app.post('/api/notes/show', (req, res) => {
    Notebook.findAll() 
    .then( notes => {
        res.status( 200 ).json( {'result':1,"notes":notes} )
      })
      .catch( err=> {
        res.status( 400 ).json( {'result': 0, err} )
      }) 
})

 // get create a note
 app.post('/api/notes/create', (req, res) => {
     const {t} = req.body 
     Notebook.create({
        text : t
    }) 
    .then( () =>   res.json({'note':t ,'result': 1 }) )
    .catch( err => res.json( {'result': 0 , err} ) )
       
}) 
 // get update a note
 app.post('/api/notes/update', (req, res) => {
    const {id, text} = req.body
    Notebook.update({
       text : text
   },{
       where: {id: id}
   }) 
   .then( () =>  res.json({'update':id ,'result': 1 } ))
    .catch( err => res.json( {'result': 0} )) 
    
})
 // get delete a note
 app.post('/api/notes/delete', (req, res) => {
    const {id} = req.body
    Notebook.destroy( {
       where: {id: id}
   }) 
   .then(() => res.json({'delete id':id ,'result': 1 } ))
     .catch( err =>  res.json( {'result': 0} ))  
})

app.post('/api/notes/deleteAll', (req, res) => { 
    Notebook.destroy( {
       where: {}
   }) 
   .then( () => {
       res.status( 200 ).json({'result':1} )
     })
     .catch( error => {
       res.status( 400 ).json( {'result': 0} )
     }) 
})

// const port = 3000
app.listen(process.env.PORT, () => {
    console.log('Server started')
    // console.log(`Running on http://localhost:${port}`)
})