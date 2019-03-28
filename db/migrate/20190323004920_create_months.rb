class CreateMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.date :month
      t.decimal :income, precision: 8, scale: 2
      t.decimal :budgeted, precision: 8, scale: 2
      t.decimal :activity, precision: 8, scale: 2
      t.decimal :to_be_budgeted, precision: 8, scale: 2

      t.timestamps
    end
  end
end
