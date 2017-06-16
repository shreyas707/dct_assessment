class Course < ActiveRecord::Base

	has_many :batches #, dependent: :destroy

	has_many :course_topics #, dependent: :destroy
	has_many :topics, through: :course_topics

	validates_presence_of :name

end