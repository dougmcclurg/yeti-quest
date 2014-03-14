// set variables for environment
var express = require('express');
var app = express();
var path = require('path');
var port = 4000;

// Displays server log in the CLI
app.use(express.logger());

app.get('/', function(req, res) {
  res.render('index');
});

// Set server port
app.listen(port);
console.log("Server is running at => http://localhost:" + port + "/\nCTRL + C to shutdown");