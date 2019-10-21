class Public::CartItemsController < ApplicationController

<<<<<<< .merge_file_zCowiM
=======
before_action :ransack

>>>>>>> .merge_file_F4ouhP

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
