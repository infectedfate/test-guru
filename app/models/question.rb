class Question < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answers_count
    errors.add(:question) if question.answers.count >= MAX_ANSWERS
  end
end
