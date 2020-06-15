Location.destroy_all
User.destroy_all

interests = [
  '3D printing',
  'Amateur radio',
  'Scrapbook',
  'Amateur radio',
  'Acting'
]
location_type = ["restaurant", "park", "movie theater", "museum", "roof top", "club", "pub", "church"]

10.times do 
  Location.create(location_type: location_type.sample, city: Faker::Address.city, address: Faker::Address.street_address)
end

interests.each do |interest| 
  Interest.create(name: interest)
end

book_restoration = Interest.create(name: 'Book restoration')
cabaret = Interest.create(name: 'Cabaret')
calligraphy = Interest.create(name: 'Calligraphy')
candle_making = Interest.create(name: 'Candle making')
baton_twirling = Interest.create(name: 'Baton twirling')
board_games = Interest.create(name: 'Board games')

marlon = User.create(username: "mrb", first_name: "Marlon", last_name: "Braga", age: "30", bio: "I'm from Brazil.", password: "1234")
senada = User.create(username: "sk", first_name: "Senada", last_name: "kadric", age: "23", bio: "I'm from Bosnia.", password: "1234")
marcos = User.create(username: "mark", first_name: "Marcos", last_name: "Perobelli", age: "58", bio: "Ciao! Io sono Italiano. Voglio fare piu amici qui.", password: "1234")

# Marlon has 2 interests in common with Senada and Marcos has only 1 common interest with Senada

marlon.interests << cabaret
marlon.interests << calligraphy
marlon.interests << book_restoration

senada.interests << cabaret
senada.interests << calligraphy
senada.interests << candle_making

marcos.interests << candle_making
marcos.interests << board_games
marcos.interests << baton_twirling

puts "======="
puts "SEEDED"
puts "======="