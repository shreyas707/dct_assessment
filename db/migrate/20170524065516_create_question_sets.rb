class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.integer :topic_id
      t.integer :chapter_id
      t.jsonb :question_ids
      t.jsonb :user_ids

      t.timestamps null: false
    end
  end
end
