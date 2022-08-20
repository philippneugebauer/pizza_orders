# README

## App Requirements

- Ruby/Rails
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

## Test Execution:

System tests require `Chrome`. Tests aren't supported within Docker environment.

```
rails test
rails system:test
```
