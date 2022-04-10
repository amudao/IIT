-- create the tables for our actors

CREATE TABLE `actors` (
 `movieid` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(100) NOT NULL,
 `year` char(4) DEFAULT NULL,
 PRIMARY KEY (`actorsid`)
);



-- insert data into the tables

INSERT INTO actor VALUES

(1,"Tom Cruise", "July, 6, 1962"),
(2, "Anna Kendrick", "August, 8, 1985"),
(3. "Lee-Min-ho", "June, 22, 1987"),
(4. "")