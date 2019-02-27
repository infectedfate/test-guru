class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }
  validates :body, presence: true
  validate :answers_count, on: :create

  private

  def answers_count
    errors.add(:question) if question.answers.count >= MAX_ANSWERS
  end
end
