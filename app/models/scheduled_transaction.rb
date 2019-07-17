class ScheduledTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :payee
  belongs_to :category

  def amount
    if self.inflow.present?
      return self.inflow
      elsif self.outflow.present?
      return -self.outflow
    end
  end

  def create_transaction(due_date: self.date)
    ActiveRecord::Base.transaction do
      Transaction.create!(
          date: due_date,
          account: self.account,
          payee: self.payee,
          category: self.category,
          inflow: self.inflow,
          outflow: self.outflow,
          note: self.note
          )
      self.update!(done: true)
    end
  end
  
  def self.create_today_transactions
  	ScheduledTransaction.where(date: Date.today, done: false).each do |scheduled_transaction|
  		scheduled_transaction.create_transaction
  	end  	
  end
end
