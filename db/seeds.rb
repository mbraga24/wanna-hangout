Location.destroy_all
User.destroy_all

interests = [
  '3D printing',
  'Amateur radio',
  'Scrapbook',
  'Amateur radio',
  'Acting',
  'Baton twirling',
  'Board games',
  'Book restoration',
  'Cabaret',
  'Calligraphy',
  'Candle making'
]
location_type = ["restaurant", "park", "movie theater", "museum", "roof top", "club", "pub", "church"]

10.times do 
  Location.create(location_type: location_type.sample, city: Faker::Address.city, address: Faker::Address.street_address)
end

interests.each do |interest| 
  Interest.create(name: interest)
end

marlon = User.create(username: "mrb", first_name: "Marlon", last_name: "Braga", age: "30", bio: "I'm from Brazil.", password: "1234")
senada = User.create(username: "sk", first_name: "Senada", last_name: "kadric", age: "23", bio: "I'm from Bosnia.", password: "1234")



puts "======="
puts "SEEDED"
puts "======="