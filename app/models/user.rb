class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  has_many :expenses
end