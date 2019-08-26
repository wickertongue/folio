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

# Create

  def save()
    sql = "INSERT INTO inventory (author_id, book_id, quantity)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@author_id, @book_id, @quantity]
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

  def author_or_authors()
    sql = "SELECT * FROM inventory
    INNER JOIN authors
    ON authors.id = inventory.author_id
    WHERE book_id = $1"
    values = [@book_id]
    authors_data = SqlRunner.run(sql, values)
    return authors_data.map { |author| Author.new(author) }
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
    SET (author_id, book_id, quantity) = ($1, $2, $3)
    WHERE id = $4"
    values = [@author_id, @book_id, @quantity, @id]
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


  def more_than_one_author_for_a_single_book?()
    if author_or_authors.count > 1
      true
    else
      false
    end
  end

  def merge_authors_if_necessary()
    author_or_authors
    if more_than_one_author_for_a_single_book? == true
      authors = author_or_authors.map { |author| author.full_name }
      return authors
    else
      return_author_or_authors
    end
  end

end
