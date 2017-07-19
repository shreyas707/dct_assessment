class DeleteTagIdFromQuestionsWorker 
	include Sidekiq::Worker

	def perform(tag_id)
		Question.all.each do |question|
			if question.tag_ids.include?(tag_id)
				question.tag_ids = question.tag_ids - [tag_id]
				question.save
			end
		end
	end

end