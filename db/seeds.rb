Location.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location_type = ["restaurant", "park", "movie theater", "museum", "roof top", "club", "pub", "church"]
10.times do 
  Location.create(location_type: location_type.sample, city: Faker::Address.city, address: Faker::Address.street_address)
end

marlon = User.create(username: "mrb", first_name: "Marlon", last_name: "Braga", age: "30", bio: "I'm from Brazil.")
senada = User.create(username: "sk", first_name: "Senada", last_name: "kadric", age: "23", bio: "I'm from Bosnia.")
# hangout_1 = Hangout.create(nickname: "A walk in the park", activity: "Go for a walk", location_id: 18)
# date_1 = UserHangout.create(user_id: 1, hangout_id: 1, accepted: false)
# date_2 = UserHangout.create(user_id: 2, hangout_id: 1, accepted: false)

puts "======="
puts "SEEDED"
puts "======="