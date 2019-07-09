class CreateCategoryTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :category_transactions do |t|
      t.belongs_to :from, foreign_key: {to_table: :categories}
      t.belongs_to :to, foreign_key: {to_table: :categories}
      t.decimal :amount, precision: 8, scale: 1

      t.timestamps
    end
  end
end
