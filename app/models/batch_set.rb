class BatchSet < ActiveRecord::Base

	belongs_to :batch

	has_many :answers
	has_many :batch_set_chapter_topics

end