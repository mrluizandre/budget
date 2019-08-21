class ApplicationController < ActionController::Base
	before_action :current_month
	before_action :set_to_be_budgeted

	before_action :current_budget

	def current_budget
		redirect_to budgets_path, notice: 'Select the budget' if not session[:budget_id].present?

		puts "#{session[:budget_id]}".on_green
	end

	def current_month
		@current_month = Month.find_by_month(Date.today.at_beginning_of_month)
	end

	def set_to_be_budgeted
		@to_be_budgeted = Category.find_by(to_be_budgeted: true)
	end
end
