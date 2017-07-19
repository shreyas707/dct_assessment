class CreateDueDateLists < ActiveRecord::Migration
  def change
    create_table :due_date_lists do |t|
      t.integer :batch_set_id
      t.jsonb :user_ids, array: true, default: []
      t.datetime :due_date_time

      t.timestamps null: false
    end
  end
end
