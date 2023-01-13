/*
Created: 2022-10-03
Modified: 2022-10-17
Model: PostgreSQL 10
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Showtime

CREATE TABLE "Showtime"
(
  "showtimeid" Integer NOT NULL,
  "Date" Date NOT NULL,
  "Time" Time NOT NULL,
  "Duration" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Showtime" ADD CONSTRAINT "PK_Showtime" PRIMARY KEY ("showtimeid")
;

-- Table Tickects

CREATE TABLE "Tickects"
(
  "Tickectid" Integer NOT NULL,
  "CinemaName" Character(100) NOT NULL,
  "Price" Integer NOT NULL,
  "showtime" Time NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Tickects" ADD CONSTRAINT "PK_Tickects" PRIMARY KEY ("Tickectid")
;

-- Table Cinema Location

CREATE TABLE "Cinema Location"
(
  "Locationid" Integer NOT NULL,
  "cinema name" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Cinema Location" ADD CONSTRAINT "PK_Cinema Location" PRIMARY KEY ("Locationid")
;

-- Table Awards

CREATE TABLE "Awards"
(
  "Movie Award ID" Character varying NOT NULL,
  "Oscars" Character varying NOT NULL,
  "Golden Globe Awards" Character varying NOT NULL,
  "Screen Actors Guild" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Awards" ADD CONSTRAINT "PK_Awards" PRIMARY KEY ("Movie Award ID")
;

-- Table Categories

CREATE TABLE "Categories"
(
  "Best Director" Character varying NOT NULL,
  "Best Movie" Character varying NOT NULL,
  "Best Actor" Bigint NOT NULL,
  "Best Actress" Character varying NOT NULL,
  "Best Supporting Actor" Character varying,
  "Best Supporting Actress" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Categories" ADD CONSTRAINT "PK_Categories" PRIMARY KEY ("Best Director")
;

-- Table Movie Festival

CREATE TABLE "Movie Festival"
(
  "Film Festival ID" Integer NOT NULL,
  "Year" Integer NOT NULL,
  "Tiff and Cannes" Boolean NOT NULL,
  "Sundance Film Festival" Bigint NOT NULL,
  "Boston Film Festival" Character varying NOT NULL,
  "toronto film festival" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie Festival" ADD CONSTRAINT "PK_Movie Festival" PRIMARY KEY ("Film Festival ID")
;

-- Table Movie

CREATE TABLE "Movie"
(
  "Movie_id" Integer NOT NULL,
  "Actors" Character(100) NOT NULL,
  "Directors" Character(100) NOT NULL,
  "Rating" Integer NOT NULL,
  "Release_Date" Date NOT NULL,
  "Genre" Character(100) NOT NULL,
  "Budget" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie" ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("Movie_id")
;

-- Table Director

CREATE TABLE "Director"
(
  "Director_ID" Integer NOT NULL,
  "Location_id" Integer,
  "Department" Character(200) NOT NULL,
  "First_name" Character(200) NOT NULL,
  "surname" Character(200) NOT NULL,
  "Location_of_birth" Character(200) NOT NULL,
  "Year_of_birth" Date NOT NULL,
  "University" Character(200) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship42" ON "Director" ("Location_id")
;

ALTER TABLE "Director" ADD CONSTRAINT "PK_Director" PRIMARY KEY ("Director_ID")
;

-- Table Actor/Actress

CREATE TABLE "Actor/Actress"
(
  "Actor_ID" Integer NOT NULL,
  "First_Name" Character(200) NOT NULL,
  "Surname" Character(200) NOT NULL,
  "Location_of_birth" Character(200) NOT NULL,
  "University" Character(200) NOT NULL,
  "Department" Character(200) NOT NULL,
  "Eye_color" Character(100) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Actor/Actress" ADD CONSTRAINT "PK_Actor/Actress" PRIMARY KEY ("Actor_ID")
;

-- Table Genre

CREATE TABLE "Genre"
(
  "Genre_ID" Integer NOT NULL,
  "Type" Character(200) NOT NULL,
  "Description" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Genre" ADD CONSTRAINT "PK_Genre" PRIMARY KEY ("Genre_ID")
;

-- Table Location

CREATE TABLE "Location"
(
  "Location_id" Integer NOT NULL,
  "Director_ID" Integer,
  "Actor_ID" Integer,
  "City" Character(200) NOT NULL,
  "State" Character(200) NOT NULL,
  "Country" Character(200) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship41" ON "Location" ("Director_ID")
;

CREATE INDEX "IX_Relationship43" ON "Location" ("Actor_ID")
;

ALTER TABLE "Location" ADD CONSTRAINT "PK_Location" PRIMARY KEY ("Location_id")
;

-- Table Movie Tikects

CREATE TABLE "Movie Tikects"
(
  "Tickectid" Integer NOT NULL,
  "Movie_id" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie Tikects" ADD CONSTRAINT "PK_Movie Tikects" PRIMARY KEY ("Tickectid","Movie_id")
;

-- Table Actor/Actresses Movie

CREATE TABLE "Actor/Actresses Movie"
(
  "Actor_ID" Integer NOT NULL,
  "Movie_id" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Actor/Actresses Movie" ADD CONSTRAINT "PK_Actor/Actresses Movie" PRIMARY KEY ("Actor_ID","Movie_id")
;

-- Table Movie Director

CREATE TABLE "Movie Director"
(
  "Movie_id" Integer NOT NULL,
  "Director_ID" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie Director" ADD CONSTRAINT "PK_Movie Director" PRIMARY KEY ("Movie_id","Director_ID")
;

-- Table Movie Genre

CREATE TABLE "Movie Genre"
(
  "Genre_ID" Integer NOT NULL,
  "Movie_id" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie Genre" ADD CONSTRAINT "PK_Movie Genre" PRIMARY KEY ("Genre_ID","Movie_id")
;

-- Table Director Location

CREATE TABLE "Director Location"
(
  "Director_ID" Integer NOT NULL,
  "Location_id" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Director Location" ADD CONSTRAINT "PK_Director Location" PRIMARY KEY ("Director_ID","Location_id")
;

-- Table Actor/Actress Director

CREATE TABLE "Actor/Actress Director"
(
  "Actor_ID" Integer NOT NULL,
  "Director_ID" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Actor/Actress Director" ADD CONSTRAINT "PK_Actor/Actress Director" PRIMARY KEY ("Actor_ID","Director_ID")
;

-- Table Movie Awards

CREATE TABLE "Movie Awards"
(
  "Movie_id" Integer NOT NULL,
  "Movie Award ID" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie Awards" ADD CONSTRAINT "PK_Movie Awards" PRIMARY KEY ("Movie_id","Movie Award ID")
;

-- Table movies at movie festivals

CREATE TABLE "movies at movie festivals"
(
  "Movie_id" Integer NOT NULL,
  "Film Festival ID" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movies at movie festivals" ADD CONSTRAINT "PK_movies at movie festivals" PRIMARY KEY ("Movie_id","Film Festival ID")
;

-- Table Movies Showtimes

CREATE TABLE "Movies Showtimes"
(
  "Movie_id" Integer NOT NULL,
  "showtimeid" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movies Showtimes" ADD CONSTRAINT "PK_Movies Showtimes" PRIMARY KEY ("Movie_id","showtimeid")
;

-- Table movie categories

CREATE TABLE "movie categories"
(
  "Movie_id" Integer NOT NULL,
  "Best Director" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movie categories" ADD CONSTRAINT "PK_movie categories" PRIMARY KEY ("Movie_id","Best Director")
;

-- Table tickects cinema location

CREATE TABLE "tickects cinema location"
(
  "Tickectid" Integer NOT NULL,
  "Locationid" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "tickects cinema location" ADD CONSTRAINT "PK_tickects cinema location" PRIMARY KEY ("Tickectid","Locationid")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "Movie Tikects"
  ADD CONSTRAINT "to gain entry"
    FOREIGN KEY ("Tickectid")
    REFERENCES "Tickects" ("Tickectid")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Tikects"
  ADD CONSTRAINT "to see movie"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor/Actresses Movie"
  ADD CONSTRAINT "acts"
    FOREIGN KEY ("Actor_ID")
    REFERENCES "Actor/Actress" ("Actor_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor/Actresses Movie"
  ADD CONSTRAINT "in movie"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Director"
  ADD CONSTRAINT "movie"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Director"
  ADD CONSTRAINT "directs"
    FOREIGN KEY ("Director_ID")
    REFERENCES "Director" ("Director_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Genre"
  ADD CONSTRAINT "movies have"
    FOREIGN KEY ("Genre_ID")
    REFERENCES "Genre" ("Genre_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Genre"
  ADD CONSTRAINT "different genres"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director Location"
  ADD CONSTRAINT "lives in"
    FOREIGN KEY ("Director_ID")
    REFERENCES "Director" ("Director_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director Location"
  ADD CONSTRAINT "this"
    FOREIGN KEY ("Location_id")
    REFERENCES "Location" ("Location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor/Actress Director"
  ADD CONSTRAINT "works with"
    FOREIGN KEY ("Actor_ID")
    REFERENCES "Actor/Actress" ("Actor_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actor/Actress Director"
  ADD CONSTRAINT "this"
    FOREIGN KEY ("Director_ID")
    REFERENCES "Director" ("Director_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Awards"
  ADD CONSTRAINT "have"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movie Awards"
  ADD CONSTRAINT "many"
    FOREIGN KEY ("Movie Award ID")
    REFERENCES "Awards" ("Movie Award ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movies at movie festivals"
  ADD CONSTRAINT "play"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movies at movie festivals"
  ADD CONSTRAINT "at"
    FOREIGN KEY ("Film Festival ID")
    REFERENCES "Movie Festival" ("Film Festival ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Location"
  ADD CONSTRAINT "lives at this"
    FOREIGN KEY ("Director_ID")
    REFERENCES "Director" ("Director_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "lives at this"
    FOREIGN KEY ("Location_id")
    REFERENCES "Location" ("Location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Location"
  ADD CONSTRAINT "live at this"
    FOREIGN KEY ("Actor_ID")
    REFERENCES "Actor/Actress" ("Actor_ID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movies Showtimes"
  ADD CONSTRAINT "have"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Movies Showtimes"
  ADD CONSTRAINT "many"
    FOREIGN KEY ("showtimeid")
    REFERENCES "Showtime" ("showtimeid")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie categories"
  ADD CONSTRAINT "have"
    FOREIGN KEY ("Movie_id")
    REFERENCES "Movie" ("Movie_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie categories"
  ADD CONSTRAINT "different"
    FOREIGN KEY ("Best Director")
    REFERENCES "Categories" ("Best Director")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "tickects cinema location"
  ADD CONSTRAINT "Relationship48"
    FOREIGN KEY ("Tickectid")
    REFERENCES "Tickects" ("Tickectid")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "tickects cinema location"
  ADD CONSTRAINT "at this"
    FOREIGN KEY ("Locationid")
    REFERENCES "Cinema Location" ("Locationid")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

