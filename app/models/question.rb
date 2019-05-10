class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  def short
    body.trancate(24)
  end
end
