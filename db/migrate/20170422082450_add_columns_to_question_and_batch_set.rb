class AddColumnsToQuestionAndBatchSet < ActiveRecord::Migration
  def change
  	add_column :batch_sets, :type, :string
  	add_column :questions, :type, :string
  end
end
