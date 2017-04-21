class Student < ActiveRecord::Base

	after_create :create_user
	
	has_one :user

	has_many :batch_students
	has_many :batches, through: :batch_students
	accepts_nested_attributes_for :batch_students, :allow_destroy => true

	validates_presence_of :name, :email

	private
	def create_user
		user = User.new
		user.student_id = self.id
		user.email = self.email
		user.password = "password"
		user.save 
	end

end