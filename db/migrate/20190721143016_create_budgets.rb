class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.datetime :last_used_at

      t.timestamps
    end
  end
end
