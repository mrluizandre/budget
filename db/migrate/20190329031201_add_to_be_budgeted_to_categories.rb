class AddToBeBudgetedToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :to_be_budgeted, :boolean, default: false
  end
end
