class ChangeIsCorrectInAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :score, :float
  end
end