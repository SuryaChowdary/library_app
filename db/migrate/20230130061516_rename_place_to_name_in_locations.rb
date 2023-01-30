class RenamePlaceToNameInLocations < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :place, :name
  end
end
