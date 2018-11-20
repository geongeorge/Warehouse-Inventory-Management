var express = require('express')
var session = require('express-session')
var mysql = require('mysql')
var app = express()

app.use(session({secret: 'ssshhhhh!'}));

app.locals.baseUrl = "http://localhost:3000"

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));

const bcrypt = require("bcryptjs");

var pwHash = (pwd) => {
  return bcrypt.hashSync(pwd, 10);
}

var pwVerify = (pwd,hash) => {
  if(bcrypt.compareSync(pwd, hash)) {
    return true;
  } else {
    return false;
  } 
}



//static folder
app.use(express.static('static'))


var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'warehouse'
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

// homepage
app.get('/', function (req, res) {
  res.locals.user = req.session.user;

  connection.query('SELECT * from products', function (error, results, fields) {
    if (error) throw error;
    res.render('index', {
      title : "Shop",
      products: results
    })
  });

})

app.get('/login', function (req, res) {
  res.render('login', {title : "Login"})
})
app.post('/login', function (req, res) {
  console.log(req.body)
  let usr = req.body
  // res.render('login', {title: "Failed! Try again", failed: true});

  connection.query(`SELECT * from customers where username="${usr.uname}"`, function(err, rows, fields) {
    if (!err) {
      console.log('The solution is: ', rows[0]);

      if(typeof rows[0] != 'undefined' && pwVerify(usr.pwd, rows[0].password)){
        console.log("Successful Login");
        req.session.user = {
          id : rows[0].id,
          username : rows[0].username,
        };
        res.redirect('/');
      } else {
        res.render('login', {title: "Failed! Try again", failed: true});
      }
    }
    else
      throw err;
  });
  
})

// Item page
app.get('/item/:id', function (req, res) {
  res.locals.user = req.session.user

  connection.query(`SELECT * from products where id=${req.params.id}`, function (error, results, fields) {
    if (error) throw error;
    // res.send(results)

    if(results.length > 0) {
      res.render('items', {
        product: results
      })
    } else {
      res.render('404')
    }
    
  });

})

//register a user manually
app.get('/secretreg', function (req, res) {
  let pwwd = pwHash('password')
  connection.query(`insert into customers(username, password) values('john', '${pwwd}')`, function(err, rows, fields) {
    if (!err)
      console.log('Added User: ', rows);
    else {
      throw err;
      console.log('Error while performing Query.');
    } 
  });
})

//log out
app.get('/logout',(req,res)=> {
  req.session.destroy();
  res.redirect('/');
})


const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log("Server started at port "+port)
    console.log("http://localhost:"+port)
})