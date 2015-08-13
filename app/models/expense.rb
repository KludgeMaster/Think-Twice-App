class Expense < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :value, numericality: {only_integer: true, greater_than: 0}
  
end