class RemoveUseridFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :userid, :integer
  end
end
