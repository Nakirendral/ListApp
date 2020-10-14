class AddDataToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :list, foreign_key: true
    add_column :entries, :score, :integer
  end
end
