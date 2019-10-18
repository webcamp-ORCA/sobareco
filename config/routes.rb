Rails.application.routes.draw do


  namespace :public do
    get 'deliveries/index'
    get 'deliveries/new'
    get 'deliveries/create'
    get 'deliveries/edit'
    get 'deliveries/update'
    get 'deliveries/destroy'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/create'
    get 'cart_items/update'
    get 'cart_items/destroy'
  end


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

  scope module: :public do
    resources :customers do
    get 'destroy_confilm',:on => :member
    end
    resources :products
    resources :deliveries
    resources :orders do
    get 'order_confirm',:on => :member
    end
  end

  namespace :admin do
   resources :arrival_management
   resources :product
   resources :customers do
    member do
      get :purchase_history
      get :destroy_confirm
    resources :products do
      get 'destroy_confirm', :on => :member

    end

  end


  
  devise_for :admin_users,controllers: {
        sessions: 'admin/admin_users/sessions',
        registrations: 'admin/admin_users/registrations',
        passwords: 'admin/admin_users/passwords'
      }

    end
  resources :product
  devise_for :customers


namespace :admin do
 devise_for :admin_users,controllers: {
     sessions: 'admin/admin_users/sessions',
     registrations: 'admin/admin_users/registrations',
     passwords: 'admin/admin_users/passwords'
   }
 end

  devise_for :customers




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
