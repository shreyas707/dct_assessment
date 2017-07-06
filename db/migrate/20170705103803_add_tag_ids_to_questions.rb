class AddTagIdsToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :tag_ids, :jsonb, array: true, default: []
  end
end
