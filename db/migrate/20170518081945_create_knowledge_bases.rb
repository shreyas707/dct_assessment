class CreateKnowledgeBases < ActiveRecord::Migration
  def change
    create_table :knowledge_bases do |t|
      t.string :title
      t.text :body
      t.boolean :is_private, default: false
      t.integer :chapter_id
      t.integer :topic_id
      t.boolean :published, default: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
