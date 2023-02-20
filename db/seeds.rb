# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

User.destroy_all
# Event.destroy_all
# Attendance.destroy_all
# ActiveRecord::Base.connection.reset_pk_sequence!('events')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
# ActiveRecord::Base.connection.reset_pk_sequence!('attendances')

utilisateur = []
10.times do |i|
  utilisateur << User.create(first_name: Faker::Name.unique.first_name,last_name: Faker::Name.unique.last_name, description: Faker::Lorem.sentence(word_count: 4),email: Faker::Internet.email(domain: 'yopmail.com'))
end
puts utilisateur