class AddDefaultAvatarToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :avatar
  	add_column :users, :avatar, :string, default: => "image/upload/v1494836967/default_pic_pbc6pg.jpg"
  end
end
