class RemoveColumnAppreciationIdFromAnswers < ActiveRecord::Migration
  def change
  	remove_column :answers, :appreciation_id
  	add_column :answers, :remark_id, :integer
  end
end
