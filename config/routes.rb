Rails.application.routes.draw do
  get 'batches/student'
  get 'batch_sets/select_chapters'
  get 'knowledge_bases/select_chapter'
  get 'knowledge_bases/liked_articles'
  get 'knowledge_bases/my_articles'
  get 'knowledge_bases/topic_articles'
  get 'knowledge_bases/chapter_articles'
  get 'knowledge_bases/user_articles'
  resources :knowledge_bases do 
    member do
      put "like", to: "knowledge_bases#upvote"
      put "dislike", to: "knowledge_bases#downvote"
    end
  end

  resources :event_types
  resources :events
  resources :remarks
  resources :comments
  
  # get 'users/upload_avatar'
  # WITH THIS, USERS CAN UPDATE ALL INFO (EXCEPT PASSWORD) WITHOUT PROVIDING CURRENT PASSWORD
  # path_names will return error when users try to access sign_up page
  devise_for :users, :controllers => {:registrations => 'registrations'}, path_names: {sign_up: ''}, :path_prefix => 'my'

  resources :users
  resources :questions
  resources :question_types
  resources :chapters
  resources :topics
  resources :courses
  resources :roles
  resources :batches do 
    resources :batch_sets
  end
  resources :answers
  resources :batch_sets
  resources :students

  root 'batches#index'
end
