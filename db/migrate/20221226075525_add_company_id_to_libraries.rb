class AddCompanyIdToLibraries < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries, :company_id, :int
  end
end
