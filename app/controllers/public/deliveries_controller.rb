class Public::DeliveriesController < ApplicationController
  before_action :ransack
  def index
    @deliveries = Derivery.page(params[:page])
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end


   private
   def ransack
      @q = Product.ransack(params[:q])
    end

end
