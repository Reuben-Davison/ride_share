class RidesController < ApplicationController
  def index
    @rides = Ride.order_by_created_at
  end
  
  def show
    @ride = Ride.find(params[:id])
  end
  
  def new 
  end
  
  def create
    ride = Ride.create!(ride_params)
    redirect_to '/rides'
  end  
  
  private
      def ride_params
        params.permit(:name, :full, :seats)
      end 
  
  
end 
