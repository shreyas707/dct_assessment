class BatchSet < ActiveRecord::Base

	validate :check_date

	belongs_to :batch
	has_many :answers

	accepts_nested_attributes_for :answers

	has_many :batch_set_chapter_topics
	accepts_nested_attributes_for :batch_set_chapter_topics, :allow_destroy => true

	has_many :batch_set_questions
	has_many :questions, through: :batch_set_questions

	validates_presence_of :title, :set_date, :batch_id, :due_date

	def arrange_questions
		questions = {}
		questions["mcq"] = self.questions.where('question_type_id = ?', QuestionType.find_by(name: "MCQ"))
		questions["text"] = self.questions.where('question_type_id = ?', QuestionType.find_by(name: "Text"))
		return questions
	end

	def check_date
		if self.due_date < self.set_date
			errors.add(:due_date, "Due date cannot be lesser than set date.")
		end
	end

end