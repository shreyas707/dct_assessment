task :setup_data1 => :environment do 

	Student.all.each do |student|
		user = User.find_by(student_id: student.id)
		user.name = student.name
		student.difficulty_level = "easy"
		user.save
	end

	BatchSet.all.each do |batch_set|
		if batch_set.due_date_lists.empty?
			due_date_list = DueDateList.new
			due_date_list.batch_set_id = batch_set.id
			due_date_list.due_date_time = batch_set.due_date
			due_date_list.user_ids = User.where(student_id: batch_set.batch.students.pluck(:id)).ids
			due_date_list.save
		end

		if batch_set.question_sets.empty?
			question_set = QuestionSet.new
			question_set.batch_set_id = batch_set.id
			question_set.question_ids = batch_set.questions.ids
			question_set.user_ids = User.where(student_id: batch_set.batch.students.pluck(:id)).ids
			question_set.save
		end
	end

	Answer.all.each do |answer|
		if answer.question.question_type == "MCQ"
			if answer.statement == Option.find(answer.question.answer_option_id).statement
				answer.is_correct = "correct"
			else
				answer.is_correct = "wrong"
			end
		end
	end

end


# BatchSet.all.each do |batch_set|
# 	question_set_chapter_topic = QuestionSetChapterTopic.new
# 		question_set_chapter_topic.question_set_id = QuestionSet.id