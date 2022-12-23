class RenameOldColumnToNewColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :company_locations, :bookroom_id, :company_id
  end
end
