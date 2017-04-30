class CreateBatchSetQuestions < ActiveRecord::Migration
  def change
    create_table :batch_set_questions do |t|
      t.integer :batch_set_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
