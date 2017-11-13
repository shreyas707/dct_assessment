class CreateQuestionSetTags < ActiveRecord::Migration
  def change
    create_table :question_set_tags do |t|
      t.integer :question_set_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end