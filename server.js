var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var urlencodedParser = bodyParser.urlencoded({ extended: true }); // Fix typo here

var mysql = require('mysql');

var server = app.listen(8080, function () {
    console.log('Server is listening on http://localhost:8080');
});


app.use(bodyParser.json());
app.use(express.static('public'));
app.set("view engine", "pug");

// MySQL database configuration
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'votiing',
  });
  
  db.connect((err) => {
    if (err) {
      console.error('Error connecting to MySQL database:', err);
      return;
    }
    console.log('Connected to MySQL database');
  });
  
  // Middleware to parse the request body
  app.use(bodyParser.urlencoded({ extended: true }));
  
  // Serve static files (e.g., CSS)
  app.use(express.static('public'));
  
  // Route for handling form submission
  app.post('/login', (req, res) => {
    const { firstname, lastname, email, password } = req.body;
  
    // Insert data into the database
    const sql = 'INSERT INTO admin (firstname, lastname, email, password) VALUES (?, ?, ?, ?)';
    db.query(sql, [firstname, lastname, email, password], (err, result) => {
      if (err) {
        console.error('Error inserting data into the database:', err);
        return res.status(500).send('Internal Server Error');
      }
  
      console.log('Data inserted into the database:', result);
      //res.status(200).send('Login successful');
      res.redirect("/login");
    });
  });





  
app.get('/', function (req, res) { // Fix parentheses to curly braces
    res.render('index');
});

app.get('/login', function (req, res) { // Fix parentheses to curly braces
    res.render('login');
});
app.get('/contact', function (req, res) { // Fix parentheses to curly braces
    res.render('contact');
});
app.get('/about', function (req, res) { // Fix parentheses to curly braces
    res.render('about');
});
app.get('/dashboard', (req, res) => {
  res.render('dashboard'); // Assuming your dashboard page is in a file named 'dashboard.pug'
});

// app.post('/vote', (req, res) => {
//   try {
//     const { option } = req.body;

//     // You can now use the 'option' value to retrieve data from the database
//     // For example, find the candidate details based on the selected option
//     const query = 'SELECT * FROM candidates WHERE id = ?';

//     connection.query(query, [option], (err, results) => {
//       if (err) {
//         console.error('Error executing MySQL query:', err);
//         res.status(500).send('Internal Server Error');
//       } else {
//         // Handle the candidate data as needed (e.g., save to another collection, log, etc.)
//         console.log('Candidate details:', results[0]);

//         res.send('Vote submitted successfully!');
//       }
//     });
//   } catch (error) {
//     console.error(error);
//     res.status(500).send('Internal Server Error');
//   }
// });
