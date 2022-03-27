class RidesController < ApplicationController
  def index
    @rides = Ride.order_by_created_at
  end
  def show
    @ride = Ride.find(params[:id])
  end
end 
