require 'digest/sha1'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :mail, uniqueness: true, format: { with: /.+@.+\..+/i }
  
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
