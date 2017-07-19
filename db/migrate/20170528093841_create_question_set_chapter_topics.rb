class CreateQuestionSetChapterTopics < ActiveRecord::Migration
  def change
    create_table :question_set_chapter_topics do |t|

    	t.integer :question_set_id
    	t.integer :chapter_id
    	t.integer :topic_id

      t.timestamps null: false
    end
  end
end
