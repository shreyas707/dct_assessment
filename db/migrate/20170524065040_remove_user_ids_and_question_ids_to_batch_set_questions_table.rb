class RemoveUserIdsAndQuestionIdsToBatchSetQuestionsTable < ActiveRecord::Migration
  def change
	remove_column :batch_set_questions, :question_ids
	remove_column :batch_set_questions, :user_ids
  end
end
