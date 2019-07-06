json.extract! scheduled_transaction, :id, :date, :account_id, :payee_id, :category_id, :inflow, :outflow, :created_at, :updated_at
json.url scheduled_transaction_url(scheduled_transaction, format: :json)
