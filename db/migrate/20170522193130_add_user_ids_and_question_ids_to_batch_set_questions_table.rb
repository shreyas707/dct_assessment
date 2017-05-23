class AddUserIdsAndQuestionIdsToBatchSetQuestionsTable < ActiveRecord::Migration
  def change
  	add_column :batch_set_questions, :question_ids, :jsonb, array: true, default: []
  	add_column :batch_set_questions, :user_ids, :jsonb, array: true, default: []
  end
end
