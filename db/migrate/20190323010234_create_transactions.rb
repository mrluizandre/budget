class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :amount, precision: 8, scale: 2
      t.references :account, foreign_key: true
      t.references :payee, foreign_key: true
      t.references :category, foreign_key: true
      t.references :transfer_account, foreign_key: {to_table: :accounts}
      t.references :transfer_transaction, foreign_key: {to_table: :transactions}

      t.timestamps
    end
  end
end
