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

book2 = Book.new({
  "title" => "Pale Fire",
  "publisher" => "Penguin Modern Classics",
  "genre" => "Experimental Literature",
  "description" => "A novel constructed around the last great poem of a fictional American poet, John Shade, and an account of his death. The poem appears in full and the narrative develops through the lengthy, and increasingly eccentric, notes by his posthumous editor.",
  "cost_to_sell" => "14.00",
  "cost_to_purchase" => "10.00"
  })

book2.save()

book3 = Book.new({
  "title" => "Dune",
  "publisher" => "Hodder Paperbacks",
  "genre" => "Science Fiction",
  "description" => "The epic story of the planet Arrakis, its Atreides rulers and their mortal enemies the Harkonnens is the finest, most widely acclaimed and enduring science fiction novel of this century.",
  "cost_to_sell" => "9.99",
  "cost_to_purchase" => "7.00"
  })

book3.save() 

author1 = Author.new({
  "forename" => "Scarlett",
  "surname" => "Thomas"
  })

author1.save()

author2 = Author.new({
  "forename" => "Vladimir",
  "surname" => "Nabokov"
  })

author2.save()

author3 = Author.new({
  "forename" => "Frank",
  "surname" => "Herbert"
  })

author3.save()

inventory1 = Inventory.new({
  "author_id" => author1.id,
  "book_id" => book1.id,
  "quantity" => "3"
  })

inventory1.save()

inventory2 = Inventory.new({
  "author_id" => author2.id,
  "book_id" => book2.id,
  "quantity" => "1"
  })

inventory2.save()

inventory3 = Inventory.new({
  "author_id" => author3.id,
  "book_id" => book3.id,
  "quantity" => "7"
  })

inventory3.save()

binding.pry
nil
