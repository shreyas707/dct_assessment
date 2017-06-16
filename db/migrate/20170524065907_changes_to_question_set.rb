class ChangesToQuestionSet < ActiveRecord::Migration
  def change
  	remove_column :question_sets, :question_ids
  	remove_column :question_sets, :user_ids

  	add_column :question_sets, :question_ids, :jsonb, array: true, default: []
  	add_column :question_sets, :user_ids, :jsonb, array: true, default: []

  end
end