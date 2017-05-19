class Student < ActiveRecord::Base

	after_create :create_user
	after_update :update_user
	
	has_one :user

	has_many :batch_students  #, dependent: :destroy
	has_many :batches, through: :batch_students
	accepts_nested_attributes_for :batch_students, :allow_destroy => true

	validates_presence_of :name, :email

	private
	def create_user
		user = User.new
		user.name = self.name
		user.email = self.email
		user.dob = self.dob
		user.gender = self.gender
		user.password = "password"
		user.student_id = self.id
		user.save 
	end

	def update_user
		user = User.find_by(student_id: self.id)
		user.name = self.name
		user.email = self.email
		user.dob = self.dob
		user.gender = self.gender
		user.save
	end

end