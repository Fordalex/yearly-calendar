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


birthday = EventType.create(
  name: "Birthday",
  colour: "#f00"
)

holiday = EventType.create(
  name: "Holiday",
  colour: "#0f0"
)

Event.create(
  date:  Date.new(2022, 01, 27),
  start_time: DateTime.now,
  finish_time: DateTime.now + 8.hours,
  event_type: birthday
)

Event.create(
  date:  Date.new(2022, 07, 9),
  title: "My Birthday",
  start_time: DateTime.now,
  finish_time: DateTime.now + 8.hours,
  event_type: birthday
)

Event.create(
  date:  Date.new(2022, 05, 20),
  start_time: DateTime.now,
  finish_time: DateTime.now + 8.hours,
  event_type: holiday
)
