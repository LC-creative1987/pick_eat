# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "yaml"

puts "Destroying..."
OrderItem.destroy_all
User.destroy_all

file = Rails.root.join('db', 'seeds.yml')
sample = YAML.load(open(file).read)

puts 'Creating users...'
users = {}
sample["users"].each do |user|
  users[user["slug"]] = User.create! user.slice("first_name", "last_name", "email", "address", "phone_number", "password")
end

puts 'Creating restaurants...'
restaurants = {}
sample["restaurants"].each do |restaurant|
  restaurants[restaurant["slug"]] = Restaurant.create! restaurant.slice("name", "address", "phone_number", "cuisine").merge(user: users[restaurant["user_slug"]])
end

puts 'Creating dishes...'
dishes = {}
sample["dishes"].each do |dish|
  dishes[dish["slug"]] = Dish.create! dish.slice("name", "base_price").merge(restaurant: restaurants[dish["restaurant_slug"]])
end

puts 'Creating ingredients...'
ingredients = {}
sample["ingredients"].each do |ingredient|
  ingredients[ingredient["slug"]] = Ingredient.create! ingredient.slice("name", "unit", "change_increment", "cost", "price", "stock_quantity").merge(restaurant: restaurants[ingredient["restaurant_slug"]])
end

puts 'Creating dish_ingredients...'
sample["dish_ingredients"].each do |dish_ingredient|
  DishIngredient.create! dish_ingredient.slice("base_quantity", "min_quantity", "max_quantity").merge(ingredient: ingredients[dish_ingredient["ingredient_slug"]], dish: dishes[dish_ingredient["dish_slug"]])
end

puts "Finished"
