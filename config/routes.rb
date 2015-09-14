Rails.application.routes.draw do

  root 'welcome#index'

  resources :photos, only: [:index, :show]

  post '/photo/like/:id', to: 'likes#create', as: 'create_like'
end
