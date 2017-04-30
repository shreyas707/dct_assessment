class Course < ActiveRecord::Base

	has_many :batches

	has_many :course_topics
	has_many :topics, through: :course_topics

	validates_presence_of :name

end