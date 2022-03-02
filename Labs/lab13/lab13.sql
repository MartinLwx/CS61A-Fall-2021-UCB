.read data.sql


CREATE TABLE bluedog AS
SELECT color, pet 
FROM students
WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE bluedog_songs AS
SELECT color, pet, song
FROM students
WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE smallest_int_having AS
SELECT time, smallest
FROM students AS s 
GROUP BY s.smallest
HAVING count(*) = 1;


CREATE TABLE matchmaker AS
SELECT s1.pet, s1.song, s1.color, s2.color
FROM students AS s1, students AS s2
WHERE s1.pet = s2.pet and s1.song = s2.song and s1.time < s2.time;


CREATE TABLE sevens AS
SELECT s.seven
FROM students AS s, numbers AS n 
WHERE s.time = n.time and s.number = 7 and n.'7' = "True";


CREATE TABLE avg_difference AS
SELECT round(avg(abs(number - smallest)))
FROM students;

