Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
    root 'static_pages#home'
    resources :cinemas, only: [:new, :create, :show]
    resources :movies
    post '/theatres', to: 'theatres#create'
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
      get 'login', to: 'devise/sessions#new'
    end

    devise_scope :user do
      get '/signout', to: 'devise/sessions#destroy', as: :signout
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
