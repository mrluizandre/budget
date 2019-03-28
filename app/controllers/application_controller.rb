class ApplicationController < ActionController::Base
	before_action :current_month

	def current_month
		@current_month = Month.find_by_month(Date.today.at_beginning_of_month)
	end
end
