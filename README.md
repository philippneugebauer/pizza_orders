# README

## App Requirements

- Ruby >= 3.1
- PostgreSQL

or

- Docker + Compose

## Usage

Docker
```
docker-compose build
docker-compose up
```
The docker setup is so configured that the PostgreSQL doesn't save any data when shut down.
This can be changed by removing the comments around `volumes:` in `docker-compose.yml`.

or
```
install rails env
bundle install
Adapt db settings in config/database.yml
rails db:setup

rails s
```

Then just call localhost:3000 as usual and start using the app.
If you used the seed script, you can immediately start adding orders with the provided data from config file.
Furthermore, if you like to add data, you can use the links provided in the navbar to do so.

## Test Execution:

System tests require `Chrome`. Tests aren't supported within Docker environment.

```
install rails env
bundle install
Adapt db settings in config/database.yml
rails db:setup

rails test
rails test:system
```

The test coverage can be found at `coverage/index.html` after test execution.

## Static Code Analyzer

```
brakeman
rubocop
rubycritic
reek
rails_best_practices
```

I haven't fixed all warnings or silenced them.
It's arguable to which extend you must follow such gems.
Even though such gems are a great indicator for problems, common sense must be applied for its usefulness instead of rigid following.
Anyway, such rules need to be agreed on within the team.

## Requirements

This challenge is about implementing a simple pizza order overview for a restaurant. All orders need to be listed, with the items they contain, their details and the total price. In addition, it is possible to mark orders as completed.

For this purpose, a small full-stack application is to be created with Ruby on Rails, which provides the backend and a web UI to manage the orders.

Furthermore, to mark orders as completed, you can click on the respective button. It should send a PATCH request to a /orders/:id backend endpoint to update the order. Completed orders should then simply no longer be displayed in the UI.

At last, the total price for a pizza order is to be calculated and displayed. For a pizza order several pizzas can be ordered, per pizza the desired size and also special requests (extra ingredients and omit ingredients) can be specified. In addition, there is a possibility to reduce the price of the order by using various discount codes.

 - The price of a pizza depends on the size. Per size there is a "multiplier" that is multiplied by the base price of the pizza.
 - Extra ingredients are also provided with this multiplier.
 - Ingredients that are omitted during preparation do not change the price of the pizza.
 - Promotion codes allow to get pizzas for free; e.g., two small salami pizzas for the price of one. Extra ingredients will still be charged though. Multiple promotion codes can be specified per order. A promotion code can also be applied more than once to the same order (a 2-for-1 code automatically reduces 4 pizzas to 2 for one order).
 - A discount code reduces the total invoice amount by a percentage.


## Domain Model

![domain model image](domain_model.png)

generated with [rails-erd](https://github.com/voormedia/rails-erd)
