class Public::CartItemsController < ApplicationController


  def index
  end

  def create
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
