require('pry')

require_relative("../db/sqlrunner")

class Inventory

  attr_reader :author_id, :book_id, :quantity, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @author_id = options['author_id'].to_i
    @book_id = options['book_id'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO inventory (author_id, book_id, quantity)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@author_id, @book_id, @quantity]
    inventory_data = SqlRunner.run(sql, values)
    @id = inventory_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM inventory"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM inventory WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
