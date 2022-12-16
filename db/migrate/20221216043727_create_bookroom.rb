class CreateBookroom < ActiveRecord::Migration[6.1]
  def change
    create_table :bookrooms do |t|
      t.string :name
      t.timestamps
    end
  end
end
