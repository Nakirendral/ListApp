class AddContentToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :content, :text
  end
end
