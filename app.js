var express = require('express')
var mysql = require('mysql')
var app = express()

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));

const passport = require('passport');
app.use(passport.initialize());
app.use(passport.session());

//static folder
app.use(express.static('static'))


var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'test'
})

connection.connect(function(err) {
  if (err) {
    console.log("Cannot connect to mysql...")
    throw err
  }
  console.log('Connected to mysql...')
})

//set view engine to ejs
app.set('view engine', 'ejs');

// respond with "hello world" when a GET request is made to the homepage
app.get('/', function (req, res) {

  res.render('index', {title : "My First node page"})
})

app.listen("3000", () => {
    console.log("Server started at port 3000")
})