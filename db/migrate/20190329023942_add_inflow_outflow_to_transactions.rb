class AddInflowOutflowToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :inflow, :decimal, precision: 8, scale: 2
    add_column :transactions, :outflow, :decimal, precision: 8, scale: 2
  end
end
