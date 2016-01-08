# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'bands.csv'))
csv = CSV.parse(csv_text, :headers => true)

puts "There were #{Band.count} bands to begin with"

csv.each do |row|
  t = Band.new
  t.name = row['name']
  t.biography = row['biography']
  t.official_link = row['official_link']
  t.wiki_link = row['wiki_link']
  t.band_photo = row['band_photo']
  t.save
end

puts "Now there are #{Band.count} bands"
