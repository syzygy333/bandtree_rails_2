class AddArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :stage_name
      t.boolean :stage_name_preferred?
      t.date :birth_date
      t.date :death_date
      t.text :biography
      t.string :official_link
      t.string :wiki_link
      t.string :portrait
    end
  end
end
