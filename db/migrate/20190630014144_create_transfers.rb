class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.references :account_from, foreign_key: {to_table: :accounts}
      t.references :account_to, foreign_key: {to_table: :accounts}
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
