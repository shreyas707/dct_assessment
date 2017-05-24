class QuestionSet < ActiveRecord::Base

	belongs_to :batch_set
	belongs_to :topic
	belongs_to :chapter
	belongs_to :question
	belongs_to :user

end