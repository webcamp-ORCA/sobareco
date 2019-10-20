Rails.application.routes.draw do


  namespace :admin do
    resources :orders
    resources :artists
    resources :labels
    resources :genres
    resources :arrival_managements
    resources :customers do
      member do
        get :purchase_history
        get :destroy_confirm
      end
    end


    resources :products do
      get 'destroy_confirm', :on => :member
    end


    devise_for :admin_users, :controllers => {
          sessions: 'admin/admin_users/sessions',
          registrations: 'admin/admin_users/registrations',
          passwords: 'admin/admin_users/passwords'
       }
  end

  scope module: :public do
    resources :customers do
     get 'destroy_confirm',:on => :member
     get 'address_index', :on => :member
    end
    resources :orders do
     get 'order_confirm',:on => :member
    end
    resources :products
    resources :deliveries
    resources :cart_item
    devise_for :customers
  end





  # devise_for :customers
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end


