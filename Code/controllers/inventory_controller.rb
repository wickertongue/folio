require('pry')

require_relative('../main.rb')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/inventory.rb')
also_reload('../models/*')

get '/inventory/?' do
  @inventory = Inventory.all()
  @authors = Author.all()
  @books = Book.all()
  erb(:index)
end

get '/inventory/new' do
  erb(:new)
end
