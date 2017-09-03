class Poll < ApplicationRecord
  validates :author_id, :title, presence: true

  has_many :questions
  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

end
