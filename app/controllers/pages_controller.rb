class PagesController < ApplicationController
  def index
    @categories = Category.where.not(to_be_budgeted: true).order(name: :asc).group_by(&:group).sort_by { |k, v| k.name }
  end
end