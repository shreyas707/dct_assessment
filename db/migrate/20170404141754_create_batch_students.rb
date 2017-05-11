class CreateBatchStudents < ActiveRecord::Migration
  def change
    create_table :batch_students do |t|
      t.integer :batch_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
