
 task :setup_data1 => :environment do 


50.times do
 		student = Student.new
 		student.name = Faker::Name.unique.name
		student.email = Faker::Internet.unique.email
 		student.mobile = "1234567890"
 		student.gender = ["male","female"].sample
 		student.dob = Faker::Date.birthday

		student.save
end

5.times do 
	course = Course.new
	course.name = Faker::Educator.course
	course.save
end

10.times do 
	topic = Topic.new
	topic.name = Faker::GameOfThrones.house
	topic.save
end

3.times do 
	batch = Batch.new
	batch.title = ["frontend","webdevelopment"].sample
	batch.start_date = Faker::Date.between(50.days.ago, Date.today)
	batch.end_date = Faker::Date.between(100.days.from_now, 150.days.from_now)
	batch.course_id = Course.all.pluck(:id).sample
	batch.complete = false
	batch.save
end

50.times do 
	bs = BatchStudent.new
	bs.batch_id = Batch.all.pluck(:id).sample
	bs.student_id = Student.all.pluck(:id).sample
	bs.save
end


end