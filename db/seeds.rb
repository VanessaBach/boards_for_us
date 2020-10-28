# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user1 = User.create(email:"bernardo@gmail.com", name:"Bernardo", age:26, password:123456)
user2 = User.create(email:"maria@gmail.com", name:"Maria", age:25, password:123456)

sup = Board.create(style: "SUP", size: "Medium", year: 2015, price_per_day: 20, user: user2)
long = Board.create(style: "Long", size: "Small", year: 2016, price_per_day: 10, user:user2)
pranchinha = Board.create(style: "Pranchinha", size: "Large", year: 2013, price_per_day: 10, user:user2)
sup2 = Board.create(style: "SUP", size: "Small", year: 2012, price_per_day: 15, user:user2)
long2 = Board.create(style: "Long", size: "Large", year: 2020, price_per_day: 30,user:user2)

boards = [sup,long,pranchinha,sup2,long2]

5.times do
  Booking.create(begin_date: Faker::Date.between(from: "2020-11-01",to: "2020-11-05"), end_date: Faker::Date.between(from: "2020-11-06",to: "2020-11-15"),user: user1, board:boards.sample())
end


