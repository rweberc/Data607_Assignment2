-- loadflights.sql

DROP TABLE IF EXISTS critics;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS reviews;


CREATE TABLE critics (
  CriticId integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL
  );
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/critics.csv' 
INTO TABLE critics 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE movies (
  MovieId integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  Title varchar(100) NOT NULL,
  Director varchar(150) NOT NULL
  );
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/movies.csv' 
INTO TABLE movies 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE reviews (
  ReviewId integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  MovieId integer NOT NULL,
  CriticId integer NOT NULL,
  Rating integer
  );
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/reviews.csv' 
INTO TABLE reviews 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT m.Title, c.LastName, r.Rating 
FROM movies as m
LEFT OUTER JOIN reviews as r
	ON m.MovieId = r.MovieId
INNER JOIN critics as c
	ON r.CriticId = c.CriticId;
	
