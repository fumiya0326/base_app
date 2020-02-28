Rails.application.routes.draw do
  get 'sules/show'
  resources :sules
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }
  resources :users do  
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :replies, only: [:create]
  
  root to: 'sules#teamindex'
  get 'sule/itiran',          to: 'sules#itiran'
  get 'sules/index/:teamatr', to: 'sules#index', as: :sule_index_path
  get 'sules/show/:id' ,      to: 'sules#show', as: :sule_show_path
  post 'sules/index',         to: 'sules#create', as: :sule_create_path
  post 'sules/show',          to: 'commes#create', as: :comme_create_path
  get  'sules/new',           to: 'sules#new'
  get 'sules/search',         to: 'sules#search'
  get   'users/show/:id',     to: 'users#show', as: :users_show_path
  
  
end
