# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Administrator.destroy_all
User.destroy_all

Administrator.create(
  email: "admin@example.com",
  password: "Password123"
)

User.create(
  email: "user@example.com",
  password: "Password123"
)
