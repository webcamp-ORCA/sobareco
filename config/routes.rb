Rails.application.routes.draw do



  namespace :admin do
    resources :customers do
      member do
        get :purchase_history
        get :destroy_confirm
      end
    end
    resources :orders
    resources :artists
    resources :labels
    resources :genres
    resources :arrival_managements

  end
  
  devise_for :customers




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end