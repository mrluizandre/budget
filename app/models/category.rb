class Category < ApplicationRecord
	belongs_to :linked_credit_card_account, class_name: 'Account', optional: true
	belongs_to :group
	has_many :scheduled_transactions
	has_many :transactions
	has_many :stats

	validates_uniqueness_of :to_be_budgeted, if: :to_be_budgeted
	
	def change_balance(val)
		self.balance += val
		save!
	end

	def change_activity(val)
		self.activity += val
		save!
	end

	def self.budget(amount, to, from=Category.where(to_be_budgeted: true).first)
		ActiveRecord::Base.transaction do
		  from.update!(balance: from.balance - amount, budgeted: from.budgeted - amount)
		  to.update!(balance: to.balance + amount, budgeted: to.budgeted + amount)
		  CategoryTransaction.create!(from: from, to: to, amount: amount)
		end
	end

	def create_month_stat(year:, month:, budgeted: 0, activity: 0, balance: 0)
  	self.stats.create!(
  			year: year,
  			month: month,
  			budgeted: budgeted,
  			activity: activity,
  			balance: balance
  		)
  end
end
