Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

	root "welcome#index"
	resources :slack
	post '/slack/events', to: 'slack#events'
	get '/auth/slack/callback', to: 'sessions#create'

end
