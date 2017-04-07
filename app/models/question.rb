class Question < ActiveRecord::Base

	belongs_to :chapter
	belongs_to :topic
	belongs_to :question_type

	has_many :options
	has_many :answers

	has_many :batch_set_chapter_topic_questions
	has_many :batch_set_chapter_topics, through: :batch_set_chapter_topic_questions

end