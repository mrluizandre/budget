class CategoryTransaction < ApplicationRecord
  belongs_to :from, class_name: 'Category'
  belongs_to :to, class_name: 'Category'
end
