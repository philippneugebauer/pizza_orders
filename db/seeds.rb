# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

begin
  ActiveRecord::Base.transaction do
    small_pizza = PizzaSize.create! name: "Small", multiplier: 0.7
    PizzaSize.create! name: "Medium", multiplier: 1
    PizzaSize.create! name: "Large", multiplier: 1.3

    Pizza.create! name: "Margherita", price: 5
    salami_pizza = Pizza.create! name: "Salami", price: 6
    Pizza.create! name: "Tonno", price: 8

    Ingredient.create! name: "Onions", price: 1
    Ingredient.create! name: "Cheese", price: 2
    Ingredient.create! name: "Olives", price: 2.5

    Promotion.create! code: "2FOR1", pizza_id: salami_pizza.id, pizza_size_id: small_pizza.id, from: 2, to: 1

    Discount.create! code: "SAVE5", percentage: 5
  end
rescue ActiveRecord::RecordInvalid
  puts "Records already exist. Turn off RAILS_SEED"
end
