class Chapter < ActiveRecord::Base

	has_many :question_sets
	
	#it will raise exception for question when chapter is deleted right?
	has_many :questions
	has_many :batch_set_chapter_topics  #, dependent: :destroy

	has_many :chapter_topics  #, dependent: :destroy
	has_many :topics, through: :chapter_topics

	validates_presence_of :name

end