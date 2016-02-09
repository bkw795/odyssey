Rails.application.routes.draw do
  root 'sessions#new'

  resources :users
  resources :atlases
  resources :atlas_pages
  resources :locations do
    resources :private_notes
  end

  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'  
  delete 'signout' => 'sessions#destroy'
end
