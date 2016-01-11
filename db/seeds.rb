# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

csv_text = File.read(Rails.root.join("lib", "seeds", "bands.csv"))
csv = CSV.parse(csv_text, headers: true)

puts "There were #{Band.count} bands to begin with"

csv.each do |row|
  t = Band.new
  t.name = row["name"]
  t.biography = row["biography"]
  t.official_link = row["official_link"]
  t.wiki_link = row["wiki_link"]
  t.save
end

puts "Now there are #{Band.count} bands"

csv_text = File.read(Rails.root.join("lib", "seeds", "releases.csv"))
csv = CSV.parse(csv_text, headers: true)

puts "There were #{Release.count} releases to begin with"

csv.each do |row|
  t = Release.new
  t.title = row["title"]
  t.track_list = row["tracks"]
  t.year_released = row["year"]
  t.record_label = row["label"]
  t.record_label_url = "http://#{row['label_link']}"
  t.catalog_number = row["catalog_no"]
  t.release_type = row["media"]
  t.release_length = row["release_type"]
  t.save
end

puts "Now there are #{Release.count} releases"

# then link releases to bands in console using:
# release.bands << Band.find(id: 2)
