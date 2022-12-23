class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :pages
      t.date :date_of_publication
      t.text :summary
      t.string :rent
      t.timestamps
    end
  end
end
