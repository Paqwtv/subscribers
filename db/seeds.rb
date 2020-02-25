# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  Program.create(title: FFaker::Book.title, description: FFaker::Book.description)
  User.create(name: FFaker::NameCN.name, email: FFaker::Internet.email, password: SecureRandom.uuid)
end

p Program.count

50.times do
  Subscribe.create(user_id: User.find(rand(1..100)).id,
                   program_id: Program.find(rand(1..100)).id)
end

5.times do
  Subscribe.find(rand(1..50)).update(banned: true)
end
