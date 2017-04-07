Rails.application.routes.draw do
  # get 'spots/index'

  # get 'spots/show'

  # get 'spots/edit'

  # get 'spots/new'

  # get 'user/index'

  # get 'user/create'

  # get 'user/edit'

  # get 'user/update'

  # get 'user/new'

  # get 'user/destroy'

  # get 'user/show'

	root 'main#index'
	
  get 'main/about'

 	get "login" => 'sessions#new'
 	post "login" => 'sessions#create'
 	get "logout" => 'sessions#destroy'

 	resources :user
  resources :map
  resources :spots

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
