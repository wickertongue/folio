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
  description VARCHAR(255) NOT NULL,
  cost_to_sell NUMERIC NOT NULL,
  cost_to_purchase NUMERIC NOT NULL
);

CREATE TABLE inventory (
  id SERIAL8 primary key,
  author_id INT8 references authors(id),
  book_id INT8 references books(id),
  quantity INT8 NOT NULL
);
