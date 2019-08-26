require('pry')

require_relative("../db/sqlrunner")

class Inventory

  attr_reader :book_id, :id
  attr_accessor :quantity, :cost_to_sell, :cost_to_purchase

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @book_id = options['book_id'].to_i
    @quantity = options['quantity'].to_i
    @cost_to_sell = options['cost_to_sell'].to_i
    @cost_to_purchase = options['cost_to_purchase'].to_i
  end

# Create

  def save()
    sql = "INSERT INTO inventory (book_id, quantity, cost_to_sell, cost_to_purchase)
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@book_id, @quantity, @cost_to_sell, @cost_to_purchase]
    inventory_data = SqlRunner.run(sql, values)
    @id = inventory_data.first()['id'].to_i
  end

# Read

  def self.all()
    sql = "SELECT * FROM inventory"
    SqlRunner.run(sql)
    inventory_data = SqlRunner.run(sql)
    return inventory_data.map { |item| Inventory.new(item) }
  end

  def book()
    sql = "SELECT * from books
    WHERE id = $1"
    values = [@book_id]
    book_data = SqlRunner.run(sql, values)
    return Book.new (book_data.first())
  end

# Update

  def update()
    sql = "UPDATE inventory
    SET (book_id, quantity, cost_to_sell, cost_to_purchase) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@book_id, @quantity, @cost_to_sell, @cost_to_purchase, @id]
    SqlRunner.run(sql, values)
  end

# Delete

  def self.delete_all()
    sql = "DELETE FROM inventory"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM inventory WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# Other

  def reduce_current_quantity_by_one()
    unless @quantity < 1
      @quantity -= 1
      update()
    end
  end

  # def more_than_one_author_for_a_single_book?()
  #   if author_or_authors.count > 1
  #     true
  #   else
  #     false
  #   end
  # end
  #
  # def merge_authors_if_necessary()
  #   author_or_authors
  #   if more_than_one_author_for_a_single_book? == true
  #     authors = author_or_authors.map { |author| author.full_name }
  #     return authors
  #   else
  #     return_author_or_authors
  #   end
  # end

  # def author_or_authors()
  #   sql = "SELECT * FROM inventory
  #   INNER JOIN authors
  #   ON authors.id = inventory.author_id
  #   WHERE book_id = $1"
  #   values = [@book_id]
  #   authors_data = SqlRunner.run(sql, values)
  #   return authors_data.map { |author| Author.new(author) }
  # end

end
