class MakeFalseDefaultValueInOptions < ActiveRecord::Migration
  def change
  	change_column :options, :is_answer, :boolean, :default => false
  end
end
