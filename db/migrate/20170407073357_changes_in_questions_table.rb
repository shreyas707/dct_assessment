class ChangesInQuestionsTable < ActiveRecord::Migration
  def change

  	remove_column :questions, :chapter_topics_id
  	remove_column :batch_set_chapter_topics, :chapter_topics	

  	add_column :questions, :chapter_id, :integer
  	add_column :batch_set_chapter_topics, :chapter_id, :integer
  	add_column :batch_set_chapter_topics, :topic_id, :integer
  end
end
