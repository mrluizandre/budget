class AddDefaultBalanceToAccount < ActiveRecord::Migration[5.2]
  def up
  	change_column :accounts, :balance, :decimal, precision: 8, scale: 2, default: 0
  end

  def down
  	change_column :accounts, :balance, :decimal, precision: 8, scale: 2, default: nil
  end
end
