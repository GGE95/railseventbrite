# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('events')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')

utilisateur = []
10.times do |i|
  utilisateur << User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    description: Faker::Lorem.sentence(word_count: 4),
    email: Faker::Internet.email(domain: 'yopmail.com'),
    password: Faker::Internet.password
  )
end
puts utilisateur

evenement = []
5.times do |i|
  evenement << Event.create(
    start_date: Faker::Time.between(from: Time.now, to: 3.year.from_now),
    duration: rand(6..20) * 5,
    title: Faker::Lorem.characters(number: 10, min_alpha: 4),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: rand(1..1000),
    location: Faker::Address.full_address,
    administrator_id: rand(1..10)
    )
  end
  puts evenement
  
  attendance = []
  10.times do |i|
    attendance << Attendance.create(
      user_id:  rand(1..10),
      event_id: rand(1..5),
      stripe_customer_id: rand(1..10)
    )
  end
  puts attendance