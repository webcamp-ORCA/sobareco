class Public::OrdersController < ApplicationController
  before_action :ransack
  def show
  end

  def order_confirm
  end

  def index
  end

  def new
  end

  def create
  end

  private
  def ransack

    @q = Product.ransack(params[:q])
  end
end
