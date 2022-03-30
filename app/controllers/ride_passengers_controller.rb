class RidePassengersController < ApplicationController
  def index
    @ride = Ride.find(params[:id])
    if params[:sort]
      @passengers = @ride.passengers.order(:name)
    else
      @passengers = @ride.passengers
    end 
  end
  
  def show
    @ride = Ride.find(params[:id])
  end
  
  def new
    @ride = Ride.find(params[:id])
  end
  
  def create 
    @ride = Ride.find(params[:id])
    @passenger = @ride.passengers.create!(passenger_params)
    redirect_to "/rides/#{@ride.id}/passengers"
  end
  
  def sort 
    @ride = Ride.find(params[:id])
    @passengers = @ride.passengers.order(:name)
  end
  
  private
    def passenger_params
      params.permit(:name, :age, :single)
    end
  
  
  

end 
