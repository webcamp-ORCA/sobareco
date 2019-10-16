Rails.application.routes.draw do


  namespace :admin do
    resources :customers
    resources :orders
    resources :artists
    resources :labels
    resources :genres
    resources :arrival_managements
  end

  namespace :admin do
    devise_for :admin_users,controllers: {
        sessions: 'admin/admin_users/sessions',
        registrations: 'admin/admin_users/registrations',
        passwords: 'admin/admin_users/passwords'
      }
    end
  resources :product

  devise_for :customers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end