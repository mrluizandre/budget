json.extract! transaction, :id, :date, :amount, :account_id, :payee_id, :category_id, :transfer_account_id_id, :transfer_transaction_id_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
