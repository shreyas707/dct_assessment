# class DeleteQuestionIdFromQuestionSetsWorker 
# 	include Sidekiq::Worker

# 	def perform(question_id)
# 		QuestionSet.all.each do |question_set|
# 			if question_set.question_ids.include?(question_id)
# 				question_set.question_ids = question_set.question_ids - [question_id]
# 				question_set.save
# 			end
# 		end
# 	end

# end