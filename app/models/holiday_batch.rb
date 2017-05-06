class HolidayBatch < ActiveRecord::Base

	belongs_to :batch
	belongs_to :holiday

end