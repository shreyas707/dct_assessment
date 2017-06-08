class UserMailer < ApplicationMailer

	default from: "hello@shreyas.im"

 	def comment_email(user, comment)
    	@user = user
    	@comment = comment
    	mail(to: @user.email, subject: 'DCT - A new comment has been added.')
	end

end