Rails.application.routes.draw do


  root :to => 'public/products#index'

  namespace :admin do
    resources :records
    resources :discs
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


  end

   devise_for :admin_users,controllers: {
          sessions: 'admin/admin_users/sessions',
          registrations:'admin/admin_users/registrations',
          passwords: 'admin/admin_users/passwords'
        }




    # devise_for :customers,contrtollers: {
    #       sessions: 'public/customers/sessions',
    #       registrations: 'public/customers/registrations',
    #       passwords: 'public/customers/passwords'
    # }


 devise_for :customers,contrtollers: {
          sessions: 'public/customers/sessions',
          registrations: 'public/customers/registrations',
          passwords: 'public/customers/passwords'
    }

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
    resources :cart_items




  end




  end



end



