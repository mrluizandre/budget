class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :payee
  belongs_to :category
  belongs_to :transfer_account, class_name: 'Account', optional: true
  belongs_to :transfer_transaction, class_name: 'Transaction', optional: true

  before_save :change_category_balance_and_activity
  before_destroy :undo_changes

  validate :inflow_xor_outflow

  def amount
    if self.inflow.present?
      return self.inflow
    elsif self.outflow.present?
      return -self.outflow
    end
  end

  private
    def inflow_xor_outflow
      unless inflow.blank? ^ outflow.blank?
        errors.add(:base, "Specify an inflow or an outflow, not both")
      end
    end

	  def change_category_balance_and_activity
	  	return if self.transfer_account.present?
	  	self.category.change_balance self.amount
	  	self.category.change_activity self.amount
      self.account.change_balance self.amount
	  end

    def undo_changes
      self.category.change_balance -self.amount
      self.category.change_activity -self.amount
      self.account.change_balance -self.amount
    end
end
