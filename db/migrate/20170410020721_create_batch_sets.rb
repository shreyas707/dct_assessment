class CreateBatchSets < ActiveRecord::Migration
  def change
    create_table :batch_sets do |t|
      t.date :set_date
      t.integer :batch_id

      t.timestamps null: false
    end
  end
end
