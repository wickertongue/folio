require('pry')

require_relative("../models/book")
require_relative("../models/author")
require_relative("../models/inventory")

Inventory.delete_all()
Author.delete_all()
Book.delete_all()

book1 = Book.new({
  "title" => "PopCo",
  "publisher" => "Canon Gate",
  "genre" => "Science Fiction",
  "description" => "PopCo is a grown-up adventure of family secrets, puzzles and the power of numbers.",
  "cost_to_sell" => "9.99",
  "cost_to_purchase" => "7.00"
  })

book1.save()

author1 = Author.new({
  "forename" => "Scarlett",
  "surname" => "Thomas"
  })

author1.save()

inventory1 = Inventory.new({
  "author_id" => author1.id,
  "book_id" => book1.id,
  "quantity" => "3"
  })

inventory1.save()

binding.pry
nil