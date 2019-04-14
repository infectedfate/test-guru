require 'digest/sha1'

class User < ApplicationRecord

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, case_sensitive: false }
  validates_uniqueness_of :mail
  
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    Test.joins(:tests_users).where(tests_users: { user_id: id }, tests: { level: level })
  end
end
