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

  def author_or_authors()
    sql = "SELECT * FROM authors
    INNER JOIN books_authors_junction
    ON authors.id = books_authors_junction.author_id
    WHERE book_id = $1"
    values = [@book_id]
    authors = SqlRunner.run(sql, values)
    return authors.map { |author| Author.new(author) }
  end

  def self.find(id)
    sql = "SELECT * FROM inventory
    WHERE id = $1"
    values = [id]
    inventory_data = SqlRunner.run(sql, values)
    return Inventory.new(inventory_data.first)
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

## Not working

  def present_author_or_authors
    author_or_authors.each { |author|
    return author.full_name }
  end

  # def present_author_or_authors_string
  #   present_author_or_authors.to_s
  # end

  def reduce_current_quantity_by_one()
    unless @quantity < 1
      @quantity -= 1
      update()
    end
  end

end
