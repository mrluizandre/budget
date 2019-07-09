class PagesController < ApplicationController
  def index
    @categories = Category.where.not(to_be_budgeted: true).order(name: :asc)
  end
end
