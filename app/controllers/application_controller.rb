class ApplicationController < ActionController::Base
	before_action :current_month
	before_action :set_to_be_budgeted

	def current_month
		@current_month = Month.find_by_month(Date.today.at_beginning_of_month)
	end

	def set_to_be_budgeted
		@to_be_budgeted = Category.find_by(to_be_budgeted: true)
	end
end
