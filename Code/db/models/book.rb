require('pry')

class Book

  def initialise(options)
    @id = options[:id].to_i if options[:id]
    @title = options[:title]
    @publisher = options[:publisher]
    @genre = options[:genre]
    @description = options[:description]
    @cost_to_sell = options[:cost_to_sell].to_i
    @cost_to_purchase = options[:cost_to_purchase].to_i
  end

end
