require_relative("../db/sqlrunner")

class Author

  attr_reader :id
  attr_accessor :forename, :surname

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @forename = options['forename']
    @surname = options['surname']
  end

# Create

  def save()
    sql = "INSERT INTO authors (forename, surname)
    VALUES ($1, $2)
    RETURNING id"
    values = [@forename, @surname]
    author_data = SqlRunner.run(sql, values)
    @id = author_data.first()['id'].to_i
  end

# Read

  def self.all()
    sql = "SELECT * FROM authors"
    SqlRunner.run(sql)
    author_data = SqlRunner.run(sql)
    return author_data.map { |author| Author.new(author) }
  end

  def self.find(id)
    sql = "SELECT * FROM authors
    WHERE id = $1"
    values = [id]
    book_data = SqlRunner.run(sql, values)
    return Author.new(book_data.first)
  end

  def self.find_author_by_book_id(id)
    sql = "SELECT authors.* FROM authors
    INNER JOIN books_authors_junction
    ON books_authors_junction.author_id = authors.id
    INNER JOIN books
    ON books.id = books_authors_junction.book_id
    WHERE book_id = $1"
    values = [id]
    author_data = SqlRunner.run(sql, values)
    return Author.new(author_data.first)
  end

# Update

  def update()
    sql = "UPDATE authors
    SET (forename, surname) = ($1, $2)
    WHERE id = $3"
    values = [@forename, @surname, @id]
    SqlRunner.run(sql, values)
  end

# Delete

  def self.delete_all()
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM authors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.destroy(id)
    sql = "DELETE FROM authors WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

# Other

  def full_name
    return "#{@forename.capitalize} #{@surname.capitalize}"
  end

end
