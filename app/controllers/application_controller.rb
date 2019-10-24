class ApplicationController < ActionController::Base

  # add_flash_types :success, :info, :warning, :danger
  # protect_from_forgery with: :exception
  before_action :ransack

    def ransack
      @q = Product.ransack(params[:q])
    end

  add_flash_types :success, :info, :warning, :danger


  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :lastname_kana, :firstname_kana, :post_code, :prefecture_id, :municipality, :address, :telephone, :email, :password, :password_confirmation])
  end

end

