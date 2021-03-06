# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(email: 'redlilith@andex.ru', password: 'hermina', password_confirmation: 'hermina')

Course.destroy_all

10.times do
  Course.create!([{
    title: Faker::Educator.subject,
    description: Faker::Lorem.paragraphs(number: 1),
    short_description: Faker::Lorem.paragraph(sentence_count: 1),
    language: ["English", "German", "Italian", "French", "Spanish", "Russian"].sample,
    level: ["Beginner", "Intermediate", "Advanced"].sample,
    price: rand(1..30),
    user_id: User.first.id
  }])
end

puts "Success!"