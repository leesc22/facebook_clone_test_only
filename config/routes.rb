Rails.application.routes.draw do
	root 'welcome#index'
	# root :to => 'welcome#index'
	# root to: 'welcome#index'
	# resources :welcome, only: [:index]
	get 'welcome/index', as: 'welcome_index'
	resources :users, except: [:index] 
	resources :sessions, only: [:new, :create]
	# custom routes for destroy without :id
	delete '/sessions' => 'sessions#destroy', as: 'session'
	resources :statuses, except: [:index, :show]
	resources :likes, only: [:create, :destroy]
end
