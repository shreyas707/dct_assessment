class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :statement
      t.integer :chapter_topics_id
      t.integer :question_type_id
      t.integer :answer_option_id

      t.timestamps null: false
    end
  end
end
