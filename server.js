
// DATABASE SETUP
// =============================================================================
var express    = require('express');        // call express
var app        = express();                 // define our app using express
var bodyParser = require('body-parser');
var mysql = require("mysql");
var cors  = require('cors');
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'name'
});
// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 8080;        // set our port
// var port = 12222;
// DATABASE SETUP
// =============================================================================

var mongoose = require('mongoose')


// ROUTES
// ======================================
var router = express.Router();
app.use(cors());
router.use(function(req, res, next){
   // do logging
   console.log("I'm the middle man");
   next();
});


conn.connect(function(err){
            if(err){
                console.log(err);
                return;
            }
            console.log("ready to serve")
        });

router.get('/', function(req, res) {
    console.log("I'm the standard GET");
    res.json({ message: 'hooray! welcome to our api!' });   
});

router.route('/allbooks')
    .get(function(req, res){
        conn.query("SELECT * FROM book", function(err, result, fields) {
                if(err){
                    console.log(err);
                    return;
                }
                
                console.log(result);
                res.send({message: "I worked"})
            });
    });

router.route('/allwishlist')
	.get(function(req, res){
		conn.query("SELECT * FROM user", function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			console.log(result);
			res.send(result);
		})
	})

router.route('/getUserId')
	.post(function(req, res){
		console.log(req.body.name);
		var query = "SELECT ID FROM user WHERE name='" + req.body.name + "' LIMIT 1;"
		console.log(query)
		conn.query(query, function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			console.log(result);
			res.send(result);
		})
	})

router.route('/getLibrarianId')
	.post(function(req, res){
		console.log(req.body.name);
		var query = "SELECT staffID FROM employee WHERE name='" + req.body.name + "' LIMIT 1;"
		console.log(query)
		conn.query(query, function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			console.log(result);
			res.send(result);
		})
	});

router.route('/getPopularBooks')
	
	.post(function(req,res){
		console.log(req.body.genre);
		console.log("am i working");
		var query = `SELECT book.title, 
						author.authorName, 
						book.genre 
						FROM book INNER JOIN author on book.authorID = author.authorID 
						INNER JOIN returned on returned.bookID = book.ISBN 
						where returned.rating>3 AND book.genre = "${req.body.genre}" LIMIT 10;`;
		console.log(query);
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			console.log(result);
			res.send(result);
		});

	});
	router.route('/createUser')
		.post(function(req,res){
			var query = `INSERT INTO user VALUES(
				0,
				"${req.body.name}",
				"${req.body.email}",
				"${req.body.age}",
				"${req.body.phone}",
				 CURDATE(),
				 DATE_ADD(CURDATE(), INTERVAL 1 YEAR)
			);`
			conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			console.log(result);
			res.send(result);
		});

		});



// global class variables
// REGISTER OUR ROUTES -------------------------------
// all of our routes will be prefixed with /api
app.use('/api', router);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);