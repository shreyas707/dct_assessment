class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :statement
      t.integer :user_id
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
