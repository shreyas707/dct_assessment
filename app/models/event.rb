class Event < ActiveRecord::Base

	belongs_to :event_type

	has_many :batch_events
	has_many :batches, through: :batch_events

end
