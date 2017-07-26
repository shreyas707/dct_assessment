class Tag < ActiveRecord::Base

	validates_uniqueness_of :name

	before_destroy :delete_tag_id_from_questions
		
	def delete_tag_id_from_questions
		# DeleteTagIdFromQuestionsWorker.perform_async(self.id)
		Question.all.each do |question|
			if question.tag_ids.include?(self.id)
				question.tag_ids = question.tag_ids - [self.id]
				question.save
			end
		end
	end

end