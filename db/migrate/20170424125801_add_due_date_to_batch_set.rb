class AddDueDateToBatchSet < ActiveRecord::Migration
  def change
  	add_column :batch_sets, :due_date, :date
  end
end
