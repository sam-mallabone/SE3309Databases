-- First VIEW
-- Creates a view of all employees who are librarians
CREATE VIEW Librarians AS
SELECT * FROM Employee
WHERE role = 'librarian'
ORDER BY name;

select * from Librarians;

-- Second view created
-- Create a view of all the books in the library who have been published in 2017
CREATE VIEW NewBooks(bookName, authorName, genre, publishingDate) AS
SELECT book.title, author.authorName, book.genre, book.publishingDate
FROM book
NATURAL JOIN author
WHERE book.publishingDate > DATE '2017-01-01' 
ORDER BY book.genre;

SELECT * FROM NewBooks;

-- View of all authors who have their books currently in the library 
-- IE this excludes all authors who are in the library database but don't have their book in the library currently
CREATE VIEW AuthorsInLibrary (name, ID) AS
SELECT author.authorName, author.authorID 
FROM author
INNER JOIN book ON author.authorID = book.authorID
ORDER BY author.authorName;

SELECT * FROM AuthorsInLibrary LIMIT 10;

-- this works because this view is composed of only one table
INSERT INTO Librarians VALUES (0, DATE '2015-02-12', 35360, 'g@owl.ca', '778-998-2939', 'Jack Johanis', 'librarian');

-- this won't work because this view is composed of multiple tables
INSERT INTO NewBooks VALUES ('Jack and the Magic Hat', 'Jackson Holt', 'adventure', DATE '2017-02-17');