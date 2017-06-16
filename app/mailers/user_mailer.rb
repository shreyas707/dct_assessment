class UserMailer < ApplicationMailer

	default from: "dctacademyblr@gmail.com"

 	def comment_email(user, comment)
    	@user = user
    	@comment = comment
    	mail(to: @user.email, subject: 'DCT - A new comment has been added.')
	end

end