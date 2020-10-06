class AddIdToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :listid, :integer
  end
end
