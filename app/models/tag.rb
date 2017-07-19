class Tag < ActiveRecord::Base

	validates_uniqueness_of :name

	before_destroy :delete_tag_id_from_questions
		
	def delete_tag_id_from_questions
		DeleteTagIdFromQuestionsWorker.perform_async(self.id)
	end

end