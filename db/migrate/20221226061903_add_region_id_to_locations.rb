class AddRegionIdToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :region_id, :int
  end
end
