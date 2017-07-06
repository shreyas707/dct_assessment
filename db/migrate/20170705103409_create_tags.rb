class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.jsonb :question_ids, array: true, default: []

      t.timestamps null: false
    end
  end
end
