class BatchSetEmailWorker 
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(batch_set_id)
		batch_set = BatchSet.find(batch_set_id)
		batch_set.batch.students.each do |student|
		    user = student.user
		    UserMailer.batch_set_email(user, batch_set).deliver
		end
	end

end
