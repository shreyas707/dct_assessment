class Student < ActiveRecord::Base

	after_create :create_user
	after_update :update_user
	
	has_one :user #, dependent: :destroy

	has_many :batch_students #, dependent: :destroy
	has_many :batches, through: :batch_students
	accepts_nested_attributes_for :batch_students, :allow_destroy => true

	validates_presence_of :name, :email

	def self.difficulty 
		["easy", "medium", "hard"]
	end

	private
	def create_user
		unless User.find_by(email: self.email).present?
			user = User.new
			user.name = self.name
			user.email = self.email
			user.mobile = self.mobile
			user.dob = self.dob
			user.gender = self.gender
			user.password = "password"
			user.student_id = self.id
			user.difficulty_level = self.difficulty_level
			user.save
		end
	end

	def update_user
		user = User.find_by(student_id: self.id)
		user.name = self.name
		user.email = self.email
		user.mobile = self.mobile
		user.dob = self.dob
		user.gender = self.gender
		user.difficulty_level = self.difficulty_level
		user.save
	end

end