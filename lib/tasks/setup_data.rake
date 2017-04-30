# task :setup_data => :environment do 

# 	user = User.new
# 	user.email = "admin@dcta"
# 	user.password = "admin@dcta"
# 	user.role = "admin"
# 	user.save

# 	qt = QuestionType.new
# 	qt.name = "MCQ"
# 	qt.save

# 	qt = QuestionType.new
# 	qt.name = "Text"
# 	qt.save

# 	5.times do
# 		course = Course.new
# 		course.name = Faker::Coffee.unique.blend_name
# 		course.save
# 	end

# 	10.times do
# 		topic = Topic.new
# 		topic.name = Faker::GameOfThrones.unique.character
# 		courses = 3.times.map { Course.all.sample }
# 		topic.courses.push(courses)
# 		topic.save
# 	end

# 	25.times do
# 		chapter = Chapter.new
# 		chapter.name = Faker::Superhero.unique.name
# 		topics = 3.times.map { Topic.all.sample }
# 		chapter.topics.push(topics)
# 		chapter.save
# 	end

# 	15.times do 
# 		b = Batch.new
# 		b.title = Faker::Pokemon.unique.name
# 		b.start_date = Faker::Date.between(50.days.ago, Date.today)
# 		b.end_date = Faker::Date.between(100.days.from_now, 150.days.from_now)
# 		b.course_id = Course.all.pluck(:id).sample
# 		students = 20.times.map { Student.all.sample }
# 		b.students.push(students)
# 		b.save
# 	end

# 	100.times do 
# 		q = Question.new
# 		q.statement.html_safe = Faker::Lorem.sentence
# 		q.chapter_id = Chapter.all.pluck(:id).sample
# 		q.topic_id = Topic.all.pluck(:id).sample
# 		q.question_type_id = QuestionType.all.pluck(:id).sample
# 		if q.question_type_id == 1
# 			options = 4.times.map.(Faker::DragonBall.character)
# 			q.options.push(options)
# 			q.options.first.is_answer = true
#			q.options.second.is_answer = false
#			q.options.third.is_answer = false
#			q.options.fourth.is_answer = false
# 			q.answer_option_id = q.options.first.id
# 		end
# 		q.save
# 	end

# 	50.times do
# 		student = Student.new
# 		student.name = Faker::Name.unique.name
# 		student.email = Faker::Internet.unique.email
# 		student.mobile = "1234567890"
# 		student.batch = Batch.all.pluck(:id).sample
# 		student.save
# 	end

#	60.times do 
#		bs = BatchSet.new
#		bs.batch_id = Batch.all.pluck(:id).sample
#		bs.set_date = Faker::Date.between(Date.today, 50.days.from_now)
#		bs.topic_id = Topic.all.pluck(:id).sample
#		bs.chapter_id = Chapter.all.pluck(:id).sample
#		bs.save
#	end

# end 