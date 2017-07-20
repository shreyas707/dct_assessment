task :setup_data1 => :environment do 

	# YET TO RUN ON HEROKU STAGING AND MAIN
	# =======================================================================>
	# Student.all.each do |student|
	# 	student.is_active = true
	# 	student.save
	# end

	# Answer.all.each do |answer|
	# 	if answer.question.question_type.name == "MCQ"
	# 		if answer.is_correct == "correct"
	# 			answer.score = 1.0
	# 		elsif answer.is_correct == "wrong"
	# 			answer.score = 0.0
	# 		end
	# 	end
	# end
	# ================================================

	# RUN ONLY ON STAGING AND DEV ENV
	# ================================================
	
	# i = 0
	# 5.times do
	# 	tag = Tag.new
	# 	tag.name = "tag" + i.to_s
	# 	i += 1
	# 	tag.save 
	# end

	# Question.all.each do |question|
	# 	if question.code != nil
	# 		question.tag_ids = Tag.all.pluck(:id)
	# 		question.save
	# 		Tag.all.each do |tag|
	# 			tag.question_ids.push(question.id)
	# 			tag.save
	# 		end
	# 	end
	# end

	# =======================================================================>

	# Student.all.each do |student|
	# 	student.difficulty_level = "easy"
	# 	student.save
	# end

	# Question.all.where(kind: "assessment").each do |question|
	# 	question.difficulty_level = "easy"
	# 	question.save
	# end


	# Student.all.each do |student|
	# 	user = User.find_by(student_id: student.id)
	# 	user.name = student.name
	# 	user.save
	# end

	# BatchSet.all.each do |batch_set|
	# 	if batch_set.due_date_lists.empty?
	# 		due_date_list = DueDateList.new
	# 		due_date_list.batch_set_id = batch_set.id
	# 		due_date_list.due_date_time = batch_set.due_date
	# 		due_date_list.user_ids = User.where(student_id: batch_set.batch.students.pluck(:id)).ids
	# 		due_date_list.save
	# 	end

	# 	if batch_set.question_sets.empty?
	# 		question_set = QuestionSet.new
	# 		question_set.batch_set_id = batch_set.id
	# 		question_set.question_ids = batch_set.questions.ids
	# 		question_set.user_ids = User.where(student_id: batch_set.batch.students.pluck(:id)).ids
	# 		question_set.save
	# 	end
	# end

	# Answer.all.each do |answer|
	# 	if answer.question.question_type.name == "MCQ"
	# 		if answer.statement == Option.find(answer.question.answer_option_id).statement
	# 			answer.is_correct = "correct"
	# 		else
	# 			answer.is_correct = "wrong"
	# 		end
	# 	end
	# 	answer.save
	# end

end