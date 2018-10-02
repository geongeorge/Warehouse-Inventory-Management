var express = require('express')
var app = express()

//set view engine to ejs
app.set('view engine', 'ejs');

// respond with "hello world" when a GET request is made to the homepage
app.get('/', function (req, res) {
  res.send('hello world')
})

app.listen("3000", () => {
    console.log("Server started at port 3000")
})