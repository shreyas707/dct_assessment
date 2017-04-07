class CreateBatchSetChapterTopicQuestions < ActiveRecord::Migration
  def change
    create_table :batch_set_chapter_topic_questions do |t|
      t.integer :batch_set_chapter_topics_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
