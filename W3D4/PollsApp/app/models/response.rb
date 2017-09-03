class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true

  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: 'User'
  belongs_to :answer_choice

  has_many :users, through: :answer_choice

  has_one :question, through: :answer_choice

  def not_duplicate_response

  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: respondent.id)
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

end
