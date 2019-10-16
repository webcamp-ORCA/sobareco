Rails.application.routes.draw do

<<<<<<< HEAD
  namespace :admin do
   resources :products
=======

  namespace :admin do
    resources :customers
    resources :orders
    resources :artists
    resources :labels
    resources :genres
    resources :arrival_managements
  end

   resources :arrival_management
   resources :product
>>>>>>> master
  end

  devise_for :customers




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end