class BatchStudent < ActiveRecord::Base

	belongs_to :student
	belongs_to :batch

end