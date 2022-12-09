class CreateStaff < ActiveRecord::Migration[6.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.integer :phonenumber
      t.string :gender
      t.integer    :age
      t.date   :date_of_birth
      t.text   :address
      t.timestamps
    end
  end
end
