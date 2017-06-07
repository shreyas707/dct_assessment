class Question < ActiveRecord::Base
	
	belongs_to :chapter
	belongs_to :topic
	belongs_to :question_type

	has_many :options  #, dependent: :destroy
	accepts_nested_attributes_for :options, :allow_destroy => true
	
	has_many :question_sets
	has_many :answers  #, dependent: :destroy
	has_many :batch_set_questions  #, dependent: :destroy
	has_many :batch_sets  #, through: :batch_set_questions
	has_many :videos

	accepts_nested_attributes_for :videos, :allow_destroy => true

	validates_presence_of :statement, :chapter_id, :topic_id, :question_type_id, :kind
	
	after_create :correct_answer_option


	def self.difficulty 
		["easy","easy-medium","medium", "medium-hard", "hard"]
	end

	def formatted_statement
		self.statement.html_safe
	end

	private
	def correct_answer_option
	  if self.question_type_id == 1
	  	option = options.find_by_is_answer(true)
	  	update(answer_option_id: option.id)
	  else
	  	return
	  end
	end

	# def question_code
	# 	number = 0
	# 	questions = Question.where(topic_id: self.topic.id, chapter_id: self.chapter.id, difficulty_level: self.difficulty_level)
	# 	if questions.exists?
	# 		questions.each do |question|
	# 			number = question.code.split("").last(1).join.to_i + 1
	# 		end
	# 	end	
	# 	self.code = "DCT" + self.topic.short_name + self.chapter.short_name + self.difficulty_level[0].capitalize + 
	# end 

end