import MySQLdb
import csv
from faker import Faker
import random


# NOTE: This file was used to populate our SE3309 database. We used three different sources of
# information to load data into the database (which is called librarydatabase). We used two
# csv files with one containing first names and the other containing last names. We then
# used a library called Faker to generate fake names and fake text. To use faker
# you need to install it's library as it is not included in the standard interpreter library.
# To insert this data into the database, we would uncomment sections of the file and run it to
# add the tuples. We used the MySQLdb library to connect to our database and to execute the queries.
# This is how we uploaded all our data into the database. You can see in certain sections of the
# script where we ran different inserts and if properly uncommented it would insert more tuples into a table in the db.

# tl;dr used two csv's and a downloadable library called faker to generate data.
# then ran queries on our database using MySQLdb, the queries are commented out and there are several
# sections of the script that were queries to insert into tables in the db



# f = open('CSV_Database_of_Last_Names.csv')
# d = open('CSV_Database_of_First_Names.csv')
#
# reader = csv.reader(f)
# reader2 = csv.reader(d)
genre = ['horror', 'mystery', 'fiction', 'non-fiction', 'romance', 'comedy', 'scientific', 'adventure', 'satire']
# create a connection to the database and create the cursor
db = MySQLdb.connect("localhost", "root", "root", "librarydatabase")
cursor = db.cursor()
isbn = 9106736020000
fake = Faker()
ia = 1800
roles = ['janitor', 'librarian', 'service desk', 'security', 'assistant']
# for x in range (0, 2000):
#     d.readline()
# for x in range(0, 10):
#     o = random.randint(0, 4)
#     ia = ia + 13

cardnumber = 450032454005000
cardtype = ['VISA', 'AMEX', 'MASTERCARD']
# for x in range(0, 50):
#       cardnumber = cardnumber + 139
#       r = random.randint(1, 5000)
#       r2 = random.randint(0,2)
#       securitynum = random.randint(100, 999)
#
#
#       mystr = "INSERT INTO userpaymentinfo VALUES ('%s', '%s', '%s', DATE '2020-05-15', '%s');" % (cardnumber, r, r2, securitynum)
#       cursor.execute(mystr)
#       print(mystr)

#
# for x in range(0, 75):
#     borrowID = borrowID + 1
#     i = random.randint(1, 600)
#     user = random.randint(0, 6000)
#     mystr="INSERT INTO outgoing VALUES ('%s', '%s', '%s', DATE '2017-08-09, DATE '2017-11-27' ); " % (borrowID, user, i)
#     print(mystr)
#     cursor.execute(mystr)


# for x in range(1, 500):
#     i = random.randint(1, 5000)
#     genrenum = random.randint(0, 8)
#     text = fake.text()
#     text = text[0:13]
#     user = random.randint(0, 6000)
#     mystr = "INSERT INTO wishlist VALUES (0, '%s', '%s', '%s', '%s'); " % (i, genre[genrenum], text, user)
#     print(mystr)
# print(fake.name())
# for x in range(0, 75):
#     isbn = isbn + 1217
#     name = fake.name()
#     text = fake.text()
#     text = text[0:13]
#
#     authornum = random.randint(0, 5000)
#     inventory = random.randint(0, 34)
#     mystr = "INSERT INTO book VALUES ('%s', '%s', DATE '1999-09-01', '%s', '%s', '%s' ); " % (isbn, text, genre[genrenum], inventory, authornum)
#     print(mystr)
#     cursor.execute(mystr)



# for x in range(0, 5000):
#     mystr = "INSERT INTO author VALUES (0, '%s'); " % (fake.name())
#     print(mystr)
#

#
# for x in range(1, 7500):
#     f.readline()
#
# for z in range(1, 2200):
#     d.readline()
#
i = 8000
age = 85

# for y in range(1, 25):
#     str = fake.name()
#     mystr = "INSERT INTO user VALUES (0, '%s', '%s@ola.ca', 85, '992-260-%s', DATE '2014-01-21', DATE '2020-10-11'); " % (str, str[0:3], i)
#     cursor.execute(mystr)
#     i = i + 1
#     print(mystr)

# print(cursor.execute("INSERT INTO user VALUES (0, 'Another Guy', 'another@python.com', 100, '1800-250-9969', DATE '2017-11-21', DATE '2020-11-21'); "))

# for x in range(1, 40):
#     bookID = bookID + 1217
#     borrowID = borrowID + 1
#     user = random.randint(0, 6000)
#     rating = random.randint(0, 5)
#     mystr="INSERT INTO returned VALUES ('%s', '%s', '%s', DATE '2017-08-09', DATE '2017-11-23',  DATE '2017-11-27', '%s'); " % (borrowID, user, bookID, rating)
#     print(mystr)
#     cursor.execute(mystr)
#

# commit the changes to the database, this will actually update the database with the queries we ran
db.commit()

# close the db connection
db.close()



# f.close()
# d.close()