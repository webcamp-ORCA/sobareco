class ApplicationController < ActionController::Base

  # add_flash_types :success, :info, :warning, :danger
  # protect_from_forgery with: :exception
  before_action :ransack

#before_action :if_not_admin
   # def if_not_admin
   #   redirect_to root_path unless current_user.admin?
   # end

    def ransack
      @q = Product.ransack(params[:q])
    end

  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :post_code, :prefecture_id, :municipality, :address, :email, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :post_code, :prefecture_id, :municipality, :address, :email, :password])
  end

end

