# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Character.create(name: Faker::Name.name, bio: "Cool as a cucumber.", show_id: rand(1..10), actor_id: rand(1..10))
Character.create(name: Faker::Name.name, bio: "Dope on a rope.", show_id: rand(1..10), actor_id: rand(1..10))
Character.create(name: Faker::Name.name, bio: "Brilliant and sophisticated.", show_id: rand(1..10), actor_id: rand(1..10))
Character.create(name: Faker::Name.name, bio: "Don't allow near your loved ones!", show_id: rand(1..10), actor_id: rand(1..10))
Character.create(name: Faker::Name.name, bio: "Coding master.", show_id: rand(1..10), actor_id: rand(1..10))
Character.create(name: Faker::Name.name, bio: "Chillin like a villian.", show_id: rand(1..10), actor_id: rand(1..10))