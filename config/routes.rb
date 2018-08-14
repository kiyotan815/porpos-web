Rails.application.routes.draw do



  get 'portfolios/new'

  get 'portfolios/edit'

  get 'portfolios/show'

  root   'top_pages#home'
  get    '/rules',    to: 'top_pages#rules'
  get    '/privacy',  to: 'top_pages#privacy'
  get    '/porpos',   to: 'top_pages#index'
  get    '/signup',   to: 'users#new'
  post   '/signup',   to: 'users#create'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :portfolios
  resources :users
  resources :comments, only: %i[create destroy]
  get    '/users_index',         to: 'administrators#users_index'
  get    '/portfolios_index',    to: 'administrators#portfolios_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
