Rails.application.routes.draw do


    namespace :admin do
   resources :arrival_management
  end
>>>>>>> origin/master
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
