class Admin::OrdersController < ApplicationController
  before_action :ransack
  def index
  end

  def update
  end

  private
  def ransack
    @q = Product.ransack(params[:q])
  end
end
