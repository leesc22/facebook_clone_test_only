Rails.application.routes.draw do

	resources :users, except: [:index] 
	resources :statuses, only: [:index]

end
