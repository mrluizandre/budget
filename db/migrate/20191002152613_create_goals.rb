class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.belongs_to :category, foreign_key: true
      t.integer :goal_type
      t.decimal :amount, precision: 14, scale: 2
      t.date :date
      t.decimal :percentage, precision: 5, scale: 2

      t.timestamps
    end
  end
end
