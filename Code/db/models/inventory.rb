require('pry')

class Inventory

  def initialise
    @id = options[:id].to_i if options[:id]
    @author_id = options[:author_id].to_i
    @book_id = options[:book_id].to_i
    @quantity = options[:quantity].to_i
  end

end
