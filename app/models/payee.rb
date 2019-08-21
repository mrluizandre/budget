class Payee < ApplicationRecord
	has_many :transactions
	has_many :scheduled_transactions

	validates_uniqueness_of :name
end
