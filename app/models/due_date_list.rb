class DueDateList < ActiveRecord::Base

	belongs_to :batch_set

	def due_date_time_field
		due_date_time.strftime("%d-%b-%Y, %I:%M %p")
	end

end