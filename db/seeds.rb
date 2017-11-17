# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
20.times do
	User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name, 
		email: Faker::Internet.unique.email,
		tel: Faker::PhoneNumber.cell_phone,
		country: Faker::Address.country,
		district: Faker::Address.city,
		role: "student",
		password: "password",
		user_profile: "http://res.cloudinary.com/nexpals/image/upload/v1510933584/default-user_uzaoin.png"
	)
end

3.times do
	Subject.create(
		title: "Computer Programing",
		description: "Learn how to program drawings, animations, and games using JavaScript & ProcessingJS, or learn how to create webpages with HTML & CSS. You can share whatever you create, explore what others have created and learn from each other!",
		image: "http://www.esolution24.com/wp-content/uploads/2017/05/computer.jpg"
	)
end

1.times do
	Course.create(
		title: "Ruby on Rails",
		subject_id: 1,
		about: "We will learn web develpment with Ruby and Rails framework",
		instructor_id: 2,
		image: "https://www.atulhost.com/wp-content/uploads/2016/02/ruby-on-rails.jpg",
	)
end