class Question < ActiveRecord::Base

	# after_save :correct_answer_option

	belongs_to :chapter
	belongs_to :topic
	belongs_to :question_type

	has_many :options
	accepts_nested_attributes_for :options, :allow_destroy => true
	has_many :answers

	has_many :batch_set_questions
	has_many :batch_sets, through: :batch_set_questions

	# private
	# def correct_answer_option
	#  	self.answer_option_id = Option.find_by(question_id: 'self.id', is_answer: 't')
	# end

end