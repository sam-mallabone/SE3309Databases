
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
    database: 'librarydatabase'
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
		console.log("get user ID");
		var query = "SELECT ID FROM user WHERE name='" + req.body.name + "' LIMIT 1;"
		console.log(query)
		conn.query(query, function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			//console.log(result);
			res.send(result);
		})
	})

router.route('/getLibrarianId')
	.post(function(req, res){
		console.log("Get Librarian by ID");
		var query = "SELECT staffID FROM employee WHERE name='" + req.body.name + "' LIMIT 1;"
		console.log(query)
		conn.query(query, function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			//console.log(result);
			res.send(result);
		})
	})

router.route('/moneyowed/:id')
	.get(function(req, res){
		console.log(req.params.id);
		var query = `SELECT 
						    SUM(payment.amountOwed) AS MoneyOwed
						FROM
						    returned
						        INNER JOIN
						    user ON user.ID = returned.userID
						        INNER JOIN
						    payment ON returned.borrowID = payment.borrowID
						WHERE
						    user.ID = ${req.params.id} AND payment.isPaid = FALSE;`;

		console.log(query);
		conn.query(query, function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			//console.log(result);
			res.send(result);
		})
	})

router.route('/inventory/:id')
	.get(function(req, res) {
		console.log(req.params.id)
		var query = `SELECT 
						    book.ISBN,
						    book.title,
						    book.genre,
						    authorName,
						    inventory AS CopiesLeft
						FROM
						    book
						        NATURAL JOIN
						    author
						WHERE
						    inventory < ${req.params.id}
						ORDER BY inventory;`

	conn.query(query, function(err, result, fields){
			if(err){
				res.send(err);
				return;
			}

			//console.log(result);
			res.send(result);
		})
	})

router.route('/genreCount')
	.get(function(req, res){
		console.log('route for number of books in outgoing per genre');
		var query = `SELECT 
						    genre, COUNT(genre) as cnt
						FROM
						    book
						        INNER JOIN
						    outgoing ON book.ISBN = outgoing.bookID
						GROUP BY genre
						ORDER BY COUNT(genre) DESC;`
		conn.query(query,function(err, result, fields){
			if(err){
				console.log(err);
				res.send(err);
				return;
			}

			console.log(result);
			res.send(result);
		})
	})

router.route('/overdueUsers')
	.get(function(req, res){
		console.log('get all overdue users');
		var query = `SELECT 
						    user.ID,
						    user.name,
						    user.email,
						    DATEDIFF(CURDATE(), outgoing.expectedReturnDate) AS daysOverdue
						FROM
						    outgoing
						        INNER JOIN
						    user ON user.ID = outgoing.userID
						WHERE
						    outgoing.expectedReturnDate < CURDATE();`
		conn.query(query,function(err, result, fields){
			if(err){
				console.log(err);
				res.send(err);
				return;
			}

			//console.log(result);
			res.send(result);
		})
	})

router.route('/authorID')
	.post(function(req, res){
		console.log('get authr by authorID');
		var query = `SELECT 
						    authorID
						FROM
						    author
						WHERE
						    authorName = '${req.body.authorName}';`
		conn.query(query,function(err, result, fields){
			if(err){
				console.log(err);
				res.send(err);
				return;
			}

			//console.log(result);
			res.send(result);
		})
	});
router.route('/getPopularBooks')
	
	.post(function(req,res){
		console.log("Get all popular books route");
		var query = `SELECT book.title, 
							author.authorName, 
							book.genre, AVG(rating) as Rating
						FROM 
							book 
								INNER JOIN 
							author on book.authorID = author.authorID 
								INNER JOIN 
							returned on returned.bookID = book.ISBN 
						where
					        returned.rating>3 AND book.genre = '${req.body.genre}'
                            GROUP BY book.title
					        ORDER BY rating DESC LIMIT 10;`;
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err); 
			}
			//console.log(result);
			res.send(result);
		});

	});
router.route('/createUser')
		.post(function(req,res){
			console.log('create a user route')
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
			//console.log(result);
			res.send(result);
			});

		});

