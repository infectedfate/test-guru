class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :questions
  has_and_belongs_to_many :users

  def self.tests_in_category(title)
    joins(:category).where(categories: { title: title}).order(id: :asc).pluck(:title)
  end
end
