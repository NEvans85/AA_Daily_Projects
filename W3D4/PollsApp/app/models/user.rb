class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :polls
  has_many :responses
end
