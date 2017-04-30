class BatchSetQuestion < ActiveRecord::Base

	belongs_to :batch_set
	belongs_to :question

end