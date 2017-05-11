class AddDefaultValueForUsersRole < ActiveRecord::Migration
  def change
  	change_column :users, :role, :string, :default => "admin"
  end
end
