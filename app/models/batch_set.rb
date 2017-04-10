class BatchSet < ActiveRecord::Base

	belongs_to :batch

	has_many :questions
	has_many :batch_set_chapter_topics
	accepts_nested_attributes_for :batch_set_chapter_topics, :allow_destroy => true

end