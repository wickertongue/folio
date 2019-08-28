# Folio
## An Inventory Management App for Bookshops

Folio is an inventory management app created for small bookstores. The application allows the user to create, edit, delete and track books stored in their inventory. The app is intended to be used by employees, and not by clients/customers.

## Getting Started

Create a database using PostSQL called inventory by running the below in your CLI
```
createdb inventory
```
Link the database to inventory.sql which can be found in the db folder within code
```
sql -d inventory -f inventory.sql
```
To launch Sinatra and create the web environment, run the below in your CLI
```
ruby main.rb
```
Browse to [http://localhost:4567](http://localhost:4567/)

## Running Tests

Tests can be run by requiring and using pry within the ruby files

## Using Folio

To create a new item that will show in the inventory on the homepage, a new author, a new book, and a new inventory item must be created. All of these can be created from the options in the left sidebar.
