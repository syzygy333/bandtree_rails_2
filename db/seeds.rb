# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bands = [
  ['Pixies','','http://www.pixiesmusic.com','',nil],
  ['Tortoise','','http://www.trts.com','',nil],
  ['They Might Be Giants','','http://www.theymightbegiants.com','http://tmbw.net/wiki/Main_Page',nil],
  ['A Grape Dope','','','',nil],
  ['Jim O\'Rourke','','','',nil],
  ['Red Krayola','','','',nil],
  ['Bedhead','','','',nil],
  ['Collections of Colonies of Bees','','http://www.collectionsofcoloniesofbees.net','',nil],
  ['Russian Circles','','http://www.russiancircles.com','',nil],
  ['Spinanes','','','',nil],
  ['Don Caballero','','','',nil],
  ['Uptighty','','','',nil],
  ['Paul Duncan','','http://home-tapes.com/Hometapes/Paul_Duncan.html','',nil],
  ['Archer Prewitt','','','',nil],
  ['Sam Prekop','','','',nil]
]

bands.each do |name, biography, official_link, wiki_link, band_photo|
  Band.create(name: name, biography: biography, official_link: official_link, wiki_link: wiki_link, band_photo: band_photo)
end
