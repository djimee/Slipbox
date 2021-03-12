Rails.application.routes.draw do
 
  
  root "signin#signin"
  
  get '/signin', to: "signin#signin"
  get '/overview', to: "overview#myslipboxes"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
