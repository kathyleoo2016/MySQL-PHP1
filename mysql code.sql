/*
1. install mysql installer
2. install workbench
3. in the terminal of mysql:

3.1 show databases;  #show the current available databases

3.2 CREATE DATABASE databasename;  # create a new database
3.3 USE databasename  # use a specific database
3.4 SELECT DATABASE(); # show the current database
3.5 DROP DATABASE IF EXISTS databasename # drop a database if needed
*/


# create a table
CREATE TABLE student(
     first_name VARCHAR(30) NOT NULL,
     last_name VARCHAR(30) NOT NULL,
     email VARCHAR(60) NULL,
     street VARCHAR(50) NOT NULL,
     city VARCHAR(40) NOT NULL,
     state CHAR(2) NOT NULL DEFAULT "PA",
     zip MEDIUMINT UNSIGNED NOT NULL,
     phone VARCHAR(20) NOT NULL,
     birth_date DATE NOT NULL,
     sex ENUM("M", "F") NOT NULL,
     date_enter TIMESTAMP,
     lunch_cost FLOAT NULL,
     student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);



SHOW TABLES;

DESCRIBE tablename;  # give the structure of table


# insert a new record
INSERT INTO student VALUE
     ("KATHY", "TANG", "kathyleoo@aol.com",
     "123 Benton Street",
     "Santa Clara",
     "CA",
     95050,
     "6692121062",
     "1980-2-22",
     "F",
     NOW(),
     3.50,
     NULL);


# create a new table class
CREATE TABLE class(
    name VARCHAR(30) NOT NULL,
    class_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);


# insert new records to class
 INSERT INTO class VALUE("English", NULL), ("Spanish", NULL), ("Algebra", NULL);


 # create a new table test
 CREATE TABLE test(
    date DATE NOT NULL,
    type ENUM("T", "Q") NOT NULL,
    class_id INT UNSIGNED NOT NULL,
    test_id int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY);


 # create a new table score
 CREATE TABLE score(
    student_id INT UNSIGNED NOT NULL,
    event_id INT UNSIGNED NOT NULL,
    score INT NOT null,
    PRIMARY KEY(event_id, student_id));

# create a new table absence
CREATE TABLE absence(
    student_id INT UNSIGNED NOT null,
    date DATE NOT null,
    PRIMARY KEY(student_id, date));


# add one more attributes into the test table and add it just after the type attribute
ALTER TABLE test
ADD maxscore INT NOT null  AFTER type;


INSERT INTO test VALUE
("2014-08-25", "Q", 95, 1, NULL),
("2014-08-25", "Q", 25, 2, NULL),
("2014-08-25", "Q", 35, 3, NULL),
("2014-08-25", "Q", 45, 2, NULL),
("2014-08-25", "Q", 55, 1, NULL);


# change the event_id in table score
ALTER TABLE score CHANGE event_id test_id
INT UNSIGNED NOT null;


# insert data into score
INSERT INTO score VALUE
(1, 1 ,25),
(1, 2,35),
(2,2,45),
(2,3,55);


# insert data into absence

INSERT INTO absence VALUE
(1,"2014-08-29"),
(2, "2014-08-27");



# rename the tables
RENAME TABLE
student to students,
absence to absences,
class to classes,
score to scores,
test to tests;

# do some table query
SELECT first_name, last_name, state
from students
where state = "CA";

# select the students with birth year larger than 1965
SELECT first_name, last_name, birth_date
from students
where YEAR(birth_date) >= 1965;


SELECT first_name, last_name, birth_date
from students
where MONTH(birth_date) =2 or state = "CA";


# can use && as and, || as or, != as not equal
SELECT first_name, last_name, birth_date
from students
where MONTH(birth_date) !=2 && (state = "CA" || state = "WA");

# check if the value is null or not  (IS NULL , IS NOT NULL)
SELECT last_name 
from students
where last_name IS NULL;

# order the result
SELECT first_name, last_name 
from students
ORDER BY last_name;


# reverse order 
SELECT first_name, last_name 
from students
ORDER BY last_name DESC, first_name ASC;


# limit the number of records get from the query
SELECT first_name, last_name from students
limit 5;

# limit the number of records get from the query and show the 5 to 10 records
SELECT first_name, last_name from students
limit 5, 10;


# concate the values that queried from the database and show them
SELECT CONCAT (first_name, " " , last_name) AS "Name",
CONCAT (city, " ", state) AS "Hometown"
from students;


# use like to find the result with some pattern
# starts with D and ends with n
SELECT last_name, first_name
from students
where first_name LIKE "D%" or last_name LIKE '%n';


# one _ means one character
SELECT last_name, first_name
from students
where first_name LIKE "___Y";

# distinct state
SELECT DISTINCT state from students ORDER BY state;

#count the number of distinct district
SELECT COUNT(DISTINCT state) from students ORDER BY state;

# count the total students in the students table * means all the number
SELECT COUNT(*) from students


# group our data
SELECT sex, COUNT(*) from students GROUP BY sex;

SELECT MONTH(birth_date) as "Month", COUNT(*)
from students
GROUP BY Month
ORDER BY Month



# having function, means if, if the amount of each states larger than 1
# except COUNT, can also use
    # SUM
    # AVE
    # MAX
    # MIN
    # more are on the onenote, MySQL 
SELECT state, COUNT(state) AS "Amount"
from students
group BY state
having Amount >1 


# delete a record
delete from absences where student_id = 


# add one more attributes to absences
ALTER TABLE absences
ADD COLUMN test_taken CHAR(1) NOT NULL DEFAULT "F";
AFTER student_id;

# change the test_taken to ENUM
ALTER TABLE absences
MODIFY COLUMN test_taken ENUM("T", "F") NOT NULL DEFAULT "F";


# drop the test_taken to ENUM
ALTER TABLE absences
DROP COLUMN test_taken;


# Update a record
UPDATE scores SET score = 25
where student_id = 2 and test_id =1;

# between
SELECT first_name, last_name from students
where birth_date
between "1960-1-1" and "1980-2-23";

# query base on the list
SELECT first_name, last_name from students
where first_name IN ("Kathy", "Bob", "Max");


# join 2 table
SELECT scores.student_id, tests.date, scores.score, tests.maxscore
from tests, scores
where date = "2014-02-22"
and tests.test_id = scores.test_id;


# join 3 tables
SELECT scores.student_id, tests.date, scores.score, tests.maxscore
from tests, scores, students
where date = "2014-02-22"
and tests.test_id = scores.test_id
and scores.student_id = students.student_id;


# left join / can be changed to inner join, right join
SELECT CONCAT (students.first_name, " " , students.last_name) AS Name, COUNT(absences.date) as abs
from students left join absences
on students.student_id = absences.student_id
GROUP BY students.student_id;


# MySQL with PHP
# Grant access
GRANT INSERT, SELECT, DELETE, UPDATE ON test3.*
     to 'studentweb'@'localhost'
     identified by "turtledove";

# create 3 new php
# mysqli_connect.php
# getstudentinfo.php
# addstudent.php