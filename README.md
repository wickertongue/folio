# Folio
## An Inventory Management App for Bookshops

Folio is an inventory management app created for small bookstores. The application allows the user to create, edit, delete and track books stored in their inventory. The app is intended to be used by employees, and not by clients/customers.




## Sample - Heroki

Folio is now [running on Heroku](https://folio-inventory-app.herokuapp.com/inventory), you can sample the features there.




## Getting Started
### Installation

Download files, and then run ```ruby main.rb``` in the terminal. In your browser, navigate to http://localhost:4567

### Using Folio

To create a new item that will show in the inventory on the homepage, a new author, a new book, and a new inventory item must be created. All of these can be created from the options in the left sidebar.

## Further Development 

To develop this program further, I would create a wizard which would guide the user through the full creation of an inventory item (currently, the user has to create an author, a book and then an inventory item separately, and then link all three of these when creating an inventory item). 

Further to this, Folio was built to accommodate books with many authors - at present, this feature has not been incorporated into the front-end. Books like "Black House" by Stephen King and Peter Straub currently only show under one author. 

## Running Tests

Tests can be run by requiring and using pry within the ruby files.
