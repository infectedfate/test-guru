class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions

  validates :title, presence: true, uniqueness: {
    scope: :level,
    message: "Title and must be unique on this level"
  }
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_category, ->(category_name) { joins(:category).where(categories: { title: category_name }) }

  def self.titles_by_category(category_name)
    by_category(category_name).order(title: :desc).pluck(:title)
  end
end
