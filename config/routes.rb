Rails.application.routes.draw do



  namespace :public do
    get 'order_details/new'
  end
  get 'order_detail/new'

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
      get :destroy_complete
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


 devise_for :customers,controllers: {
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

     post 'order_confirm',:on => :member
     # get 'purchase_complete',:on=>:member
      get 'purchase_complete'

    get 'order_confirm',:on => :member

    end
    resources :products
    resources :deliveries
    resources :cart_items
    resources :cards, only: [:new, :show] do
      collection do
        post 'show', to: 'cards#show'
        post 'pay', to: 'cards#pay'
        post 'delete', to: 'cards#delete'
      end
    end

  end

end



