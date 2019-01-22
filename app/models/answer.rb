class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }
  validates :body, presence: true

end
