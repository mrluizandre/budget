class Payee < ApplicationRecord
	has_many :transactions
	has_many :scheduled_transactions
end
