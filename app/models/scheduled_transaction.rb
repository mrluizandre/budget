class ScheduledTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :payee
  belongs_to :category

  validate :inflow_xor_outflow


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

  def self.create_by_installments(n_installments:, starting_n_installment: 1, first_installment_date:, account_id:, payee_id:, category_id:, inflow:, outflow:, note:)
    n_installments = n_installments.to_i
    starting_n_installment =  starting_n_installment.to_i
    first_installment_date = Date.parse(first_installment_date)
    account_id = account_id.to_i
    payee_id = payee_id.to_i
    category_id = category_id.to_i
    
    #set first installment payment date
    installment_payment_date = first_installment_date
    
    unless inflow.blank?
      inflow = inflow.to_d
      inflow_not_floored = inflow / n_installments 
      inflow_floored = inflow_not_floored.floor(2)
      inflow_floor_difference = inflow_not_floored - inflow_floored
      inflow_additon_first_installment = inflow_floor_difference * n_installments
      inflow = inflow_floored
    end
    
    unless outflow.blank?
      outflow = outflow.to_d
      outflow_not_floored = outflow / n_installments 
      outflow_floored = outflow_not_floored.floor(2)
      outflow_floor_difference = outflow_not_floored - outflow_floored
      outflow_additon_first_installment = outflow_floor_difference * n_installments
      outflow = outflow_floored
    end
    
    link_identifier = SecureRandom.uuid
    (starting_n_installment..n_installments).to_a.each_with_index do |i,n|
      puts i.to_s.yellow
      puts inflow.to_s.green
      puts inflow_additon_first_installment.to_s.blue
      puts outflow.to_s.red
      puts outflow_additon_first_installment.to_s.blue
      self.create!(
        link_identifier: link_identifier,
        date: installment_payment_date,
        account_id: account_id,
        payee_id: payee_id,
        category_id: category_id,
        inflow: (i == 1 and !inflow.blank?) ? inflow + inflow_additon_first_installment : inflow,
        outflow: (i == 1 and !outflow.blank?) ?  outflow + outflow_additon_first_installment : outflow,
        note: (note + " #{i}/#{n_installments}").strip
      )
      installment_payment_date = installment_payment_date + 1.month
    end
  end

  private
    def inflow_xor_outflow
      unless inflow.blank? ^ outflow.blank?
        errors.add(:base, "Specify an inflow or an outflow, not both or none")
      end
    end
end
