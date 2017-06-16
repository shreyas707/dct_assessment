class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :body
      t.integer :question_id
      t.integer :topic_id
      t.integer :chapter_id

      t.timestamps null: false
    end
  end
end
