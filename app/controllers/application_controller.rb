class ApplicationController < ActionController::Base
  # add_flash_types :success, :info, :warning, :danger
  # protect_from_forgery with: :exception
  before_action :ransack

    def ransack
      @q = Product.ransack(params[:q])
    end

  add_flash_types :success, :info, :warning, :danger

end
