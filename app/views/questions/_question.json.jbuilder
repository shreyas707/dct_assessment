json.extract! question, :id, :statement, :chapter_topics_id, :question_type_id, :answer_option_id, :created_at, :updated_at
json.url question_url(question, format: :json)
