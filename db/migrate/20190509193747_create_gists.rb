class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.integer :user_email, foreign_key: true
      t.integer :question, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
