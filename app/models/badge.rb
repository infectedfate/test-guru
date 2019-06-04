class Badge < ApplicationRecord
  BADGES_TYPE = {
    'Прохождение всех тестов категории' => :all_category_tests,
    'Прохождение теста с первой попытки' => :test_first_try,
    'Прохождение всех тестов определнного уровня' => :all_level_tests
  }.freeze

  before_save :set_image_path

  has_many :users_badges
  has_many :users, through: :users_badges
  belongs_to :category, class_name: 'Category', optional: true

 
  validates :title, presence: true
  validates :path, presence: true		   
  validates :assigment_rule, presence: true

  def self.images
   image_path = 'app/assets/images/'
   badges = Dir.glob("#{image_path}badges/*")
   badges.map { |badge_path| badge_path.gsub(image_path, '') }
  end

private

  def set_image_path
    self.image_path = 'badges/badge-default.png' if image_path.blank?
  end
end
