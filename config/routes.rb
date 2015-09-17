Rails.application.routes.draw do

  root 'welcome#index'

  match '/auth/500px/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:delete]

  resources :photos, only: [:index, :show]

  post '/photos/favorite/:photo_id', to: 'favorites#create', as: 'create_favorite'
  delete '/photos/favorite/:photo_id', to: 'favorites#delete', as: 'delete_favorite'
end
