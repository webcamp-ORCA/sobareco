Rails.application.routes.draw do


=======
  namespace :admin do
>>>>>>> 428c69ca2dc7c3e56fcb0a74f136a9d903f12d61
   resources :arrival_management
   resources :product
  end

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
