Rails.application.routes.draw do
  get 'test/test'

  get 'student/new'

  get 'user/start'

  get 'student/start'

  get 'announcement/new'

  resources :sessions
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  resources :user
  
	
   match ':controller/:action/(:id)', via: :get
   match ':controller/:action/(:id)', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
