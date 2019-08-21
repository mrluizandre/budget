class AddBudgetToPayees < ActiveRecord::Migration[5.2]
  def change
    add_reference :payees, :budget, foreign_key: true
  end
end
