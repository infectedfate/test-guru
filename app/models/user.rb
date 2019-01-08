class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    Test.joins(:test_passings).where(test_passings: { user_id: id }, tests: { level: level })
  end
end
