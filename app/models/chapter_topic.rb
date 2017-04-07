class ChapterTopic < ActiveRecord::Base

	belongs_to :chapter
	belongs_to :topic

	has_many :questions

	has_many :batch_set_chapter_topics
	has_many :batch_sets, through: :batch_set_chapter_topics

end