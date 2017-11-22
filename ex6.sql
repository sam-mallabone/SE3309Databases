-- Three different kinds of updates
-- This won't be able to be replicated because we already ran this which deleted this entries
DELETE FROM user WHERE age > 80 OR 'amand%';

-- Extending the amount of time the book is borrowed for all books that have to be returned on a certain day
UPDATE outgoing SET expectedReturnDate = DATE '2018-01-02' WHERE expectedReturnDate = DATE '2017-12-29';

-- select * from outgoing;
-- select * from book;
-- INSERT INTO outgoing VALUES (1105, 146, 2004000036510, DATE '2017-09-14', DATE '2017-12-29');

-- Changing the foreign key for a book to be written by a different author
UPDATE book SET authorID = 1236 WHERE authorID = 1229;

select * from book;