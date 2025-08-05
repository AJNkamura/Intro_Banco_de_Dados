
USE movie_db;

-- questao 09
-- Tabela de atores
CREATE TABLE actor (
    actor_ID INT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (actor_ID)
);

-- Tabela de filmes
CREATE TABLE movie (
    movie_ID INT,
    title VARCHAR(200) NOT NULL,
    PRIMARY KEY (movie_ID)
);

-- Tabela de papéis (ligação entre ator e filme)
CREATE TABLE actor_role (
    movie_ID INT,
    actor_ID INT,
    rolename VARCHAR(100),
    PRIMARY KEY (movie_ID, actor_ID),
    FOREIGN KEY (movie_ID) REFERENCES movie(movie_ID),
    FOREIGN KEY (actor_ID) REFERENCES actor(actor_ID)
);

-- questao 10
-- Inserir atores
INSERT INTO actor (actor_ID, name) VALUES
(1, 'Charlie Chaplin'),
(2, 'Leonardo DiCaprio'),
(3, 'Emma Watson'),
(4, 'Tom Cruise'),
(5, 'Meryl Streep'),
(99, 'Amanda');

-- Inserir filmes
INSERT INTO movie (movie_ID, title) VALUES
(1, 'Modern Times'),
(2, 'Titanic'),
(3, 'Mission: Impossible'),
(4, 'The Iron Lady'),
(5, 'Harry Potter');

-- Inserir papéis
INSERT INTO actor_role (movie_ID, actor_ID, rolename) VALUES
(1, 1, 'The Tramp'),
(2, 2, 'Jack Dawson'),
(3, 4, 'Ethan Hunt'),
(4, 5, 'Margaret Thatcher'),
(5, 3, 'Hermione Granger'),
(1, 99, 'Amanda');  

-- questao 11
SELECT m.title AS movie_title, COUNT(a_r.rolename) AS number_of_roles
FROM movie as m
JOIN actor_role as a_r ON m.movie_ID = a_r.movie_ID
JOIN actor as a ON a_r.actor_ID = a.actor_ID
WHERE a.name = 'Charlie Chaplin'
GROUP BY m.movie_ID;

-- questao 12
SELECT a.name
FROM actor as a
LEFT JOIN actor_role as a_r ON a.actor_ID = a_r.actor_ID
WHERE a_r.movie_ID IS NULL;

-- questao 13
SELECT a.name AS actor_name, 
       CASE 
           WHEN ar.movie_ID IS NULL THEN NULL 
           ELSE m.title 
       END AS movie_title
FROM actor a
LEFT JOIN actor_role ar ON a.actor_ID = ar.actor_ID
LEFT JOIN movie m ON ar.movie_ID = m.movie_ID;

