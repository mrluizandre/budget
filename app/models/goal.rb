class Goal < ApplicationRecord
  belongs_to :category

  enum goal_type: {
    target_amount: 0,
    monthly_amount: 1,
    date_amount: 2,
    monthly_percentage: 3,
  }

  validates_presence_of :amount, if: Proc.new {|goal| goal.goal_type == 'target_amount' or goal.goal_type == 'date_amount' or goal.goal_type == 'monthly_amount'}
  validates_presence_of :date, if: Proc.new {|goal| goal.goal_type == 'date_amount'}
  validates_presence_of :percentage, if: Proc.new {|goal| goal.goal_type == 'monthly_percentage'}
end
