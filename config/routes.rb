Rails.application.routes.draw do

  get 'faq' => 'faq#index'

  #temporary for testing, delete later
  
    
  get 'join/:id' => 'students#new', as: :join
  post 'join/:id' => 'students#create'
  get 'joined/vcard' => 'students#download_vcard', as: :download_vcard
  get 'joined' => 'students#joined', as: :joined
    
    
  
  devise_for :teachers, :controllers => { registrations: 'registrations' }
    
  get 'dashboard' => 'dashboard#index'
  
  resources :colors
  resources :questions
  resources :periods, :path => 'classes'
  get "/get_students/:period_id" => 'periods#get_students', as: 'get_students'
    
  resources :students 
  put 'students/:id/lock' => 'students#toggle_lock'
  
    
  get 'exitslip/:id/average' => 'response_sets#average'
  resources :response_sets, :path => 'exitslip'
    
  match 'response/inbound' => 'response#inbound', via: [:get, :post]
  get 'response/rating/:id/:rating' => 'response#set_rating'  
    
  authenticated :teacher do
      root :to => 'dashboard#index', as: :authenticated_root
  end
  
    
  root :to => 'home#index'
    
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
