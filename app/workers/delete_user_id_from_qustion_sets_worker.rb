class DeleteUserIdFromQuestionSetsWorker
	include Sidekiq::Worker

	def perform(user_id)
		QuestionSet.all.each do |question_set|
      		if question_set.user_ids.include?(user_id)
        		question_set.user_ids = question_set.user_ids - [user_id]
        		question_set.save
    		end
    	end
	end

end