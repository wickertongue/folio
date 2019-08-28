require('pry')
require('sinatra')
require('sinatra/contrib/all')
also_reload('../models/*')

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

get '/inventory/new_item' do
  @inventory = Inventory.all()
  @books = Book.all()
  @authors = Author.all()
  erb(:"inventory/new")
end

post '/inventory/submitted_item' do
  Inventory.new(params).save
  redirect to '/inventory'
end

post '/inventory/submitted_edits' do
  edited_data = Inventory.new(params)
  edited_data.update
  binding.pry
  nil
  redirect to "/inventory/#{params['book_id']}"
end

# post '/inventory/submitted_edits' do
#   inventory_hash = {
#     "book_id" => params["book_id"],
#     "quantity" => params["quantity"],
#     "cost_to_sell" => params["cost_to_sell"],
#     "cost_to_purchase" => params["cost_to_purchase"]
#   }
#   submitted_edit = Inventory.new(inventory_hash)
#   submitted_edit.update
#   redirect to "/inventory/#{params['book_id']}"
# end

# post '/book/submitted_book' do
#   new_book = Book.new(params)
#   new_book.save
#   junction_hash = {"author_id" => params["author_join"], "book_id" => new_book.id}
#   BookAuthorJunction.new(junction_hash).save
#   redirect to '/inventory'
# end

# post '/students/:id' do
#   student = Student.new(params)
#   student.update
#   redirect to "/students/#{params['id']}"
# end

get '/inventory/:id' do
  @inventory = Inventory.find(params['id'].to_i)
  @book = Book.find(@inventory.book_id)
  erb(:show)
end

get '/inventory/:id/edit' do
  @inventory = Inventory.find(params['id'].to_i)
  @book = Book.find(@inventory.book_id)
  @books = Book.all()
  @authors = Author.all()
  erb(:"inventory/edit")
end
