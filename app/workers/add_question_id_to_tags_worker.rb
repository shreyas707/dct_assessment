# class AddQuestionIdToTagsWorker
# 	include Sidekiq::Worker
# 	sidekiq_options retry: false

# 	def perform(question_id)
# 		question = Question.find(question_id)
# 		question.tag_ids.compact.each do |tag_id| 
# 			tag = Tag.find(tag_id)
# 			tag.question_ids.push(question_id) unless tag.question_ids.include?(question_id)
# 			tag.save
# 		end
# 	end

# end