class Public::CartItemsController < ApplicationController

<<<<<<< HEAD
<<<<<<< .merge_file_zCowiM
=======
before_action :ransack

>>>>>>> .merge_file_F4ouhP
=======
before_action :ransack

>>>>>>> 9a8722a34cf8cb8c716a9ef07c7dd9ec20ba4ab2

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
