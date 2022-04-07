-- create the tables for our movies

CREATE TABLE `movies` (
 `movieid` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `title` varchar(100) NOT NULL,
 `year` char(4) DEFAULT NULL,
 PRIMARY KEY (`movieid`)
);


-- insert data into the tables

INSERT INTO movies VALUES
  (1, "Elizabeth", "1998"),
  (2, "Elling", "2001"),
  (3, "Oh Brother Where Art Thou?", "2000"),
  (4, "The Lord of the Rings: The Fellowship of the Ring", "2001"),
  (5, "Up in the Air", "2009");

