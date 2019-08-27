require('sinatra')
require('sinatra/contrib/all')
also_reload('./models/*')
require('pry')

require_relative('controllers/author_controller')
require_relative('controllers/book_controller')
require_relative('controllers/inventory_controller')

get '/' do
  redirect to '/inventory'
end
