class Admin::ArrivalManagementsController < ApplicationController

before_action :ransack

  PER = 8
  def new
      @arrival = ArrivalManagement.new

  end


  def create
        @arrival = ArrivalManagement.new(arrival_params)
        if @arrival.save
           redirect_to admin_arrival_managements_path
        else
          render :new

  end
end


  def index
     @arrivals = ArrivalManagement.page(params[:page]).per(PER)
  end

private

    def arrival_params
        params.require(:arrival_management).permit(:arrival_date, :arrival_count, :product_id,)
    end

    def ransack
      @q = Product.ransack(params[:q])
    end




end
