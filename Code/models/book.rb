require('pry')

require_relative("../db/sqlrunner")

class Book

  attr_reader :id
  attr_accessor :title, :publisher, :genre, :description, :cost_to_sell, :cost_to_purchase

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @publisher = options['publisher']
    @genre = options['genre']
    @description = options['description']
    @cost_to_sell = options['cost_to_sell'].to_i
    @cost_to_purchase = options['cost_to_purchase'].to_i
  end

# Create

  def save()
    sql = "INSERT INTO books (title, publisher, genre, description, cost_to_sell, cost_to_purchase)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@title, @publisher, @genre, @description, @cost_to_sell, @cost_to_purchase]
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

# Update

  def update()
    sql = "UPDATE books
    SET (title, publisher, genre, description, cost_to_sell, cost_to_purchase) = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@title, @publisher, @genre, @description, @cost_to_sell, @cost_to_purchase, @id]
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

  # Other

  def more_than_one_author_for_book?
    if authors.count > 1
      true
    else
      false
    end
  end 

end
