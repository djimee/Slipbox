Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users

  resources :slipboxes

  get :"signin", to: "signin#index"
  get :"signup", to: "signup#index"

  get :"slipboxes", to: "slipboxes#index"
  get :"threads", to: "threads#index"
  get :"notes", to: "notes#index"
  
  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  # root page - slipboxes index
  root to: "slipboxes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
