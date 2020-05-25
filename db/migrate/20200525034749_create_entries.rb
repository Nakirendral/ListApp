class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.text :entry_name
      t.integer :list_id
      t.integer :votes

      t.timestamps
    end
  end
end
