class AddNoteToScheduledTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_transactions, :note, :string
  end
end
