class AddNoteToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :note, :text
  end
end
