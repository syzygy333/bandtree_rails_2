class AddRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :artist, null: false
      t.integer :release, null: false
      t.string :contribution
    end
  end
end
