class PagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_budget.categories.where.not(to_be_budgeted: true).order(name: :asc).group_by(&:group).sort_by { |k, v| k.name }
  end

  def future
    @scheduled_transactions = ScheduledTransaction.where(done: false).joins(:category).merge(Category.where(count_in_the_statistics: true)).order(date: :asc).group_by{|a| a.date.strftime("%B/%Y")}
  end
end