json.extract! event, :id, :event_type_id, :created_at, :updated_at
json.url event_url(event, format: :json)
