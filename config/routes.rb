Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :user 
  
  resources :slipboxes, :notes

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :"slipboxes", to: "slipboxes#index"
  get :"signin", to: "signin#index"
  get :"signup", to: "signup#index"
  get :"threads", to: "threads#index"
  get :"edit", to: "edit#index"
  get :"mynotes", to: "mynotes#index"
  get :"test", to: "test#index"
  get :ie_warning, to: 'errors#ie_warning'  

  # root to: "pages#home"
  root to: "slipboxes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
