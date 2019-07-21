class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.decimal :budgeted, precision: 8, scale: 2
      t.decimal :activity, precision: 8, scale: 2
      t.decimal :balance, precision: 8, scale: 2
      t.integer :month
      t.integer :year
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
