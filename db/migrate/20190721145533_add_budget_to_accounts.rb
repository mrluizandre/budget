class AddBudgetToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :budget, foreign_key: true
  end
end
