class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true, uniqueness: {
    scope: :level
  }
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_category, ->(category_name) { joins(:category).where(categories: { title: title }) }

  def self.by_category(category_name)
    joins(:category).where(categories: { title: category_name}).order(id: :asc).pluck(:title)
  end
end
