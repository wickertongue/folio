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

  def current_quantity
    sql = "SELECT inventory.quantity FROM inventory
    WHERE id = $1"
    values = [@id]
    quantity = SqlRunner.run(sql, values)
    quantity.first()['quantity'].to_i
  end

  def reduce_current_quantity_by_one
    new_quantity = current_quantity
    new_quantity -= 1
  end

  def reduce_current_quantity_in_database_by_one
    sql = "UPDATE inventory
    SET quantity = $1
    WHERE id = $2"
    values = [reduce_current_quantity_by_one, @id]
    SqlRunner.run(sql, values)
  end

  def reduce_quantity_by_one()
    quantity = 1
    sql = "UPDATE inventory
    SET quantity = $1
    WHERE id = $2"
    values = [quantity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM inventory WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
