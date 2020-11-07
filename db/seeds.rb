require 'open-uri'
require 'faker'

Booking.destroy_all
Board.destroy_all
User.destroy_all

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
        address: Faker::Address.street_name,
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
