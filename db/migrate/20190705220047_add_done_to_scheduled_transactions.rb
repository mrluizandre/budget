class AddDoneToScheduledTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_transactions, :done, :boolean, default: false
  end
end
