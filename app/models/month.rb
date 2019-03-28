class Month < ApplicationRecord
	def create_next
		create!(month: Date.today.next_month.at_beginning_of_month)
	end
end
