class AddUserIdAndScoreToLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :lists, :user, foreign_key: true
    add_column :lists, :score, :integer
  end
end
