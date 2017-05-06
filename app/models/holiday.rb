class Holiday < ActiveRecord::Base

	has_many :holiday_batches
	has_many :batches, through: :holiday_batches

end