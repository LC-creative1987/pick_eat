# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Destroying..."
OrderItem.destroy_all
User.destroy_all

puts "Creating users..."
5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: 'Dubai',
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    password: "123456"
  )
end


puts "Creating restaurants..."
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: 'Dubai',
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    cuisine: ["Lebanese", "Indian", "Italian", "Thai", "Chinese", "French"].sample,
    user: User.all.sample
  )

  rand(10..20).times do
    Ingredient.create!(
      name: Faker::Food.ingredient,
      unit: ["gram", "tablespoon", "teaspoon", "slice"].sample,
      change_increment: ["1", "10", "25", "50", "100"].sample,
      cost: rand(1..50),
      price: rand(1..60),
      restaurant: restaurant
    )
  end

  rand(5..15).times do
    dish = Dish.create!(
      name: Faker::Food.dish,
      base_price: rand(1..10),
      restaurant: restaurant
    )

    rand(5..15).times do
      DishIngredient.create!(
        base_quantity: rand(5..200),
        min_quantity: rand(0..6),
        max_quantity: rand(10..300),
        dish: dish,
        ingredient: Ingredient.all.sample
      )
    end
  end
end













