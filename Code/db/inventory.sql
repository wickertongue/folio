DROP TABLE inventory;
DROP TABLE authors;
DROP TABLE books;

CREATE TABLE authors (
  id SERIAL8 primary key,
  forename VARCHAR(255) not null,
  surname VARCHAR(255) not null
);

CREATE TABLE books (
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  publisher VARCHAR(255) not null,
  genre VARCHAR(255),
  description VARCHAR(255) not null,
  cost_to_sell NUMERIC not null,
  cost_to_purchase NUMERIC not null
);

CREATE TABLE inventory (
  id SERIAL8 primary key,
  author_id INT8 references authors(id),
  book_id INT8 references books(id),
  quantity INT8
);
