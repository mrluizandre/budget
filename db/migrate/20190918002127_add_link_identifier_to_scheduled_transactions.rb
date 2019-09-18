class AddLinkIdentifierToScheduledTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_transactions, :link_identifier, :string
  end
end
