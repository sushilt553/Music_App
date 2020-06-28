Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#root"

  resources :bands, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :update, :destroy, :show] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :update, :show, :destroy, :edit]

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]
end
