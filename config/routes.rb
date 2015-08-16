Rails.application.routes.draw do
  # root 'welcome#index'

  resources :users
  get '/signup', to: 'users#new'

end
