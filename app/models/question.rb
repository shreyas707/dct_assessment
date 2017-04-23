class Question < ActiveRecord::Base
	
	belongs_to :chapter
	belongs_to :topic
	belongs_to :question_type

	has_many :options
	accepts_nested_attributes_for :options, :allow_destroy => true
	has_many :answers

	has_many :batch_set_questions
	has_many :batch_sets, through: :batch_set_questions

	validates_presence_of :statement, :chapter_id, :topic_id, :question_type_id, :kind
	
	after_create :correct_answer_option

	private
	def correct_answer_option
	  if self.question_type_id == 1
	  	option = options.find_by_is_answer(true)
	  	update(answer_option_id: option.id)
	  else
	  	return
	  end
	end

end