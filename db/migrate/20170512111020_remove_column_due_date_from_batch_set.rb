class RemoveColumnDueDateFromBatchSet < ActiveRecord::Migration
  def change
  	remove_column :batch_sets, :due_date
  end
end
