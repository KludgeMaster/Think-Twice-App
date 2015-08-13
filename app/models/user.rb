class User < ActiveRecord::Base
  has_many :expenses
  validates :name, :email, :password, presence: true
end