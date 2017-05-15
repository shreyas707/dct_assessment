class BatchSet < ActiveRecord::Base

	# validate :check_date

	belongs_to :batch

	has_many :answers  #, dependent: :destroy
	accepts_nested_attributes_for :answers

	has_many :batch_set_chapter_topics  #, dependent: :destroy
	accepts_nested_attributes_for :batch_set_chapter_topics, :allow_destroy => true

	has_many :batch_set_questions  #, dependent: :destroy
	has_many :questions, through: :batch_set_questions

	has_many :due_date_lists
	accepts_nested_attributes_for :due_date_lists, :allow_destroy => true

	validates_presence_of :title, :set_date, :batch_id

	# def date_field  # What this returns will be what is shown in the field
	#   due_date.strftime("%d-%b-%Y") if due_date.present?
	# end 

	# def time_field
	#   due_date.strftime("%I:%M %p") if due_date.present?
	# end

	def arrange_questions
		questions = {}
		questions["mcq"] = self.questions.where('question_type_id = ?', QuestionType.find_by(name: "MCQ"))
		questions["text"] = self.questions.where('question_type_id = ?', QuestionType.find_by(name: "Text"))
		return questions
	end

	# def check_date
	# 	if self.due_date < self.set_date
	# 		errors.add(:due_date, "Due date cannot be lesser than set date.")
	# 	end
	# end

end