class CreateBatchEvents < ActiveRecord::Migration
  def change
    create_table :batch_events do |t|
      t.integer :batch_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
