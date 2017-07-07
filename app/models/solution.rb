class Solution < ActiveRecord::Base

	belongs_to :topic
	belongs_to :chapter
	belongs_to :question
	belongs_to :user

	validates_uniqueness_of :body

end