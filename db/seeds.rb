# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   

puts " Starting seed "

cities = ["Paris", "London", "Amsterdam", "Brussels"]

50.times do 
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    location: cities.sample,
    password: Faker::Internet.password
    )
  user.save!
end

50.times do 
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    location: cities.sample,
    photographer: true,
    price: Faker::Commerce.price,
    password: Faker::Internet.password
    )
  user.save!
end


puts " Ended Seed "