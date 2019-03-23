class User < ApplicationRecord
  has_many :tests_users
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :mail, presence: true


  def tests_by_level(level)
    Test.joins(:tests_users).where(tests_users: { user_id: id }, tests: { level: level })
  end
end
