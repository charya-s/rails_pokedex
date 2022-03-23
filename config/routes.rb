Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :pkmn_generals

  get 'search_abilities', to: 'pkmn_generals#search_abilities'
  get 'goodpkmn', to: 'pkmn_generals#goodpkmn'
  get 'search_abilities_good', to: 'pkmn_generals#search_abilities_good'
end
