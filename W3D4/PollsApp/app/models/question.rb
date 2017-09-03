class Question < ApplicationRecord
  validates :poll_id, :text, presence: true


  belongs_to :poll
  has_many :answer_choices
  has_many :responses, through: :answer_choices
  
end
