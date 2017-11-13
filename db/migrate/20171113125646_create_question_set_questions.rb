class CreateQuestionSetQuestions < ActiveRecord::Migration
  def change
    create_table :question_set_questions do |t|
    	t.integer :question_set_id
    	t.integer :question_id
      t.timestamps null: false
    end
  end
end