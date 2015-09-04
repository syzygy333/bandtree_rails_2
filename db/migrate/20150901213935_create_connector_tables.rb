class CreateConnectorTables < ActiveRecord::Migration
  def change
    create_table :bands_releases, id: false do |t|
      t.belongs_to :band, index: true
      t.belongs_to :release, index: true
    end

    create_table :artists_releases, id: false do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :release, index: true
    end

    create_table :artists_bands, id: false do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :band, index: true
    end
  end
end
