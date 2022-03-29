class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end
  def show
    @passenger = Passenger.find(params[:id])
  end
  
  def create
    require "pry"; binding.pry
    Passenger.create!(passenger_params)
    redirect_to '/rides/:id/passengers'
  end
  
  
  private
      def pass_params
        params.permit(:name, :age, :single)
      end 
  
end 
