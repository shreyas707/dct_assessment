class AddShortNameToTopicAndChapter < ActiveRecord::Migration
  def change
  	add_column :topics, :short_name, :string
  	add_column :chapters, :short_name, :string
  end
end
