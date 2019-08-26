require('pry')

require_relative('../main.rb')
require_relative('../models/book')
require_relative('../models/author')
require_relative('../models/inventory')
require_relative('../models/books_authors_junction')
also_reload('../models/*')

get '/inventory/?' do
  @books_authors_junction = BookAuthorJunction.all()
  @inventory = Inventory.all()
  @authors = Author.all()
  @books = Book.all()
  erb(:index)
end

get '/inventory/new' do
  erb(:new)
end
