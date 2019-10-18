Rails.application.routes.draw do


devise_for :customers

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
    resources :product
    resources :customers do
      member do
        get :purchase_history
        get :destroy_confirm
      end
      resources :products do
        get 'destroy_confirm', :on => :member
      end
    end
  end


    scope module: :public do
      resources :customers do
        get 'destroy_confilm',:on => :member
      end
      resources :cart_items
      resources :deliveries
      resources :products
      resources :deliveries
      resources :orders do
        get 'order_confirm',:on => :member
      end
    end


    namespace :admin do
     devise_for :admin_users,controllers: {
         sessions: 'admin/admin_users/sessions',
         registrations: 'admin/admin_users/registrations',
         passwords: 'admin/admin_users/passwords'
       }
    end


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
