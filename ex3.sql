-- INSERT INTO book (
-- 	ISBN, 
--     title,
--     publishingDate,
--     genre,
--     inventory,
--     authorID
-- ) VALUES (
-- 	9780545010221,
--     'Harry Potter and the Deathly Hallows',
--     DATE '2007-07-21',
--     'Fantasy Fiction',
--     25,
--     1
-- );

-- INSERT INTO author VALUES (
-- 0,
-- "J.K. Rowling"
-- );
-- 
-- INSERT INTO user VALUES (
-- 	0,
--     'Robert Northmore',
--     'rnorthm@uwo.ca',
--     20,
--     "705-464-7288",
--     DATE '2017-10-14',
--     DATE '2020-10-14'
-- );
-- 
-- Third type of insert where we are inserting values from one table into another table
-- this command will fail for the next user because we already ran it and the primary key has been used thus another attempt would cause an identical primary key and fail
INSERT INTO returned (borrowID, userID, bookID, dateBorrowed, expectedReturnDate, dateReturned, rating)
SELECT borrowID, userID, bookID, dateBorrowed, expectedReturnDate, DATE '2017-11-22', 4 FROM outgoing
WHERE expectedReturnDate=DATE '2017-11-29';
