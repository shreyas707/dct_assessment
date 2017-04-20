# task :setup_data => :environment do 
# 	# 15.times do 
# 	# 	b = Batch.new
# 	# 	b.title = Faker::Pokemon.name
# 	# 	b.start_date = Faker::Date.between(50.days.ago, Date.today)
# 	# 	b.end_date = Faker::Date.between(50.days.from_now, 150.days.from_now)
# 	# 	b.course_id = Course.all.pluck(:id).sample
# 	# 	students = 20.times.map { Student.all.sample }
# 	# 	b.students.push(students)
# 	# 	b.save
# 	# end

# 	# 100.times do 
# 	# 	q = Question.new
# 	# 	q.statement = Faker::Lorem.sentence
# 	# 	q.chapter_id = Chapter.all.pluck(:id).sample
# 	# 	q.topic_id = Topic.all.pluck(:id).sample
# 	# 	q.question_type_id = QuestionType.all.pluck(:id).sample
# 	# 	if q.question_type_id == 1
# 	# 		option = []
# 	# 		4.times do
# 	# 			option.push(Faker::DragonBall.character)
# 	# 		end
# 	# 		q.options.push(option)
# 	# 		# q.options.first.is_answer = true
# 	# 		q.answer_option_id = q.options.first.id
# 	# 	end
# 	# end

# 	5.times do 
# 		c = Course.new
# 		c.name = Faker::Coffee.blend_name
# 	end

# 	1	5.times do
# 		c = Chapter.new
# 		c.name = Faker::Coffee.blend_name
# 		topics = 
# 		c.topics
# 	end

# end 