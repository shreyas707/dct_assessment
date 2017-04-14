class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :batch_set
	belongs_to :user

	validates_presence_of :statement, :question_id, :user_id, :batch_set_id

end