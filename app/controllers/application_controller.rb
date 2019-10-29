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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :lastname_kana, :firstname_kana, :telephone, :post_code, :prefecture_id, :municipality, :address, :email, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :post_code, :prefecture_id, :municipality, :address, :email, :password])
  end


  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when AdminUser
      admin_products_path
    when Customer
      root_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
      root_path
 end


end

