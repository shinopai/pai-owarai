Rails.application.routes.draw do
  # auth user
  devise_for :users, skip: 'sessions', controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  devise_scope :user do
    get	'/users/sign_in', to: 'users/sessions#new', as: :new_user_session
    post	'/users/sign_in', to: 'users/sessions#create', as: :user_session
    get	'/users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  # root
  root 'home#index'

  # comedian
  resources :users do
    resources :comedians
  end
  get '/comedians', to: 'comedians#show_all', as: :comedians

  # stage
  resources :users do
    resources :stages
  end
  get '/stages', to: 'stages#show_all', as: :stages

end
