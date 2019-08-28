require('pry')
require('sinatra')
require('sinatra/contrib/all')
also_reload('../models/*')

require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/inventory.rb')
require_relative('../models/books_authors_junction.rb')

get '/author/new_author' do
  erb(:"author/new")
end

post '/author/submitted_author' do
  Author.new(params).save
  redirect to '/inventory'
end

get '/author/view_authors' do
  @authors = Author.all()
  erb(:"author/show")
end
