class AddCorrectColumnToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :is_correct, :string
  end
end
