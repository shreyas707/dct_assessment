class AddDifficultyLevelToQuestionSet < ActiveRecord::Migration
  def change
    add_column :question_sets, :difficulty_level, :string
  end
end
