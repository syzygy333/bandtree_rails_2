class AddAlbums < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title, null: false
      t.text :track_list, null: false
      t.integer :year_released
      t.string :record_label, null: false
      t.string :record_label_url
      t.string :catalog_number
      t.string :wiki_link
      t.string :release_type
      t.string :release_length
      t.boolean :private?, default: false
    end
  end
end
