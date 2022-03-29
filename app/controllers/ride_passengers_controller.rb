class RidePassengersController < ApplicationController
  def index
    @ride = Ride.find(params[:id])
    @passengers = @ride.passengers
  end
  
  def show
    @ride = Ride.find(params[:id])
  end
  
  def new
  end
  
  
end 
