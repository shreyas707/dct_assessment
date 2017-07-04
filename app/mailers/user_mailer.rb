class UserMailer < ApplicationMailer

	default from: "dctacademyblr@gmail.com"

 	def comment_email(user, comment)
    	@user = user
    	@comment = comment
    	mail(to: @user.email, subject: 'DCT - A new comment has been added.')
	end

	def batch_set_email(user, batch_set)
		@user = user
		@batch_set = batch_set
		mail(to: @user.email, subject: 'DCT - A new ' + @batch_set.kind + ' has been added.')
	end

end