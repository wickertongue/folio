require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/book.rb')
also_reload('../models/*')

get '/index' do
  @books = Book.all()
  @authors = Author.all()
  erb ( :index )
end
