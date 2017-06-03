class QuestionSetChapterTopic < ActiveRecord::Base

	belongs_to :question_set
	belongs_to :chapter
	belongs_to :topic

end