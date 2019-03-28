class AddDefaultsToMonths < ActiveRecord::Migration[5.2]
  def up
  	change_column :months, :income, :decimal, precision: 8, scale: 2, default: 0
  	change_column :months, :budgeted, :decimal, precision: 8, scale: 2, default: 0
  	change_column :months, :activity, :decimal, precision: 8, scale: 2, default: 0
  	change_column :months, :to_be_budgeted, :decimal, precision: 8, scale: 2, default: 0
  end

def down
  	change_column :months, :income, :decimal, precision: 8, scale: 2, default: nil
  	change_column :months, :budgeted, :decimal, precision: 8, scale: 2, default: nil
  	change_column :months, :activity, :decimal, precision: 8, scale: 2, default: nil
  	change_column :months, :to_be_budgeted, :decimal, precision: 8, scale: 2, default: nil
  end
end
