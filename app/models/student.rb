class Student < ActiveRecord::Base

	after_create :create_user
	
	has_one :user

	has_many :batch_students  #, dependent: :destroy
	has_many :batches, through: :batch_students
	accepts_nested_attributes_for :batch_students, :allow_destroy => true

	validates_presence_of :name, :email

	private
	def create_user
		user = User.new
		user.name = self.name
		user.student_id = self.id
		user.email = self.email
		user.password = "password"
		user.avatar = "image/upload/v1494394329/psqitd4es83x1qrhy1si.jpg"
		user.save 
	end

end