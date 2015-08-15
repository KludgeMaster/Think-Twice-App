class Expense < ActiveRecord::Base

  validates :name, presence: true, length: {maximum: 40}
  validates :value, numericality: {greater_than: 0, less_than: 10000000}
  @@MIN_PERCENT = 5
  
  belongs_to :user

end