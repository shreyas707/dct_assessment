class ChangeATableName < ActiveRecord::Migration
  def change
  	rename_table :batch_set_topic_chapters, :batch_set_chapter_topics
  end
end
