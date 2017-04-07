class BatchSetChapterTopic < ActiveRecord::Base

	belongs_to :batch_set
	belongs_to :chapter
	belongs_to :topic

	has_many :batch_set_chapter_topic_questions
	has_many :questions, through: :batch_set_chapter_topic_questions

end