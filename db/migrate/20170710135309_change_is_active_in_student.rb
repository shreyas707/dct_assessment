class ChangeIsActiveInStudent < ActiveRecord::Migration
  def change
  	remove_column :students, :is_active
  	add_column :students, :is_active, :boolean, default: true
  end
end
