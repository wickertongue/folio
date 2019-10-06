require('sinatra')
require('sinatra/contrib/all')
require('rubygems')
require('bundler/setup')

also_reload('../models/*')

require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/inventory.rb')
require_relative('../models/books_authors_junction.rb')

post '/book/submitted_book' do
  new_book = Book.new(params)
  new_book.save
  junction_hash = {"author_id" => params["author_join"], "book_id" => new_book.id}
  BookAuthorJunction.new(junction_hash).save
  redirect to '/inventory'
end

post '/book/:id/delete' do
  Book.destroy(params[:id])
  redirect to ("/book/view_books")
end

get '/book/new_book' do
  @authors = Author.all()
  erb(:"book/new")
end

get '/book/view_books' do
  @books = Book.all()
  erb(:"book/show")
end
