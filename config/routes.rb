Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users
  
  get 'test/index'
  get 'edit/index'
  match "/403", to: "errors#error_403", via: :all

  get :"signin", to: "signin#index"
  get :"signup", to: "signup#index"

  get :"slipboxes", to: "slipboxes#index"
  get :"threads", to: "threads#index"
  get :"mynotes", to: "mynotes#index"
  
  get :"test", to: "test#index"
  get :ie_warning, to: 'errors#ie_warning'

  get :javascript_warning, to: 'errors#javascript_warning'
  
  resources :slipboxes

  # root to: "pages#home"
  root to: "slipboxes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
