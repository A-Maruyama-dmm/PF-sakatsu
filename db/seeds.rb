# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
   email: 'test@test',
   password: 'ssssss',
   name: 'サウナ管理者',
   age: 40,
   sauna_years: '7年目',
   number_of_sets: '3回',
   admin: true
)
