class AddAppreciationIdToAnswer < ActiveRecord::Migration
  def change
  	add_column :answers, :appreciation_id, :integer
  	#remove_column :appreciations, :answer_id
  end
end
