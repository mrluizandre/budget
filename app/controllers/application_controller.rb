class ApplicationController < ActionController::Base
	before_action :check_if_budget_set
	before_action :current_month
	before_action :set_to_be_budgeted


	helper_method :current_budget

	def current_budget
		Budget.find(session[:budget_id])
	end

	def current_month
		@current_month = Month.find_by_month(Date.today.at_beginning_of_month)
	end

	def set_to_be_budgeted
		# @to_be_budgeted = Category.find_by(to_be_budgeted: true)
		@to_be_budgeted = current_budget.categories.find_by(to_be_budgeted: true)
	end

	private
    def check_if_budget_set
			# return if not user_signed_in?
			redirect_to budgets_path, notice: 'Select the budget' and return if not session[:budget_id].present?
		end
end
