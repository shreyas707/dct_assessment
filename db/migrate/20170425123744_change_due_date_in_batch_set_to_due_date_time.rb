class ChangeDueDateInBatchSetToDueDateTime < ActiveRecord::Migration
  def change
  	change_column :batch_sets, :due_date, :datetime
  end
end
