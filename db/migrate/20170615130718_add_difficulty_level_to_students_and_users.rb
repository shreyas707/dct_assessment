class AddDifficultyLevelToStudentsAndUsers < ActiveRecord::Migration
  def change
    add_column :students, :difficulty_level, :string, :default => "easy"
    add_column :users, :difficulty_level, :string
  end
end
