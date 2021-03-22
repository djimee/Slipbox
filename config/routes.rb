Rails.application.routes.draw do

<<<<<<< HEAD
  get 'threads/index'
=======
  devise_for :users
>>>>>>> 25a3cbbf9a7f5ba0d0aeebf6107acd7d10c6441f
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :"signin", to: "signin#index"
  get :"signup", to: "signup#index"
  get :"myslipboxes", to: "myslipboxes#index"
  get :"threads", to: "threads#index"
  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  # root to: "pages#home"
  root to: "myslipboxes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
