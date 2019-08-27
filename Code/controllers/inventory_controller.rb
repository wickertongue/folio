require('pry')
require('sinatra')
require('sinatra/contrib/all')
also_reload('../models/*')

require_relative('../main.rb')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/inventory.rb')
require_relative('../models/books_authors_junction.rb')

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

get '/inventory/:id' do
  @inventory = Inventory.find(params['id'].to_i)
  @book = Book.find(@inventory.book_id)
  erb(:show)
end

post '/new_author' do
  Author.new(params).save
  BookAuthorJunction.update
  submitted_author = Author.all.pop


  redirect to '/inventory'
end

post '/new_book' do
  Book.new(params).save
  redirect to '/inventory'
end
