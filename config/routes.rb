Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'surveys#index'

  resources :surveys do 
  	resources :votes
  end	

  match '*path', via: :all, to: redirect('/404')
end
