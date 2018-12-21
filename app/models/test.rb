class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users

  class << self
   def tests_in_category(title)
     joins(:category).where(categories: { title: title}).order(id: :asc).pluck(:title)
   end
 end
end
