Rails.application.routes.draw do

  get 'batches/student'
  get 'batch_sets/select_chapters'

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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
