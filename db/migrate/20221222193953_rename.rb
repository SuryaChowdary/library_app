class Rename < ActiveRecord::Migration[6.1]
  def change
    rename_table :libraries , :books
    rename_table :bookrooms , :companies
    rename_table :bookroom_locations , :company_locations
  end
end
