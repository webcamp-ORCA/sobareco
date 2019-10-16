class Admin::LabelsController < ApplicationController

  PER = 8
  def index
      @label = Label.new
      @labels = Label.page(params[:page]).per(PER)
  end

  def create
     label = Label.new(label_params)
        label.save
        redirect_to admin_labels_path
  end

  def edit
       @label = Label.find(params[:id])
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

end
