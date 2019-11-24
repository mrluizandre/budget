module ApplicationHelper
	def value_color(amount)
		if amount > 0
			'text-success'
		elsif amount < 0
			'text-danger'
		end
	end
	
	def badge_color_category(cat)
		current_month_scheduled_amount = cat.scheduled_transactions.where(date: Time.now.beginning_of_month..Time.now.end_of_month, done: false).inject(0.0){|sum,st| sum + (-st.amount)}
		goal_amount = cat.goals.inject(0.0){|sum,st| sum + st.month_amount}

		bigger = current_month_scheduled_amount > goal_amount ? current_month_scheduled_amount : goal_amount

		if cat.balance < bigger
			"badge-warning"
		elsif cat.balance > 0
			'badge-success'
		elsif cat.balance == 0
			'badge-secondary'
		elsif cat.balance < 0
			'badge-danger'
		end
	end

	def badge_color_account(amount)
		if amount < 0
			'badge-danger-account'
		end
	end

	def badge_color(amount)
		if amount > 0
			'badge-success'
		elsif amount == 0
			'badge-secondary'
		elsif amount < 0
			'badge-danger'
		end
	end

	def to_be_budgeted_color(amount)
		if amount > 0
			'success'
		elsif amount == 0
			'secondary'
		elsif amount < 0
			'danger'
		end
	end

	def navbar_active(controller)
		controller == controller_name ? 'active' : ''
	end
end