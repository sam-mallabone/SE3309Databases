-- First VIEW
CREATE VIEW Librarians AS
SELECT * FROM Employee
WHERE role = 'librarian'
ORDER BY name;

select name, staffID, role, email from Librarians;

-- Second view created
CREATE VIEW NewBooks(bookName, authorName, genre, publishingDate) AS
SELECT book.title, author.authorName, book.genre, book.publishingDate
FROM book
NATURAL JOIN author
WHERE book.publishingDate > DATE '2017-01-01' 
ORDER BY book.genre;

SELECT * FROM NewBooks;

-- View of authors with books in library
CREATE VIEW AuthorsInLibrary (name, ID) AS
SELECT author.authorName, author.authorID 
FROM author
INNER JOIN book ON author.authorID = book.authorID
ORDER BY author.authorName;

SELECT * FROM AuthorsInLibrary LIMIT 10;