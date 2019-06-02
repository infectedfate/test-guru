class RenameGistsTableColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :gists, :question, :question_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
