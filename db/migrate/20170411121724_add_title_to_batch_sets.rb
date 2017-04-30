class AddTitleToBatchSets < ActiveRecord::Migration
  def change
  	add_column :batch_sets, :title, :string
  end
end
