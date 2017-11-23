-- First Interest query getting all employees who have a salary over 30000 or have role security
SELECT name, email, role 
FROM employee WHERE salary > 30000 OR role = 'security' 
ORDER BY role;

-- get the users with outgoing romance books and that are over age 35
SELECT user.name, user.email, user.age, book.title
FROM outgoing
INNER JOIN book ON book.ISBN = outgoing.bookID
INNER JOIN user ON user.ID = outgoing.userID
WHERE user.age > 35 AND book.genre = 'romance'
ORDER BY user.name;

-- Get amount of users under the age of 35 with overdue books where they owe more than one dollar and haven't paid yet
SELECT COUNT(*) as UsersWithOverdueBooks
FROM returned 
INNER JOIN payment ON returned.borrowID = payment.borrowID
INNER JOIN user ON returned.userID = user.ID
WHERE user.age < 35 AND payment.amountOwed > 1.00 AND payment.isPaid = 0;

-- Get the book title, author name, genre and inventory of the books with under 10 in stock, and that are of type adventure or horror. 
-- returned in decreasing order by inventory
SELECT book.title, author.authorName, genre, book.inventory
FROM book
NATURAL JOIN author
WHERE book.inventory < 10 AND (book.genre = 'horror' OR book.genre='adventure')
ORDER BY book.inventory DESC;

-- get authors who's names start with an and the books they have written that are present within the library. 
-- order by authors with a book present. Left join so authors without a book are still included in the query.
SELECT author.authorID, author.authorName, book.title, book.genre 
FROM author
LEFT JOIN book ON author.authorID = book.authorID
WHERE author.authorName LIKE 'an%' ORDER BY book.title DESC;

-- Get the person's details who owes the maximum amount of money to the library
SELECT user.name, user.email, user.phoneNumber, MAX(payment.amountOwed) as OwedToLibrary
FROM returned 
INNER JOIN payment ON returned.borrowID = payment.borrowID
INNER JOIN user ON returned.userID = user.ID;
