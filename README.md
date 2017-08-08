# Jungle

Jungle is a mini e-commerce application built with Rails 4.2. Jungle uses a PostgreSQL database to store categories, products, users, and user reviews. [Stripe's API](https://stripe.com/docs/api) is used for payment processing. Administrators are able to add and remove categories and products. Users are able to make purchases and review products. Rspec testing is employed with coverage for user registration and authentication.

Jungle is course work from [Lighthouse Labs](https://github.com/lighthouse-labs/). My additions to [the template exercise](https://github.com/lighthouse-labs/jungle-rails) include:

* Admin features
  * Admins can add/remove categories and products
  * Admin HTTP authetication
* User features
  * User registration
  * User authentication
  * User password hashing
* Product features
  * Authenticated users can add reviews of products and delete their reviews
  * "Sold Out" label added to out-of-stock products
* Order features
  * Order details page
  * Order summary email
* RSpec testing
  * Coverage for user creation and authentication

## See It Deployed

View a Heroku dyno running Jungle here: https://powerful-falls-46409.herokuapp.com/

## Local Setup & Run Instructions

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a [Stripe account](https://stripe.com/)
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios at checkout. Use a date in the future for expiration and 111 for the security number.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Testing: RSpec

## Screenshots

![Jungle product index](https://raw.githubusercontent.com/ty2k/jungle-rails/master/docs/Jungle-screenshot-product-index.png)

![Jungle view product page](https://raw.githubusercontent.com/ty2k/jungle-rails/master/docs/Jungle-screenshot-view-product-page.png)

## Contact the Author

[Tyler Krys](https://tylerkrys.ca) made this to learn about web development.