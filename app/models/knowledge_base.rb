class KnowledgeBase < ActiveRecord::Base

	acts_as_votable
	belongs_to :user
	belongs_to :chapter
	belongs_to :topic
	# before_save :publish_if_admin 
	#validates_uniqueness_of :generate_code
	
	before_create :generate_code

=begin
def publish_knowledge 
 update_column(:published, true) 

end
=end

=begin
def publish_if_admin
if (self.user.is_admin?)
	self.published = true
end
end
=end

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

=begin
def generate_code
	
	self.article_code ="DCT-#{self.topic.short_name}-#{self.chapter.short_name}-#{SecureRandom.random_number(1000..9999)}"
	while self.article_code.valid?
		self.article_code ="DCT-#{self.topic.short_name}-#{self.chapter.short_name}-#{SecureRandom.random_number(1000..9999)}"
	end

end
=end



def generate_code
	digits = ""
	articles = KnowledgeBase.all
	if articles.empty?
		digits = "0001"
	else
		article = KnowledgeBase.last
		if article.article_code.nil?
			digits = "0001"
		else
			digits = (article.article_code.split("-").last.to_i + 1).to_s.rjust(4,'0')
		end
	end

	self.article_code = loop do
		code = "DCT-#{self.topic.short_name}-#{self.chapter.short_name}-#{digits}"
		break code unless KnowledgeBase.exists?(article_code: code)
	end
end


end