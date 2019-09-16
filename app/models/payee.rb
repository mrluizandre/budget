class Payee < ApplicationRecord
	has_many :transactions
	has_many :scheduled_transactions
	belongs_to :budget

	validates_uniqueness_of :name
end
