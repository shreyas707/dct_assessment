class DropTableAppreciations < ActiveRecord::Migration
  def change
  	drop_table :appreciations
  end
end
