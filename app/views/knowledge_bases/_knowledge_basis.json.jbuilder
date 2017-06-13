json.extract! knowledge_basis, :id, :title, :body, :is_private, :chapter_id, :topic_id, :published, :user_id, :created_at, :updated_at
json.url knowledge_basis_url(knowledge_basis, format: :json)
