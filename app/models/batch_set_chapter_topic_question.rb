class BatchSetChapterTopicQuestion < ActiveRecord::Base

	belongs_to :question
	belongs_to :batch_set_chapter_topic

end