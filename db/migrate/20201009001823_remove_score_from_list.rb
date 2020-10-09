class RemoveScoreFromList < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :score, :integer
  end
end
