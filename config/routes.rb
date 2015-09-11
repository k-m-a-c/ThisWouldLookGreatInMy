Rails.application.routes.draw do

  root 'welcome#index'

  resources :photos, only: [:index, :show]
end
