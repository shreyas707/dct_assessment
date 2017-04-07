class Topic < ActiveRecord::Base

	has_many :questions
	has_many :batch_set_chapter_topics

	has_many :course_topics
	has_many :courses, through: :course_topics

end