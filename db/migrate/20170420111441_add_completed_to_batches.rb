class AddCompletedToBatches < ActiveRecord::Migration
  def change
  	add_column :batches, :complete, :boolean, :default => false
  end
end
