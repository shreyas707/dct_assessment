class Batch < ActiveRecord::Base

	belongs_to :course

	has_many :batch_sets
	accepts_nested_attributes_for :batch_sets, :allow_destroy => true

	has_many :batch_students
	has_many :students, through: :batch_students

end