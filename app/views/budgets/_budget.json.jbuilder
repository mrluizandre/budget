json.extract! budget, :id, :user_id, :name, :last_used_at, :created_at, :updated_at
json.url budget_url(budget, format: :json)
