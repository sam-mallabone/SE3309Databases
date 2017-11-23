
-- Insert a new book into the library, this could not be run again unless a different primary key was specified
-- to run it just insert a new arbritrary primary key value
INSERT INTO book (
	ISBN, 
    title,
    publishingDate,
    genre,
    inventory,
    authorID
) VALUES (
	9780545010221,
    'Harry Potter and the Deathly Hallows',
    DATE '2007-07-21',
    'Fantasy Fiction',
    25,
    1
);

INSERT INTO author VALUES (
0,
"J.K. Rowling"
);

-- This insert will run because a primary key wasn't specified so the table will determine it's value when it is entered
INSERT INTO user VALUES (
	0,
    'Robert Northmore',
    'rnorthm@uwo.ca',
    20,
    "705-464-7288",
    DATE '2017-10-14',
    DATE '2020-10-14'
);
-- the command commented out was to enter an entry into the database that could then be used in the insert 
INSERT INTO outgoing 
VALUES 
(1106, 1683, 3024002041378, DATE '2017-09-18', DATE '2017-12-23');

INSERT INTO returned (	
		borrowID, 
		userID, 
		bookID, 
		dateBorrowed, 
		expectedReturnDate, 
		dateReturned, 
		rating
	) SELECT borrowID, userID, bookID, dateBorrowed, expectedReturnDate, DATE '2017-11-22', 4 FROM outgoing
WHERE expectedReturnDate=DATE '2017-12-23';
