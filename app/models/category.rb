class Category < ApplicationRecord
	def decrease_balance(val)
		self.balance -= val
		save
	end

	def decrease_activity(val)
		self.activity -= val
		save
	end

	def increase_balance(val)
		self.balance += val
		save
	end

	def increase_activity(val)
		self.activity += val
		save
	end
end
