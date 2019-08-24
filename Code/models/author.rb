require('pry')

require_relative("../db/sqlrunner")

class Author

  attr_reader :forename, :surname, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @forename = options['forename']
    @surname = options['surname']
  end

  def save()
    sql = "INSERT INTO authors (forename, surname)
    VALUES ($1, $2)
    RETURNING id"
    values = [@forename, @surname]
    author_data = SqlRunner.run(sql, values)
    @id = author_data.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM authors WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def full_name
    return "#{@forename.capitalize} #{@surname.capitalize}"
  end

end
