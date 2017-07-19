class AddBatchSetIdToQuestionSet < ActiveRecord::Migration
  def change
  	add_column :question_sets, :batch_set_id, :integer
  end
end
