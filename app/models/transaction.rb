class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :payee
  belongs_to :category
  belongs_to :transfer_account, class_name: 'Account', optional: true
  belongs_to :transfer_transaction, class_name: 'Transaction', optional: true

  before_save :change_category_balance_and_activity

  before_destroy :undo_changes

  private
	  def change_category_balance_and_activity
	  	return if self.transfer_account.present?
	  	self.category.decrease_balance self.amount
	  	self.category.decrease_activity self.amount
      self.account.decrease_balance self.amount
	  end

    def undo_changes
      self.category.increase_balance self.amount
      self.category.increase_activity self.amount
      self.account.increase_balance self.amount
    end
end
