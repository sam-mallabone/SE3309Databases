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
select authorID from author where authorName = "J.K. Rowling";