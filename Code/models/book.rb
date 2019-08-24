require('pry')

require_relative("../db/sqlrunner")

class Book

  attr_reader :title, :publisher, :genre, :description, :cost_to_sell, :cost_to_purchase, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @publisher = options['publisher']
    @genre = options['genre']
    @description = options['description']
    @cost_to_sell = options['cost_to_sell'].to_i
    @cost_to_purchase = options['cost_to_purchase'].to_i
  end

  def save()
    sql = "INSERT INTO books (title, publisher, genre, description, cost_to_sell, cost_to_purchase)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@title, @publisher, @genre, @description, @cost_to_sell, @cost_to_purchase]
    book_data = SqlRunner.run(sql, values)
    @id = book_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

end
