class Solution < ActiveRecord::Base

	belongs_to :topic
	belongs_to :chapter
	belongs_to :question

end