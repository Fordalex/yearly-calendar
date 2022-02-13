# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Administrator.destroy_all
Event.destroy_all

Administrator.create(
  email: "admin@example.com",
  password: "Password123"
)

Event.create(
  date: Date.today,
  start_time: DateTime.now,
  finish_time: DateTime.now + 8.hours
)

Event.create(
  date: Date.tomorrow,
  start_time: DateTime.now,
  finish_time: DateTime.now + 8.hours
)

Event.create(
  date: Date.today + 2.days,
  start_time: DateTime.now,
  finish_time: DateTime.now + 8.hours
)
