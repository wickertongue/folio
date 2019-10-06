require_relative("../models/book")
require_relative("../models/author")
require_relative("../models/inventory")
require_relative("../models/books_authors_junction")

BookAuthorJunction.delete_all()
Inventory.delete_all()
Author.delete_all()
Book.delete_all()

book1 = Book.new({
  "title" => "PopCo",
  "publisher" => "Canongate Books",
  "genre" => "Science Fiction",
  "description" => "PopCo is a grown-up adventure of family secrets, puzzles and the power of numbers."
  })

book1.save()

book2 = Book.new({
  "title" => "Pale Fire",
  "publisher" => "Penguin Modern Classics",
  "genre" => "Experimental Literature",
  "description" => "A novel constructed around the last great poem of a fictional American poet, John Shade, and an account of his death. The poem appears in full and the narrative develops through the lengthy, and increasingly eccentric, notes by his posthumous editor."
  })

book2.save()

book3 = Book.new({
  "title" => "Dune",
  "publisher" => "Hodder Paperbacks",
  "genre" => "Science Fiction",
  "description" => "The epic story of the planet Arrakis, its Atreides rulers and their mortal enemies the Harkonnens is the finest, most widely acclaimed and enduring science fiction novel of this century."
  })

book3.save()

book4 = Book.new({
  "title" => "The End of Mr. Y",
  "publisher" => "Canongate Books",
  "genre" => "Science Fiction",
  "description" => "When Ariel Manto uncovers a copy of The End of Mr. Y in a second-hand bookshop, she can't believe her eyes. She knows enough about its author, the outlandish Victorian scientist Thomas Lumas, to know that copies are exceedingly rare. And, some say, cursed."
  })

book4.save()

book5 = Book.new({
  "title" => "Black House",
  "publisher" => "Random House",
  "genre" => "Horror",
  "description" => "As a child, Jack visited the Territories, a menacing place of violence and madness, to save his dying mother. Now, if the latest child victim is to be saved, Jack must retrieve his lost childhood memories, and revisit the one place he hoped never to see again."
  })

book5.save()

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

author4 = Author.new({
  "forename" => "Stephen",
  "surname" => "King"
  })

author4.save()

author5 = Author.new({
  "forename" => "Peter",
  "surname" => "Straub"
  })

author5.save()

inventory1 = Inventory.new({
  "book_id" => book1.id,
  "quantity" => "3",
  "cost_to_sell" => "9.99",
  "cost_to_purchase" => "7.00"
  })

inventory1.save()

inventory2 = Inventory.new({
  "book_id" => book2.id,
  "quantity" => "1",
  "cost_to_sell" => "14.00",
  "cost_to_purchase" => "10.00"
  })

inventory2.save()

inventory3 = Inventory.new({
  "book_id" => book3.id,
  "quantity" => "7",
  "cost_to_sell" => "9.99",
  "cost_to_purchase" => "7.00"
  })

inventory3.save()

inventory4 = Inventory.new({
  "book_id" => book4.id,
  "quantity" => "7",
  "cost_to_sell" => "9.99",
  "cost_to_purchase" => "7.00"
  })

inventory4.save()

inventory5 = Inventory.new({
  "book_id" => book5.id,
  "quantity" => "2",
  "cost_to_sell" => "13.00",
  "cost_to_purchase" => "9.00"
  })

inventory5.save()

book_author_junction1 = BookAuthorJunction.new({
  "author_id" => author1.id,
  "book_id" => book1.id
  })

book_author_junction1.save()

book_author_junction2 = BookAuthorJunction.new({
  "author_id" => author2.id,
  "book_id" => book2.id,
  })

book_author_junction2.save()

book_author_junction3 = BookAuthorJunction.new({
  "author_id" => author3.id,
  "book_id" => book3.id,
  })

book_author_junction3.save()

book_author_junction4 = BookAuthorJunction.new({
  "author_id" => author1.id,
  "book_id" => book4.id,
  })

book_author_junction4.save()

book_author_junction5 = BookAuthorJunction.new({
  "author_id" => author4.id,
  "book_id" => book5.id,
  })

book_author_junction5.save()

book_author_junction6 = BookAuthorJunction.new({
  "author_id" => author5.id,
  "book_id" => book5.id,
  })

book_author_junction6.save()
