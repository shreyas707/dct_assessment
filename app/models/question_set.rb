class QuestionSet < ActiveRecord::Base

	belongs_to :batch_set
	belongs_to :question
	belongs_to :user

	has_many :question_set_chapter_topics #, dependent: :destroy
	has_many :topics, through: :question_set_chapter_topics
	has_many :chapters, through: :question_set_chapter_topics
	accepts_nested_attributes_for :question_set_chapter_topics, :allow_destroy => true



end