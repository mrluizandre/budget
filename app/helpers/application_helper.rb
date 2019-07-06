module ApplicationHelper
	def badge_color(amount)
		if amount > 0
			'badge-success'
		elsif amount = 0
			'badge-secondary'
		elsif amount < 0
			'badge-warning'
		end
	end
end