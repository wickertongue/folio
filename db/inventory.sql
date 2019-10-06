DROP TABLE books_authors_junction;
DROP TABLE inventory;
DROP TABLE authors;
DROP TABLE books;

CREATE TABLE authors (
  id SERIAL8 primary key,
  forename VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL
);

CREATE TABLE books (
  id SERIAL8 primary key,
  title VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  genre VARCHAR(255),
  description VARCHAR(500) NOT NULL
);

CREATE TABLE inventory (
  id SERIAL8 primary key,
  book_id INT8 references books(id) ON DELETE CASCADE,
  quantity INT8 NOT NULL,
  cost_to_sell DECIMAL(19,4) NOT NULL,
  cost_to_purchase DECIMAL(19,4) NOT NULL
);

CREATE TABLE books_authors_junction (
  id SERIAL8 primary key,
  author_id INT8 references authors(id) ON DELETE CASCADE,
  book_id INT8 references books(id) ON DELETE CASCADE
);
