class BatchSetChapterTopic < ActiveRecord::Base

	belongs_to :batch_set
	belongs_to :chapter
	belongs_to :topic

end