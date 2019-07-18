class RemoveTransferFieldsFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :transfer_account_id, :string
    remove_column :transactions, :transfer_transaction_id, :string
  end
end
