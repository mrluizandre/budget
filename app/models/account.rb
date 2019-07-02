class Account < ApplicationRecord
	has_many :transactions
	has_one :category, :class_name => "Category", :foreign_key => "linked_credit_card_account_id", dependent: :destroy
	enum account_type: {checking: 0, credit_card: 1}

	before_create :create_category_if_credit_card

	def change_balance(val)
		self.balance += val
		save
	end

	private
		def create_category_if_credit_card
			if self.credit_card?
				self.build_category(name: self.name)
			end
		end
end
