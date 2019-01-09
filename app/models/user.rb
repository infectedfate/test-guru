class User < ApplicationRecord
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    Test.joins(:test_passings).where(test_passings: { user_id: id }, tests: { level: level })
  end
end
