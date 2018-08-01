Rails.application.routes.draw do
  
  root 'top_pages#home'
  get '/rules',   to: 'top_pages#rules'
  get '/privacy', to: 'top_pages#privacy'
  get '/porpos',  to: 'top_pages#index'
  
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/logout', to: 'devise/sessions#destroy'
    get '/signup',  to: 'devise/registrations#new'
  end
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
