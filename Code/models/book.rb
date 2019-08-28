require("pry")

require_relative("../db/sqlrunner")

class Book

  attr_reader :id
  attr_accessor :title, :publisher, :genre, :description

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @publisher = options['publisher']
    @genre = options['genre']
    @description = options['description']
  end

# Create

  def save()
    sql = "INSERT INTO books (title, publisher, genre, description)
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@title, @publisher, @genre, @description]
    book_data = SqlRunner.run(sql, values)
    @id = book_data.first()['id'].to_i
  end

# Read

  def self.all()
    sql = "SELECT * FROM books"
    SqlRunner.run(sql)
    book_data = SqlRunner.run(sql)
    return book_data.map { |book| Book.new(book) }
  end

  def authors()
    sql = "SELECT authors.* FROM authors
    INNER JOIN inventory
    ON inventory.author_id = authors.id
    WHERE inventory.book_id = $1"
    values = [@id]
    author_data = SqlRunner.run(sql, values)
    return author_data.map { |author| Author.new(author) }
  end

  def self.find(id)
    sql = "SELECT * FROM books
    WHERE id = $1"
    values = [id]
    book_data = SqlRunner.run(sql, values)
    return Book.new(book_data.first)
  end

# Update

  def update()
    sql = "UPDATE books
    SET (title, publisher, genre, description) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@title, @publisher, @genre, @description, @id]
    SqlRunner.run(sql, values)
  end

# Delete

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = "DELETE FROM books WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  # Other

end
