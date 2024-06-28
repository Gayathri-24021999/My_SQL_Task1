CREATE DATABASE IMDB;
USE IMDB;

-- Movies table
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year YEAR,
    description TEXT
);

-- Media table
CREATE TABLE Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    media_type ENUM('video', 'image'),
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
-- Genres table
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Movie_Genres table (many-to-many relationship)
CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Reviews table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 10),
    review_text TEXT,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Artists table
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    biography TEXT
);

-- Skills table
CREATE TABLE Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Artist_Skills table (many-to-many relationship)
CREATE TABLE Artist_Skills (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);

-- Movie_Roles table
CREATE TABLE Movie_Roles (
    movie_id INT,
    artist_id INT,
    role_name VARCHAR(255),
    PRIMARY KEY (movie_id, artist_id, role_name),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- Inserting data into Movies
INSERT INTO Movies (title, release_year, description) VALUES
('Inception', 2010, 'A thief who steals corporate secrets through the use of dream-sharing technology...'),
('The Matrix', 1999, 'A computer hacker learns from mysterious rebels about the true nature of his reality...');

-- Inserting data into Media
INSERT INTO Media (movie_id, media_type, url) VALUES
(1, 'video', 'http://example.com/inception_trailer.mp4'),
(1, 'image', 'http://example.com/inception_poster.jpg'),
(2, 'video', 'http://example.com/matrix_trailer.mp4'),
(2, 'image', 'http://example.com/matrix_poster.jpg');

-- Inserting data into Genres
INSERT INTO Genres (name) VALUES ('Sci-Fi'), ('Action'), ('Drama');

-- Inserting data into Movie_Genres
INSERT INTO Movie_Genres (movie_id, genre_id) VALUES
(1, 1), (1, 2), (2, 1), (2, 2);

-- Inserting data into Users
INSERT INTO Users (username, email) VALUES ('john_doe', 'john@example.com'), ('jane_smith', 'jane@example.com');

-- Inserting data into Reviews
INSERT INTO Reviews (movie_id, user_id, rating, review_text) VALUES
(1, 1, 9, 'Amazing movie with a mind-bending plot!'),
(2, 2, 10, 'A revolutionary film that redefined the genre.');

-- Inserting data into Artists
INSERT INTO Artists (name, date_of_birth, biography) VALUES
('Leonardo DiCaprio', '1974-11-11', 'An American actor and film producer.'),
('Keanu Reeves', '1964-09-02', 'A Canadian actor. Known for his roles in The Matrix and John Wick.');

-- Inserting data into Skills
INSERT INTO Skills (name) VALUES ('Acting'), ('Directing'), ('Producing');

-- Inserting data into Artist_Skills
INSERT INTO Artist_Skills (artist_id, skill_id) VALUES
(1, 1), (1, 3), (2, 1);

-- Inserting data into Movie_Roles
INSERT INTO Movie_Roles (movie_id, artist_id, role_name) VALUES
(1, 1, 'Dom Cobb'), (2, 2, 'Neo');