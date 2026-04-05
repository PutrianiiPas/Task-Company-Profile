-- USERS (fans)
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- MANAGEMENTS
CREATE TABLE managements (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

-- ARTISTS
CREATE TABLE artists (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100),
    stage_name VARCHAR(100),
    management_id INT,
    FOREIGN KEY (management_id) REFERENCES managements(id)
);

-- ALBUMS
CREATE TABLE albums (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100),
    release_date DATE,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

-- SONGS
CREATE TABLE songs (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100),
    duration INT,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- MANY TO MANY
CREATE TABLE song_likes (
    id BIGSERIAL PRIMARY KEY,
    user_id INT,
    song_id INT,
    liked_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (song_id) REFERENCES songs(id)
);

-- SAMPLE DATA
INSERT INTO users (name, email) VALUES
('Putriani', 'puput@mail.com'),
('Jeonghan', 'yjeonghan@mail.com');

INSERT INTO managements (name, country) VALUES
('YG Entertainment', 'Korea'),
('PLEDIS Entertainment', 'Korea');

INSERT INTO artists (name, stage_name, management_id) VALUES
('Ahyeon Jeong', 'Ahyeon', 1),
('Wonwoo', 'Jeon', 2);

INSERT INTO albums (title, release_date, artist_id) VALUES
('Drip', '2024-11-1', 1),
('Seventeen Is Right Here', '2024-04-29', 2);

INSERT INTO songs (title, duration, album_id) VALUES
('Forever', 210, 1),
('Maestro', 200, 2);

INSERT INTO song_likes (user_id, song_id, liked_at) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(2, 1, NOW());

SELECT * FROM users;
SELECT * FROM managements;
SELECT * FROM artists;
SELECT * FROM albums;
SELECT * FROM songs;
SELECT * FROM song_likes;