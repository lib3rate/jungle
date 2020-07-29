# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Front-end: Ruby on Rails, SASS

Back-end: Ruby on Rails, PostgreSQL

Testing: RSpec, Capybara

## Screenshots

!["Main products page"](https://github.com/lib3rate/jungle/blob/master/docs/Main%20products%20page.png?raw=true)
!["Specific product page"](https://github.com/lib3rate/jungle/blob/master/docs/Specific%20product%20page.png?raw=true)
!["Cart before checking out"](https://github.com/lib3rate/jungle/blob/master/docs/Cart%20before%20checking%20out.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
