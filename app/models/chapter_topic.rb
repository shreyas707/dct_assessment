class ChapterTopic < ActiveRecord::Base

	belongs_to :chapter
	belongs_to :topic

end