class RenameColumnTypeInBatchSetAndQuestion < ActiveRecord::Migration
  def change
  	rename_column :questions, :type, :kind
  	rename_column :batch_sets, :type, :kind 
  end
end
