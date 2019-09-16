class PagesController < ApplicationController
  def index
    @categories = current_budget.categories.where.not(to_be_budgeted: true).order(name: :asc).group_by(&:group).sort_by { |k, v| k.name }
  end
end