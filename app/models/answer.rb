class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :batch_set
	belongs_to :user
	belongs_to :remark

	has_many :comments  #, dependent: :destroy

	validates_presence_of :statement, :question_id, :user_id, :batch_set_id

	def formatted_statement
   		self.statement.html_safe
   	end

end