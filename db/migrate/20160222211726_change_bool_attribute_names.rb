class ChangeBoolAttributeNames < ActiveRecord::Migration
  def change
    rename_column :artists, :stage_name_preferred?, :stage_name_preferred
    rename_column :artists, :private?, :private
  end
end
