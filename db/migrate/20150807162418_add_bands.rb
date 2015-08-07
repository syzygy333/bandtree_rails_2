class AddBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.text :biography
      t.string :official_link
      t.string :wiki_link
      t.boolean :private?, default: false
    end
  end
end
