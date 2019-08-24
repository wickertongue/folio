require('pry')

class Author

  def initialise(options)
    @id = options[:id].to_i if options[:id]
    @forename = options[:forename]
    @surname = options[:surname]
  end

end
