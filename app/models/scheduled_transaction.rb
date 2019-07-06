class ScheduledTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :payee
  belongs_to :category

  def self.create_today_transactions
  	ScheduledTransaction.where(date: Date.today, done: false).each do |scheduled_transaction|
  		Transaction.create(
				date: scheduled_transaction.date,
				account: scheduled_transaction.account,
				payee: scheduled_transaction.payee,
				category: scheduled_transaction.category,
				inflow: scheduled_transaction.inflow,
				outflow: scheduled_transaction.outflow,
  			)
  		scheduled_transaction.update(done: true)
  	end  	
  end
end
