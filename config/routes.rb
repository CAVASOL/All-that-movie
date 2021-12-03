Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :movies, only: :index
  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: [:destroy, :edit, :update]
  resources :reviews, only: :destroy

  get "search", to: "movies#search"
end
