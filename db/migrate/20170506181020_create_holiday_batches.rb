class CreateHolidayBatches < ActiveRecord::Migration
  def change
    create_table :holiday_batches do |t|
      t.integer :holiday_id
      t.integer :batch_id

      t.timestamps null: false
    end
  end
end
