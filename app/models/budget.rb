class Budget < ApplicationRecord
  belongs_to :user
  has_many :groups
  has_many :categories, :through => :groups

  def create_this_month_stat
  	this_month = Date.today
  	self.create_month_stats(year: this_month.year, month: this_month.month)
  end

  def create_next_month_stat
  	next_month = Date.today + 1.month
  	self.create_month_stats(year: next_month.year, month: next_month.month)
  end

  def create_month_stats(year:, month:)
		self.categories.each do |cat|
			cat.create_month_stat(year: year, month: month)
		end
	end
end
