Rails.application.routes.draw do
  mount EpiCas::Engine, at: "/"
  devise_for :users
  
  resources :slipboxes, :trees, :help, :settings

  # allow destroy multiple action for references
  resources :references do
    collection do
      delete 'destroy_multiple'
    end
  end

  # allow searching of notes using a POST method 
  resources :notes do
    post :search, on: :collection
  end

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :"signin", to: "signin#index"
  get :"signup", to: "signup#index"
  get :"trees", to: "trees#index"
  get :"edit", to: "edit_notes#index"
  get :"notes", to: "notes#index"
  get :ie_warning, to: 'errors#ie_warning'  
  get :"help", to: "help#index"
  get :"settings", to: "settings#index"
  get :"references", to: "references#index"

  get :"references/associated_slipboxes/:id", to: "references#associated_slipboxes", as: 'associated_slipboxes'

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  # root page - slipboxes index
  root to: "slipboxes#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
