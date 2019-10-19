class Public::DeliveriesController < ApplicationController
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
end
