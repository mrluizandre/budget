class Transfer < ApplicationRecord
	belongs_to :account_from, class_name: 'Account'
	belongs_to :account_to, class_name: 'Account'

	before_create :change_accounts_balance
	before_destroy :undo_changes

	private
		def change_accounts_balance
      self.account_from.change_balance -self.amount
      self.account_to.change_balance self.amount
	  end

    def undo_changes
      self.account_from.change_balance self.amount
      self.account_to.change_balance -self.amount
    end
end
