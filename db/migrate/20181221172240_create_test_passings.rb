class CreateTestPassings < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passings do |t|

      t.timestamps
    end
  end
end
