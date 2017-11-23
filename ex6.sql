-- Three different kinds of updates
--  Delete from employees all security or people who's name start with Mat
DELETE FROM employee WHERE role = 'security' OR name LIKE 'Mat%';

-- Extending the amount of time the book is borrowed for all books that have to be returned on a certain day
UPDATE outgoing SET expectedReturnDate = DATE '2018-01-02' WHERE expectedReturnDate = DATE '2017-12-29';

-- The command below is the opposite of the one above, this is to test whether the update would work
-- UPDATE outgoing SET expectedReturnDate = DATE '2017-12-29' WHERE expectedReturnDate = DATE '2018-01-02';

-- the command below is used to make the top delete work
-- INSERT INTO employee VALUES (0, DATE '2017-12-19', 36500, 'guy@me.com', '403-991-9243', 'Mathieu Cornwall', 'security'), (0, DATE '2017-12-15', 37500, 'guy2@me.com', '403-997-9243', 'Max Cornwall', 'security'), (0, DATE '2017-11-19', 36500, 'guy3@me.com', '403-391-9243', 'Jay Ross', 'security'), (0, DATE '2017-12-19', 42500, 'guy4@me.com', '401-991-9243', 'Matty Johnson', 'librarian'), (0, DATE '2017-12-19', 36500, 'guy5@me.com', '403-991-9210', 'Matt Hollock', 'janitor');


-- Update the dateborrowed of a book who's date borrowed was 2017-10-22 based on the query results of the returned table whos 
-- expected return date is 2017-11-28
UPDATE outgoing as dest, (SELECT * FROM returned where expectedReturnDate = DATE '2017-11-28') as src 
SET dest.dateBorrowed = src.dateBorrowed WHERE dest.dateBorrowed = DATE '2017-10-20';

select * from outgoing;
-- adding a row into the table to make the above query work, because of this the query above it should work
INSERT INTO outgoing VALUES (1110, 1050, 3024002041378, DATE '2017-10-20', DATE '2017-11-30');

