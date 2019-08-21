class Group < ApplicationRecord
	has_many :categories
	belongs_to :budget
end
