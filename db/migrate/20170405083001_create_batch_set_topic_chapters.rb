class CreateBatchSetTopicChapters < ActiveRecord::Migration
  def change
    create_table :batch_set_topic_chapters do |t|
      t.integer :batch_set_id
      t.integer :chapter_topics

      t.timestamps null: false
    end
  end
end
