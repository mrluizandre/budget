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

  def month_amount
    if self.target_amount?
      self.amount
    elsif self.monthly_amount?
      self.amount
    elsif self.date_amount?
      (self.amount - self.category.balance) / ((Time.parse(self.date.to_s) - Time.now)/1.month).ceil
    elsif self.monthly_percentage?
      self.category.group.budget.categories.find_by(to_be_budgeted: true).activity * (self.percentage/100)
    end
  end
end
