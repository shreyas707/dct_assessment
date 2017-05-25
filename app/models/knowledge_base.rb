class KnowledgeBase < ActiveRecord::Base

	belongs_to :user
	belongs_to :chapter
	belongs_to :topic
end
