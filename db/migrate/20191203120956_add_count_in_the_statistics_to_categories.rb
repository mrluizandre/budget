class AddCountInTheStatisticsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :count_in_the_statistics, :boolean, default: true
  end
end
