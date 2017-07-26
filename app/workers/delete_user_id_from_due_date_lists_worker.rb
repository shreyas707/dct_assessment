# class DeleteUserIdFromDueDateListsWorker
# 	include Sidekiq::Worker

# 	def perform(user_id)
# 		DueDateList.all.each do |due_date_list|
#       		if due_date_list.user_ids.include?(user_id)
#         		due_date_list.user_ids = due_date_list.user_ids - [user_id]
#         		due_date_list.save
#     		end
#     	end
# 	end

# end