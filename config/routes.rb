Rails.application.routes.draw do



  namespace :admin do

   resources :arrival_management
   resources :product
  end

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
