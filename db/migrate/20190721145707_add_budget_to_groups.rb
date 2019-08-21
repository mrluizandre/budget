class AddBudgetToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :budget, foreign_key: true
  end
end
