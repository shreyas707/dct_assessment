class RemoveColumnsTopicIdChapterIdFromQuestionSets < ActiveRecord::Migration
  def change
  	remove_column :question_sets, :topic_id
  	remove_column :question_sets, :chapter_id
  end
end
