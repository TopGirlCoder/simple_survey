Rails.application.routes.draw do
  devise_for :users

  root 'surveys#index'

  resources :surveys do 
   resources :votes
  end 
  
  resources :users	
  
  get ":url" => "application#redirect_user", constraints: { url: /.*/ }
  
end
