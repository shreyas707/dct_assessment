class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :statement
      t.integer :question_id
      t.integer :user_id
      t.integer :batch_set_id

      t.timestamps null: false
    end
  end
end
