require('sinatra')
require('sinatra/contrib/all')
also_reload('./models/*')

require_relative('controllers/inventory_controller.rb')
