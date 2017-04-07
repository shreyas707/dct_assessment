class Batch < ActiveRecord::Base

	belongs_to :course

	has_many :batch_sets

	has_many :batch_students
	has_many :students, through: :batch_students

end