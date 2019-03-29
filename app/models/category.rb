class Category < ApplicationRecord
	def change_balance(val)
		self.balance += val
		save
	end

	def change_activity(val)
		self.activity += val
		save
	end
end
