class KnowledgeBase < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	belongs_to :chapter
	belongs_to :topic
	before_save :publish_if_admin 

	



def publish_knowledge 
 update_column(:published, true) 

end

def publish_if_admin
if (self.user.is_admin?)
	self.published = true
end
end




def displaylikes
likes = []	
	self.get_upvotes.each do |vote| 
		likes.push(User.find(vote.voter_id).name) 
	end

	if likes.length == 0
		return "No one likes this"
	elsif likes.length == 1
		return likes[0] + " likes this"
	elsif likes.length == 2
		return likes.join(" and ") + " likes this"
	elsif likes.length == 3
		return likes.slice(0,2).join(",") + " and one other likes this"
	elsif likes.length >= 4
		return "#{likes.slice(0,2).join(",")} and #{(likes.length-2)} others likes this"
	end
end


def display_users
	users = []
	self.get_upvotes.each do |vote|
		users.push(User.find(vote.voter_id))
	end
	return users
end

def disliked_users
	users = []
	self.get_downvotes.each do |vote| 
		users.push(User.find(vote.voter_id)) 
	end
	return users
end


def displaydislikes
dislikes = []	
self.get_downvotes.each do |vote| 
	dislikes.push(User.find(vote.voter_id).name) 
end

if dislikes.length == 0
	return "No one dislikes this"
elsif dislikes.length == 1
	return dislikes[0] + " dislikes this"
elsif dislikes.length == 2
	return dislikes.join(" and ") + " dislikes this"
elsif dislikes.length == 3
	return dislikes.slice(0,2).join(",") + " and one other dislikes this"
elsif dislikes.length >= 4
	return "#{dislikes.slice(0,2).join(",")} and #{(dislikes.length-2)} others dislikes this"
end
end

def genrate_code
	
	self.code ="DCT-#{self.topic.short_name}-#{self.chapter.short_name}-#{SecureRandom.hex(4)}"

end

end