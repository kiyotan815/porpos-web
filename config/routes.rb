Rails.application.routes.draw do
  

  root 'top_pages#home'
  get '/rules',   to: 'top_pages#rules'
  get '/privacy', to: 'top_pages#privacy'
  get '/porpos',  to: 'top_pages#index'
  get '/signup',  to: 'users#new'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
