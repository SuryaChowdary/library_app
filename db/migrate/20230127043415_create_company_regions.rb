class CreateCompanyRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :company_regions do |t|
      t.integer :company_id
      t.integer :region_id
      t.timestamps
    end
  end
end
