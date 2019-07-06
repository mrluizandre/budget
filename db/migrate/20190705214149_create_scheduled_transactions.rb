class CreateScheduledTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_transactions do |t|
      t.date :date
      t.belongs_to :account, foreign_key: true
      t.belongs_to :payee, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.decimal :inflow, precision: 8, scale: 2
      t.decimal :outflow, precision: 8, scale: 2

      t.timestamps
    end
  end
end
