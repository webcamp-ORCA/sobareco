class Admin::LabelsController < ApplicationController

before_action :ransack

  PER = 8
  def index
      @label = Label.new
      @labels = Label.page(params[:page]).per(PER)
      @q = Product.ransack(params[:q])
  end

  def create
      @label = Label.new(label_params)
        if @label.save
        redirect_to admin_products_path
      else
         @labels = Label.page(params[:page]).per(PER)
         render :index
   end
  end

  def edit
       @label = Label.find(params[:id])
       @q = Product.ransack(params[:q])
  end

  def update
        label = Label.find(params[:id])
        label.update(label_params)
        redirect_to admin_labels_path
  end

  def destroy
        label = Label.find(params[:id])
        label.destroy
        redirect_to admin_labels_path
  end

 private

    def label_params
        params.require(:label).permit(:label_name)
    end
   

    def ransack
        @q = Product.ransack(params[:q])
      end
end
