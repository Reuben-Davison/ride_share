require "rails_helper"

RSpec.describe 'ride passengers index ' do 
  describe "ride passengers index" 
    before :each do
      @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      @gt40 = Ride.create!(name: 'GT40', seats: 1, full: true)
      @passenger1= @camry.passengers.create!(name: "Tim", age: 19, single: true )
      @passenger2= @camry.passengers.create!(name: "Becky", age: 37, single: true )
      @passenger3= @gt40.passengers.create!(name: "Rod", age: 30, single: true )
      
    end 
    it "lists all the passenger in a ride" do
      visit "/rides/#{@camry.id}/passengers"
      # expect(page).to have_content(@camry.name)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
      save_and_open_page
      visit "/rides/#{@gt40.id}/passengers"
      # expect(page).to have_content(@camry.name)
      expect(page).to_not have_content(@passenger1.name)
      expect(page).to_not have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      save_and_open_page
    end
  

end 
