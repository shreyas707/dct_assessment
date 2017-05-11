task :clear_data => :environment do

	Student.delete_all
	User.delete_all
	Course.delete_all
	Topic.delete_all
	Batch.delete_all

end