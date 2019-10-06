require('sinatra')
require('sinatra/contrib/all')
require('rubygems')
require('bundler/setup')

also_reload('./models/*')

require_relative('controllers/author_controller')
require_relative('controllers/book_controller')
require_relative('controllers/inventory_controller')

get '/' do
  redirect to '/inventory'
end
