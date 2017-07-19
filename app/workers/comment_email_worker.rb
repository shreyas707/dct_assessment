class CommentEmailWorker 
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(user_id, comment_id)
		user = User.find(user_id)
		comment = Comment.find(comment_id)
        UserMailer.comment_email(user, comment).deliver
	end

end
