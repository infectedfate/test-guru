class Question < ApplicationRecord

  SHORT_BODY = 24
  
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  def short
    body.trancate(SHORT_BODY)
  end
end
