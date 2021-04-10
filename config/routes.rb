Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
<<<<<<< HEAD
  devise_for :user 
  
  resources :slipboxes, :notes

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all
=======
  devise_for :users

  resources :slipboxes, :notes
>>>>>>> b8797560a068e09641f842f65e1b53687a48aaa1

  get :"signin", to: "signin#index"
<<<<<<< HEAD
  get :"signup", to: "signup#index"
  get :"threads", to: "threads#index"
  get :"edit", to: "edit#index"
  get :"mynotes", to: "mynotes#index"
  get :"test", to: "test#index"
  get :ie_warning, to: 'errors#ie_warning'  
=======
  
  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'
>>>>>>> b8797560a068e09641f842f65e1b53687a48aaa1

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  # root page - slipboxes index
  root to: "slipboxes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
