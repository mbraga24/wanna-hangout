Location.destroy_all
User.destroy_all
Interest.destroy_all
Hangout.destroy_all
UserHangout.destroy_all

all_interests = [
  'Computer programming',
  'Coffee roasting',
  'Cooking',
  'Colouring',
  'Cosplaying',
  'Couponing',
  'Creative writing',
  'Crocheting',
  'Cryptography',
  'Dance',
  'Digital arts',
  'Drama',
  'Drawing',
  'Do it yourself',
  'Electronics',
  'Embroidery',
  'Fashion',
  'Flower arranging',
  'Foreign language learning',
  'Gaming',
  'Tabletop games',
  'Role-playing games',
  'Gambling',
  'Genealogy',
  'Glassblowing',
  'Gunsmithing',
  'Homebrewing',
  'Ice skating',
  'Jewelry making',
  'Jigsaw puzzles',
  'Juggling',
  'Knapping',
  'Knitting',
  'Kabaddi',
  'Knife making',
  'Lacemaking',
  'Lapidary',
  'Leather crafting',
  'Lego building',
  'Lockpicking',
  'Machining',
  'Macrame',
  'Metalworking',
  'Magic',
  'Model building',
  'Listening to music',
  'Origami',
  'Painting',
  'Playing musical instruments',
  'Pet',
  'Poi',
  'Pottery',
  'Puzzles',
  'Quilting',
  'Reading',
  'Scrapbooking',
  'Sculpting',
  'Sewing',
  'Singing',
  'Sketching',
  'Soapmaking',
  'Sports',
  'Stand-up comedy',
  'Sudoku',
  'Table tennis',
  'Taxidermy',
  'Video gaming',
  'Watching movies',
  'Web surfing',
  'Whittling',
  'Wood carving',
  'Woodworking',
  'World Building',
  'Writing',
  'Yoga',
  'Yo-yoing',
  'Air sports',
  'Archery',
  'Astronomy',
  'Backpacking'
];

all_interests.each do |interest| 
  Interest.create(name: interest)
end

# ========================================================================================
# ==                                                                                    ==
# ==                     SEEDING DATA FOR CONSOLE AND UI TESTING                        ==
# ==                                                                                    ==
# ========================================================================================


# ****************************************
#             SEEDING LOCATION
# ****************************************

new_york = Location.create(city: "New York")
boston = Location.create(city: "Boston")
la = Location.create(city: "LA")
washington = Location.create(city: "Washinton DC")
miami = Location.create(city: "Miami")
dallas = Location.create(city: "Dallas")

# ****************************************
#           SEEDING INTEREST
# ****************************************

book_restoration = Interest.create(name: 'Book restoration')
cabaret = Interest.create(name: 'Cabaret')
calligraphy = Interest.create(name: 'Calligraphy')
candle_making = Interest.create(name: 'Candle making')
baton_twirling = Interest.create(name: 'Baton twirling')
board_games = Interest.create(name: 'Board games')
threed_printing = Interest.create(name: '3D printing')
amateur_radio = Interest.create(name: 'Amateur radio')
scrapbook = Interest.create(name: 'Scrapbook')
acting = Interest.create(name: 'Acting')

# ****************************************
#             SEEDING USER
# ****************************************

senada = User.create(username: "sk", first_name: "Senada", last_name: "kadric", location_id: new_york.id,age: "23", bio: "I'm from Bosnia.", password: "1234")
isabel = User.create(username: "bella", first_name: "Isabel", last_name: "Dantes", location_id: boston.id, age: "23", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")
michelle = User.create(username: "chell", first_name: "Michelle", last_name: "Pontes", location_id: la.id, age: "58", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")

marlon = User.create(username: "mrb", first_name: "Marlon", last_name: "Braga", location_id: new_york.id, age: "30", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")
marcos = User.create(username: "mark", first_name: "Marcos", last_name: "Perobelli", location_id: new_york.id, age: "58", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")
rey = User.create(username: "reyrey", first_name: "Rey", last_name: "Tompson", location_id: new_york.id, age: "39", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")
jack = User.create(username: "jack123", first_name: "Jack", last_name: "Maltez", location_id: la.id, age: "21", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")
# bob = User.create(username: "bob123", first_name: "Bob", last_name: "Maltez", location_id: la.id, age: "20", bio: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit, recusandae.", password: "1234")

# ****************************************
#           CHECKING MATCHES
# ****************************************

# MARLON FROM NEW YORK
marlon.interests << cabaret
marlon.interests << calligraphy
marlon.interests << book_restoration

# SENADA FROM NEW YORK 
senada.interests << cabaret
senada.interests << calligraphy
senada.interests << candle_making

# ISABEL FROM BOSTON
isabel.interests << cabaret
isabel.interests << book_restoration
isabel.interests << acting

# REY FROM NEW YORK
rey.interests << cabaret
rey.interests << candle_making
rey.interests << threed_printing

# JACK FROM LA
jack.interests << candle_making
jack.interests << calligraphy
jack.interests << amateur_radio

# MARCOS FROM NEW YORK
marcos.interests << scrapbook
marcos.interests << board_games
marcos.interests << baton_twirling

# MICHELLE FROM LA
michelle.interests << candle_making
michelle.interests << amateur_radio
michelle.interests << calligraphy

puts "****************************************"
puts "               SEEDED"
puts "****************************************"