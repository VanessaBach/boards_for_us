# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


def find_board(style)
	if style == 'Pranchinha'
		url = "https://www.comsurf.com.br/prancha-de-surf?prancha_nivel_surf=111"
	elsif style == 'Long'
    url = "https://comsurf.com.br/prancha-de-surf/longboard"
  end

	html_file = open(url).read
	html_doc = Nokogiri::HTML(html_file)

	photos = []
	html_doc.search('.product-image').each do |element|
	  photos << element.search('img').attribute('src').value
	end
	return photos
end

def find_sup
  url = "https://easy-surfshop.com/do/cat/sup-construction-solid"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  photos = []
  html_doc.search('.img-responsive').each do |element|
    photos << element.attribute('src').value
  end
  return photos
end

Booking.destroy_all
Board.destroy_all
User.destroy_all

c = 1
3.times do
  puts c
  file = URI.open('https://kitt.lewagon.com/placeholder/users/random')
  u = User.new(
    email: "#{c}@gmail.com",
    name: Faker::Name.name,
    password: '123456',
    age: (18..60).to_a.sample,
  )
  u.photo.attach(io: file, filename: "#{c}.jpg", content_type: 'image/jpg')
  puts c
  u.save!
  puts c

  styles = ['SUP', 'Pranchinha', 'Long']
  styles.each do |style|
    if style == 'SUP'
      photos = find_sup
    else
      photos = find_board(style)
    end

    d = 0
    3.times do
      puts d
      file = URI.open(photos[d])
  	  b = Board.new(
  	  	style: 'SUP',
  	  	size: ["Medium", "Small", "Large"].sample,
  	  	year: (2000..2020).to_a.sample,
  	  	price_per_day: (20..100).to_a.sample,
  	    user_id: User.maximum('id')
  	  )
      b.photo.attach(io: file, filename: "#{d}.jpg", content_type: 'image/jpg')
      d += 1
      b.save!
    end
  end
  c += 1
end




# user1 = User.create(email:"bernardo@gmail.com", name:"Bernardo", age:26, password:123456)
# user2 = User.create(email:"maria@gmail.com", name:"Maria", age:25, password:123456)

# sup = Board.create(style: "SUP", size: "Medium", year: 2015, price_per_day: 20, user: user2)
# long = Board.create(style: "Long", size: "Small", year: 2016, price_per_day: 10, user:user2)
# pranchinha = Board.create(style: "Pranchinha", size: "Large", year: 2013, price_per_day: 10, user:user2)
# sup2 = Board.create(style: "SUP", size: "Small", year: 2012, price_per_day: 15, user:user2)
# long2 = Board.create(style: "Long", size: "Large", year: 2020, price_per_day: 30,user:user2)

# boards = [sup,long,pranchinha,sup2,long2]

# 5.times do
#   Booking.create(begin_date: Faker::Date.between(from: "2020-11-01",to: "2020-11-05"), end_date: Faker::Date.between(from: "2020-11-06",to: "2020-11-15"),user: user1, board:boards.sample())
# end


