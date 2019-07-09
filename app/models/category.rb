class Category < ApplicationRecord
	belongs_to :linked_credit_card_account, class_name: 'Account', optional: true
	validates_uniqueness_of :to_be_budgeted, if: :to_be_budgeted
	has_many :scheduled_transactions

	def change_balance(val)
		self.balance += val
		save
	end

	def change_activity(val)
		self.activity += val
		save
	end

	def self.budget(amount, to, from=Category.where(to_be_budgeted: true).first)
		ActiveRecord::Base.transaction do
		  from.update!(balance: from.balance - amount, budgeted: from.budgeted - amount)
		  to.update!(balance: to.balance + amount, budgeted: to.budgeted + amount)
		  CategoryTransaction.create!(from: from, to: to, amount: amount)
		end
	end
end
