class QuestionType < ActiveRecord::Base

	has_many :questions  #, dependent: :destroy

	validates_presence_of :name

end