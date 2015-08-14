class Expense < ActiveRecord::Base
  validates :name, presence: true
  validates :value, numericality: {only_integer: true}
  validates :value, numericality: {greater_than: 0}
  
end