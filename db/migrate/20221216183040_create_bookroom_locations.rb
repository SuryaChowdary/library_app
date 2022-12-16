class CreateBookroomLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :bookroom_locations do |t|
      t.integer :bookroom_id
      t.integer :location_id
      t.timestamps
    end
  end
end
