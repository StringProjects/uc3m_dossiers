Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dossiers, only: [:index, :show], path: ''

  root 'dossiers#index'
end
