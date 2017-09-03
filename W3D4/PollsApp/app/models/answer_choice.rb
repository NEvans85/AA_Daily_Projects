class AnswerChoice < ApplicationRecord
  validates :question_id, :text, presence: true

  has_many :responses
  has_one :question
end
