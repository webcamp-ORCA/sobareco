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

  namespace :admin do
   resources :arrival_management
   resources :product
   resources :customers do
    member do
      get :purchase_history
      get :destroy_confirm
    end
  end

end
  
  devise_for :admin_users,controllers: {
        sessions: 'admin/admin_users/sessions',
        registrations: 'admin/admin_users/registrations',
        passwords: 'admin/admin_users/passwords'
      }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
