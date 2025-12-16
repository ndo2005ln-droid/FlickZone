CREATE DATABASE IF NOT EXISTS flickzone;
USE flickzone;

CREATE TABLE IF NOT EXISTS movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    stars INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    review_text TEXT NOT NULL,
    stars INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO movies (title, description, image_url, stars) 
VALUES
("The Shawshank Redemption", "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", "https://m.media-amazon.com/images/S/pv-target-images/169dfa295bcd5cb7a09175b076f41a8ae4c1fbe8ba94cf5baf051160bb1564de.jpg", 5),
("The Godfather", "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", "https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg", 5),
("The Dark Knight", "Batman faces the Joker, a criminal mastermind who wants to plunge Gotham City into anarchy.", "https://tse1.mm.bing.net/th/id/OIP.lCYQZpdqe5UK_DBQgWGfkQHaJ4?rs=1&pid=ImgDetMain&o=7&rm=3", 5);

INSERT INTO users (name, email, password) 
VALUES
("John Doe", "john.doe@example.com", "password123"),
("Jane Smith", "jane.smith@example.com", "password456");

INSERT INTO reviews (user_id, movie_id, review_text, stars)
VALUES
(1, 1, "Amazing movie, one of the best of all time!", 5),
(2, 2, "A true masterpiece, gripping story.", 5);
