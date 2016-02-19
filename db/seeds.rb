require "csv"

# csv_text = File.read(Rails.root.join("lib", "seeds", "bands.csv"))
# csv = CSV.parse(csv_text, headers: true)
#
# puts "There were #{Band.count} bands to begin with"
#
# csv.each do |row|
#   t = Band.new
#   t.name = row["name"]
#   t.biography = row["biography"]
#   t.official_link = row["official_link"]
#   t.wiki_link = row["wiki_link"]
#   t.save
# end
#
# puts "Now there are #{Band.count} bands"
#
# csv_text = File.read(Rails.root.join("lib", "seeds", "releases.csv"))
# csv = CSV.parse(csv_text, headers: true)
#
# puts "There were #{Release.count} releases to begin with"
#
# csv.each do |row|
#   t = Release.new
#   t.title = row["title"]
#   t.track_list = row["tracks"]
#   t.year_released = row["year"]
#   t.record_label = row["label"]
#   t.record_label_url = "http://#{row['label_link']}"
#   t.catalog_number = row["catalog_no"]
#   t.release_type = row["media"]
#   t.release_length = row["release_type"]
#   t.save
# end
#
# puts "Now there are #{Release.count} releases"

# csv_text = File.read(Rails.root.join("lib", "seeds", "albumsartists.csv"))
# csv = CSV.parse(csv_text, headers: true)
#
# puts "There were #{Artist.count} artists to begin with"
#
# csv.each do |row|
#   t = Artist.new
#   split_name = row["artist"].to_s.split(" ")
#   if split_name.count == 2
#     if Artist.where(first_name: "#{split_name.first}", last_name: "#{split_name.last}")[0] != nil
#     else
#       t.first_name = split_name.first
#       t.last_name = split_name.last
#     end
#   end
#   t.save
# end
#
# puts "There are now #{Artist.count} artists"

csv_text = File.read(Rails.root.join("lib", "seeds", "albumsartists.csv"))
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  album = row["album"].to_s
  artist = row["artist"].to_s.split(" ")
  if Release.where(title: album)[0] != nil && artist.count == 2
    release = Release.where(title: album)[0]
    artist = Artist.where(first_name: artist[0], last_name: artist[1])[0]
    release.artists << artist
  end
end
