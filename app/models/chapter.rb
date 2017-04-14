class Chapter < ActiveRecord::Base

	has_many :questions
	has_many :batch_set_chapter_topics

	validates_presence_of :name

end