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
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
      visit "/rides/#{@gt40.id}/passengers"
      expect(page).to_not have_content(@passenger1.name)
      expect(page).to_not have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
    end
    
    it "every passenger has an edit button" do
      
      visit "/rides/#{@camry.id}/passengers"
      click_on "Edit #{@passenger1.name}"
      
      expect(current_path).to eq("/passengers/#{@passenger1.id}/edit")
      
    end
    
    it "has a link to add a passenger" do
      visit "/rides/#{@camry.id}/passengers"
      
      click_on 'Create Passenger'
      expect(current_path).to eq("/rides/#{@camry.id}/passengers/new")
    end
  describe 'passenger ride index can ' do 
    it "re-sort children alphabetically " do
      @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      @passenger1= @camry.passengers.create!(name: "Tim", age: 19, single: true )
      @passenger2= @camry.passengers.create!(name: "Becky", age: 37, single: true )
      @passenger3= @camry.passengers.create!(name: "Rod", age: 30, single: true )
      visit "/rides/#{@camry.id}/passengers"
      click_on 'Sort Alphabetically'
      
      expect(@passenger2.name).to appear_before(@passenger3.name)
      expect(@passenger1.name).to_not appear_before(@passenger3.name)
    end
  end 

end 
