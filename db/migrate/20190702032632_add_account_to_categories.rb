class AddAccountToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :linked_credit_card_account, foreign_key: {to_table: :accounts}
  end
end
