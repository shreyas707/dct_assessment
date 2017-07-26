# class DeleteQuestionIdFromTagsWorker 
# 	include Sidekiq::Worker

# 	def perform(question_id)
# 		Tag.all.each do |tag|
# 			if tag.question_ids.include?(question_id)
# 				tag.question_ids = tag.question_ids - [question_id]
# 				tag.save
# 			end
# 		end
# 	end

# end