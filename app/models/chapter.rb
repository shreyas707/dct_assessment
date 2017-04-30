class Chapter < ActiveRecord::Base

	has_many :questions
	has_many :batch_set_chapter_topics

	has_many :chapter_topics
	has_many :topics, through: :chapter_topics

	validates_presence_of :name

end