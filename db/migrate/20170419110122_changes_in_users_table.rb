class ChangesInUsersTable < ActiveRecord::Migration
  def change
  	#drop_table :roles
  	remove_column :users, :role_id
  	add_column :users, :role, :integer 
  end
end
