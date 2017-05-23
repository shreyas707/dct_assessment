class Answer < ActiveRecord::Base

	before_save :mcq_is_correct

	belongs_to :question
	belongs_to :batch_set
	belongs_to :user
	belongs_to :remark

	has_many :comments  #, dependent: :destroy

	validates_presence_of :statement, :question_id, :user_id, :batch_set_id

	def formatted_statement
   		self.statement.html_safe
   	end

   	def mcq_is_correct
   		if self.question.question_type.name == "MCQ"
   			if self.question.options.find_by(is_answer: true).statement == self.statement
   				self.is_correct = "correct"
   			else
   				self.is_correct = "wrong"
   			end
   		end
   	end

end