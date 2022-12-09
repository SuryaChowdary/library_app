class AddAuthorIdToLibraries < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries , :author_id , :int
  end
end
