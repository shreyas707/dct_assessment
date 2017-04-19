class BatchSet < ActiveRecord::Base

	belongs_to :batch
	has_many :answers

	accepts_nested_attributes_for :answers

	has_many :batch_set_chapter_topics
	accepts_nested_attributes_for :batch_set_chapter_topics, :allow_destroy => true

	has_many :batch_set_questions
	has_many :questions, through: :batch_set_questions

	validates_presence_of :title, :set_date, :batch_id

end