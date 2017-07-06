class ReplacedTagsWithTagIdsFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :tags
  	add_column :questions, :tag_ids, :jsonb, array: true, default: []
  end
end
