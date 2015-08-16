Rails.application.routes.draw do
  root 'sessions#new'

  resources :users
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'  
  delete 'signout' => 'sessions#destroy'
end
