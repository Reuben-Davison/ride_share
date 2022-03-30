require "rails_helper"

RSpec.describe "features that are on every page" do
  describe "Passenger link at the top of page " do
    
    it "has a link on every page back to Passenger index page" do
      
      camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      passenger1 = camry.passengers.create!(name: "Tim", age: 19, single: true, created_at: "2022-03-27 17:16:19" )

      pages = ["/rides", "/rides/#{camry.id}", "/passengers", "/passengers/#{passenger1.id}", "/rides/#{camry.id}/passengers"]
      
      pages.each do |page|
        visit page
        
        click_on "Passengers"
        expect(current_path).to eq('/passengers') 
      end 
    end
    
    it "has a link on every page back to Ride index page" do
      
      camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      passenger1 = camry.passengers.create!(name: "Tim", age: 19, single: true, created_at: "2022-03-27 17:16:19" )

      pages = ["/rides", "/rides/#{camry.id}", "/passengers", "/passengers/#{passenger1.id}", "/rides/#{camry.id}/passengers"]
      
      pages.each do |page|
        visit page
        
        click_on "Rides"
        expect(current_path).to eq('/rides') 
      end 
    end
    
     
  end 
end
