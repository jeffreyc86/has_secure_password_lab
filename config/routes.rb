Rails.application.routes.draw do
  resources :users

  get 'sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#create'

  get 'welcome/home', to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
