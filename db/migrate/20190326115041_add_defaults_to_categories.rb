class AddDefaultsToCategories < ActiveRecord::Migration[5.2]
  def up
  	change_column :categories, :budgeted, :decimal, precision: 8, scale: 2, default: 0
  	change_column :categories, :activity, :decimal, precision: 8, scale: 2, default: 0
  	change_column :categories, :balance, :decimal, precision: 8, scale: 2, default: 0
  end

  def down
  	change_column :categories, :budgeted, :decimal, precision: 8, scale: 2, default: nil
  	change_column :categories, :activity, :decimal, precision: 8, scale: 2, default: nil
  	change_column :categories, :balance, :decimal, precision: 8, scale: 2, default: nil
  end
end
