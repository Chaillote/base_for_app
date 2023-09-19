# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
equire "json"
require "open-uri"


5.times do

  user = User.all.sample
  cat = Cat.all.sample
  if user.id == cat.user_id
    return
  else
    random_days = rand(0..30)
    random_date = today + random_days
    reservation = Reservation.create!(user: user, cat: cat, start_date: random_date, end_date: (random_date + 3), total_price: (cat.price * 3))
    puts reservation.cat.name
  end
end

puts ‘Creating 5 fake restaurants...’
5.times do
  restaurant = Restaurant.new(
    name: Faker::Commerce.product_name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: [‘chinese’, ‘italian’, ‘japanese’, ‘french’, ‘belgian’].sample,
  )
  restaurant.save
end
