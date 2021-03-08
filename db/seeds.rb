# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Destroying all restaurants, users, dishes..."
Restaurant.destroy_all
User.destroy_all
Dish.destroy_all

puts "Creating users..."
5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    password: "123456"
  )
end


puts "Creating restaurants..."
10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    cuisine: ["Lebanese", "Indian", "Italian", "Thai", "Chinese", "French"].sample,
    user: User.all.sample
  )
end


puts "Creating dishes..."
40.times do
  Dish.create!(
    name: Faker::Food.dish,
    base_price: rand(1..10),
    restaurant: Restaurant.all.sample
  )
end












