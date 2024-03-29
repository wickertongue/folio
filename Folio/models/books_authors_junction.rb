require('pry')

require_relative("../db/sqlrunner")

class BookAuthorJunction

  attr_reader :id
  attr_accessor :author_id, :book_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @author_id = options['author_id'].to_i
    @book_id = options['book_id'].to_i
  end

# Create

  def save()
    sql = "INSERT INTO books_authors_junction (author_id, book_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@author_id, @book_id]
    author_book_data = SqlRunner.run(sql, values)
    @id = author_book_data.first()['id'].to_i
  end

  # Read

  def self.all()
    sql = "SELECT * FROM books_authors_junction"
    SqlRunner.run(sql)
    author_book_data = SqlRunner.run(sql)
    return author_book_data.map { |author_book| BookAuthorJunction.new(author_book) }
  end

  # Update

  def update()
    sql = "UPDATE books_authors_junction
    SET (author_id, book_id) = ($1, $2)
    WHERE id = $3"
    values = [@author_id, @book_id, @id]
    SqlRunner.run(sql, values)
  end

  # Delete

  def self.delete_all()
    sql = "DELETE FROM books_authors_junction"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM books_authors_junction WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # Other


end
