class ChangeNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :mail, false)
    change_column_null(:users, :name, true)
  end
end
