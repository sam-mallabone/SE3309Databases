describe payment;


-- how much money do I owe the library
select sum(payment.amountOwed) as MoneyOwed 
from returned
inner join user on user.ID = returned.userID 
inner join payment on returned.borrowID = payment.borrowID
where user.ID = 2 and payment.isPaid = false;



-- this is to return a users favourite genre, we could do like 10 suggestions of books based on this
select title, genre, count(genre) from returned
inner join user on user.ID = returned.userID
inner join book on returned.bookID = book.ISBN
where user.ID = 2 group by genre order by count(genre) desc;

select book.title, author.authorName, book.publishingDate from book
inner join author on book.authorID = author.authorID
inner join returned on book.ISBN = returned.bookID
where genre = 'mystery' limit 10;

SELECT ID FROM user WHERE name='maxim' LIMIT 1;



select * from returned where userId = 2;
insert into payment values (1211, 8.50, false), (1213, 2.50, false), (1216, 3.50, false);
insert into returned values (1216, 2, 1000000001217, DATE '2017-10-29', DATE '2017-11-25', DATE '2017-11-24', 5), (1212, 2, 1000000002434, DATE '2017-10-29', DATE '2017-11-25', DATE '2017-11-24', 5), (1213, 2, 1000000003651, DATE '2017-10-29', DATE '2017-11-25', DATE '2017-11-24', 5), (1214, 2, 1000000004868, DATE '2017-10-29', DATE '2017-11-25', DATE '2017-11-24', 5), (1211, 2, 1000000006085, DATE '2017-10-29', DATE '2017-11-25', DATE '2017-11-24', 5), (1215, 2, 1000000007302, DATE '2017-10-29', DATE '2017-11-25', DATE '2017-11-24', 5);

select * from book;
describe payment;

-- get all books whose inventory is less than 4
SELECT 
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
    inventory < 4
ORDER BY inventory;
 
 
 -- most popular genre that is currently taken out(could add stuff like in the last month but this is good for now)
SELECT 
    genre, COUNT(genre) as cnt
FROM
    book
        INNER JOIN
    outgoing ON book.ISBN = outgoing.bookID
GROUP BY genre
ORDER BY COUNT(genre) DESC;

describe employee;
select * from employee;

INSERT INTO employee VALUES (55, DATE '2017-11-29', 100000, 'jterpak@lib.com', '403-223-8174', 'Jak Terpak', 'librarian');

SELECT * FROM employee WHERE employee.name = 'Jak Terpak';

SELECT ID FROM user WHERE name='Sam Mallabone' LIMIT 1;

SELECT 
    user.ID,
    user.name,
    user.email,
    DATEDIFF(CURDATE(), outgoing.expectedReturnDate) AS daysOverdue
FROM
    outgoing
        INNER JOIN
    user ON user.ID = outgoing.userID
WHERE
    outgoing.expectedReturnDate < CURDATE();
    
SELECT 
    SUM(payment.amountOwed) AS MoneyOwed
FROM
    returned
        INNER JOIN
    user ON user.ID = returned.userID
        INNER JOIN
    payment ON returned.borrowID = payment.borrowID
WHERE
    user.ID = 2 AND payment.isPaid = FALSE;
    
describe book;
select * from author;

SELECT 
    *
FROM
    book
        INNER JOIN
    author ON book.authorID = author.authorID
WHERE
    title LIKE 'h%';

SELECT 
    authorID
FROM
    author
WHERE
    authorName = 'J.K. Rowling';
    
select * from user;

select * from book;
INSERT INTO outgoing 
VALUES 
(1127, 2, 9780545010221, DATE '2017-09-18', DATE '2017-12-23');

SELECT book.title, author.authorName, book.genre, outgoing.expectedReturnDate
                                                FROM user
                                                INNER JOIN outgoing on user.ID = outgoing.userID
                                                INNER JOIN book on book.ISBN = outgoing.bookID
                                                INNER JOIN author on author.authorID = book.authorID
                                                WHERE
                                                user.ID = 2
                                                ORDER BY outgoing.expectedReturnDate;
                                                
describe returned;
select * from wishlist;


CREATE TABLE wishlist (
	requestID INT NOT NULL AUTO_INCREMENT,
    authorID INT,
    genre VARCHAR(20),
    title VARCHAR(50),
    userID INT NOT NULL,
    PRIMARY KEY (requestID),
    FOREIGN KEY (userID) REFERENCES user(ID),
    FOREIGN KEY (authorID) REFERENCES author(authorID)
);

INSERT INTO returned VALUES (1204, 2, 1000000032859, DATE '2017-09-07', DATE '2017-11-22', DATE '2017-11-20', null);

delete from returned where borrowID = 0;

SELECT book.title, 
							author.authorName, 
							book.genre, AVG(rating)
						FROM 
							book 
								INNER JOIN 
							author on book.authorID = author.authorID 
								INNER JOIN 
							returned on returned.bookID = book.ISBN 
						where
					        returned.rating>3 AND book.genre = 'fiction'
                            GROUP BY book.title
					        ORDER BY rating DESC LIMIT 10;