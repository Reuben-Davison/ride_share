class PassengersController < ApplicationController
  def index
    @passengers = Passenger.only_true
  end
  def show
    @passenger = Passenger.find(params[:id])
  end
  
  def edit 
    @passenger = Passenger.find(params[:id])
  end
  
  def update
    passenger = Passenger.find(params[:id])
    passenger.update(pass_params)
    passenger.save
    redirect_to "/passengers/#{passenger.id}"
  end
  
  def destroy 
    Passenger.destroy(params[:id])
    redirect_to '/passengers'
  end
  
  def create
    Passenger.create!(passenger_params)
    redirect_to '/rides/:id/passengers'
  end
  
  
  private
      def pass_params
        params.permit(:name, :age, :single)
      end 
  
end 
