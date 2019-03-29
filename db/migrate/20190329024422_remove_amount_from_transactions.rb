class RemoveAmountFromTransactions < ActiveRecord::Migration[5.2]
  def up
  	remove_column :transactions, :amount
  end

  def down
  	add_column :transactions, :amount, :decimal, precision: 8, scale: 2
  end
end
