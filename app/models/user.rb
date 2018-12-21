class User < ApplicationRecord
  has_many :tests

  def tests_by_level(level)
    Test.joins(:user).where(users: { user_id: id }, tests: { level: level })
  end
end
