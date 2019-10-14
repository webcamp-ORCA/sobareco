Rails.application.routes.draw do

  
  # ここから下はCustomersのルーティングになります
  get '/admin/customers' => "customers#index"
  get '/admin/customers/:id' => "customers#show"
  get '/admin/customers/:id/purchase_history' => "customers#purchase_history"
  get '/admin/customers/:id' => "customers#edit"
  get '/admin/customers/:id/destroy_confirm' => "customers#destroy_confirm"
  get '/admin/customers/:id' => "customers#destroy"

    namespace :admin do
   resources :arrival_management
  end

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
