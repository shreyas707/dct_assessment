class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :statement
      t.boolean :is_answer
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
