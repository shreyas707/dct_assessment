class Question < ActiveRecord::Base

	after_save :correct_answer_option

	belongs_to :chapter
	belongs_to :topic
	belongs_to :question_type

	has_many :options
	accepts_nested_attributes_for :options, :allow_destroy => true
	has_many :answers

	has_many :batch_set_chapter_topic_questions
	has_many :batch_set_chapter_topics, through: :batch_set_chapter_topic_questions

	def correct_answer_option
		self.answer_option_id = Option.where('question_id = ? AND is_answer = ?', self.id, "t").first.id
	end

end