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
    Ride.create!(ride_params)
    redirect_to '/rides'
  end 
   
  def edit 
    @ride = Ride.find(params[:id])
  end 
  
  def destroy 
    Ride.destroy(params[:id])
    redirect_to '/rides'
  end
  
  def update 
    ride = Ride.find(params[:id])
    ride.update(ride_params)
    ride.save
    redirect_to "/rides/#{ride.id}"
  end 
  
  private
      def ride_params
        params.permit(:name, :full, :seats)
      end 
  
  
end 
