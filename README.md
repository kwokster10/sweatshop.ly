# sweatshop.ly
A t-shirt site with inventory management and customer-facing functionality.

## Created by

- Tom Shea (<a href='https://github.com/TShea124'>https://github.com/TShea124</a>)
- Julie Kwok (<a href='https://github.com/kwokster10/'>https://github.com/kwokster10/</a>)
- John Costanza (<a href='https://github.com/JC689'>https://github.com/JC689</a>)
- Eric Moskowitz (<a href='https://github.com/3moz'>https://github.com/3moz</a>)

## Technology Used

- Sinatra
- SQLite3
- ActiveRecord

## Entity Relationships:

<img src='./erd.jpeg'/>

## Functionality

###User
- User can 'buy' a quantity of a given shirt if at least that quantity exists in inventory.
- In a tranaction, a user chooses quantity to purchase and enters an email address.
- Available inventory updates to reflect quantities purchased by a user.
- User purchase input is validated on submission (quantity is non-zero, email is valid).
- User sees a confirmation when they make a purchase.
- User can sort t-shirt inventory showing by price (highest to lowest or lowest to highest)

###Admin
- Admin can go to ```/admin``` and see an admin panel.
- Admin can add a shirt, remove a shirt, and update all the attributes of a shirt (quantity, price, image url).
- Admin input on add or edit is validated on submission (quantity is non-zero, email is valid, name is not empty, url is not empty)
- Admin can see all past purchases of a given customer.



