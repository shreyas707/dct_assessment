class ChangeTagIdsInQuestionToTags < ActiveRecord::Migration
  def change
  	remove_column :questions, :tag_ids
  	add_column :questions, :tags, :jsonb, array: true, default: []
  end
end
