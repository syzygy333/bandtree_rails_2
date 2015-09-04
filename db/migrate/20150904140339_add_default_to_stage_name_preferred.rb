class AddDefaultToStageNamePreferred < ActiveRecord::Migration
  def up
    change_column :artists, :stage_name_preferred?, :boolean, default: false
  end

  def down
    change_column :artists, :stage_name_preferred?, :boolean
  end
end
