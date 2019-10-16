class Admin::ArrivalManagementsController < ApplicationController


  PER = 8
  def new
      @arrival = ArrivalManagement.new

  end


  def create
        arrival = ArrivalManagement.new(arrival_params)
         arrival.save
        redirect_to new_admin_arrival_management_path

  end

  def index
     @arrival = ArrivalManagement.page(params[:page]).per(PER)
  end

     private

    def arrival_params
        params.require(:arrival_management).permit(:arrival_date, :arrival_count)
    end



end
