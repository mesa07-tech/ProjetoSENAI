
CREATE TABLE authors (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE books (id INTEGER PRIMARY KEY, title TEXT, author_id INTEGER);

INSERT INTO authors (id, name) VALUES (1, 'Author One');
INSERT INTO authors (id, name) VALUES (2, 'Author Two');
INSERT INTO books (id, title, author_id) VALUES (1, 'Book One', 1);
INSERT INTO books (id, title, author_id) VALUES (2, 'Book Two', 2);
