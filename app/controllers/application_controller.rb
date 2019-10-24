class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :lastname_kana, :firstname_kana, :post_code, :prefecture_id, :municipality, :address, :telephone, :email, :password, :password_confirmation])
  end
end

