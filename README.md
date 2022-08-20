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

## Domain Model

[domain_model.pdf](domain_model.pdf) visualizes the domain model generated with [rails-erd](https://github.com/voormedia/rails-erd)
