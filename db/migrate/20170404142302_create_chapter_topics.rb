class CreateChapterTopics < ActiveRecord::Migration
  def change
    create_table :chapter_topics do |t|
      t.integer :chapter_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