router.route('/searchbooks')
	.post(function(req, res) {
		console.log('searchbooks route ')
		var query = `SELECT 
						    *
						FROM
						    book
						    	INNER JOIN
    						author ON book.authorID = author.authorID
						WHERE
						    title LIKE '${req.body.title}%';`
			conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
			});
				
	});

router.route('/createbook')
	.post(function(req, res) {
		console.log('create book route');
		var query = `INSERT INTO book VALUES(
						'${req.body.isbn}',
					    '${req.body.title}',
					    DATE '${req.body.publishingDate}',
					    '${req.body.genre}',
					    '${req.body.inventory}',
					    '${req.body.authorID}'
						);`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
			});
	})

router.route('/updatebook')
	.post(function(req, res){
		console.log('update book route');
		var query = `UPDATE book 
						SET
						title = '${req.body.title}',
						 genre = '${req.body.genre}', 
						 inventory = '${req.body.inventory}', 
						 authorID = '${req.body.authorID}'
						 WHERE ISBN = '${req.body.isbn}';`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
			});
	})

router.route('/deletebook/:isbn')
	.delete(function(req, res){
		console.log('delete book route');
		console.log(req.params.isbn);
		var query = `DELETE FROM book WHERE ISBN = '${req.params.isbn}';`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
			});
	})

router.route('/createwishlist')
	.post(function(req, res) {
		console.log('create wishlist route');
		var query = `INSERT INTO wishlist VALUES (
						0,
					    ${req.body.authorID},
					    '${req.body.genre}',
					    '${req.body.title}',
					    ${req.body.userID}
						);`
						console.log(query);
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
			});
	})

router.route('/useroutgoing')
	.post(function(req, res) {
		console.log('Outgoing user route');
		var query = `SELECT book.title, author.authorName, book.genre, outgoing.expectedReturnDate
						FROM user
						INNER JOIN outgoing on user.ID = outgoing.userID
						INNER JOIN book on book.ISBN = outgoing.bookID
						INNER JOIN author on author.authorID = book.authorID
						WHERE
						user.ID = ${req.body.userId}
						ORDER BY outgoing.expectedReturnDate;`
						
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
			});
	})

router.route('/searchavailable/:name')
	.get(function(req, res){
		console.log("route for searching books that are in stock");
		var query = `SELECT 
						    *
						FROM
						    book
						    	INNER JOIN
    						author ON book.authorID = author.authorID
						WHERE
						    title LIKE '${req.params.name}%'
						AND inventory > 0;`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			console.log(result);
			res.send(result);
			});
	})

router.route("/updateinv")
	.put(function(req, res) {
		console.log("Update inventory of book");
		var query = `UPDATE book 
						SET inventory = inventory-1 
							WHERE book.ISBN = ${req.body.isbn};`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			console.log(result);
			res.send(result);
			});
	})

router.route('/createoutgoing')
	.post(function(req, res){
		console.log('create new outgoing');
		var query = `INSERT INTO outgoing VALUES(
						0,
					    ${req.body.userId},
					    ${req.body.isbn},
					    CURDATE(),
					    DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
					);`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			console.log(result);
			res.send(result);
		});
	})

router.route('/returned/:user_id')
	.get(function(req, res) {
		console.log("get user's returned books")
		var query = `SELECT returned.borrowID, book.title, author.authorName, book.genre, returned.rating, returned.dateReturned
						FROM user
						INNER JOIN returned on user.ID = returned.userID
						INNER JOIN book on book.ISBN = returned.bookID
						INNER JOIN author on author.authorID = book.authorID
						WHERE
						user.ID = ${req.params.user_id}
						ORDER BY returned.dateReturned;`
		conn.query(query, function(err,result,fields){
			if (err){
				console.log(err);
				res.send(err);
			}
			//console.log(result);
			res.send(result);
		});
	})

router.route('/ratebook')
	.put(function(req, res){
		console.log('rate a book');
		var query = `UPDATE returned 
						SET rating = ${req.body.rating}
								WHERE returned.borrowID = ${req.body.borrowId};`

		conn.query(query, function(err,result,fields){
				if (err){
					console.log(err);
					res.send(err);
				}
				//console.log(result);
				res.send(result);
			});
		})
// global class variables
// REGISTER OUR ROUTES -------------------------------
// all of our routes will be prefixed with /api
app.use('/api', router);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);