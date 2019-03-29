class Account < ApplicationRecord
	enum account_type: {checking: 0, credit_card: 1}

	def change_balance(val)
		self.balance += val
		save
	end
end
