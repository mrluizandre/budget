class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :budgeted, precision: 8, scale: 2
      t.decimal :activity, precision: 8, scale: 2
      t.decimal :balance, precision: 8, scale: 2

      t.timestamps
    end
  end
end
