class AddIsActiveToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :is_active, :boolean, default: false
  end
end
