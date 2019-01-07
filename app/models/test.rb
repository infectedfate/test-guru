class Test < ApplicationRecord
  has_many :questions

  def self.tests_in_category(title)
    joins(:category).where(categories: { title: title}).order(id: :asc).pluck(:title)
  end
end
