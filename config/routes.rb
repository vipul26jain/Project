Rails.application.routes.draw do
  # get 'home/index'
  # devise_for :users
  devise_for :users, :controllers=> { registrations: "users/registrations", confirmations: "users/confirmations", sessions: "users/sessions", passwords: "users/passwords"}

  root to: "home#index"

  resources :tweets

  devise_scope :users do
	get '/profile/:id' => 'users/custom#profile', as: :profile
	post '/follow_user' => 'users/custom#follow_user', as: :follow_user
	post '/unfollow_user' => 'users/custom#unfollow_user', as: :unfollow_user
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
