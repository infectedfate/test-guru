
class User < ApplicationRecord

  devise :database_authenticatable, 
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  validates :email, uniqueness: true, format: { with: /.+@.+\..+/i }

  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :feedbacks
  has_many :users_badges
  has_many :badges, through: :users_badges

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    tests.by_level(level)  
  end
end
