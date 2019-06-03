class FixTestPassagesMigration < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_passages, :correct_question
    add_column :test_passages, :correct_answers, :integer, :default => 0
  end
end
