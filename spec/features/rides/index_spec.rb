require "rails_helper"

RSpec.describe 'rides index ' do 
  describe "rides index" 
    before :each do
      @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      @gt40 = Ride.create!(name: 'GT40', seats: 1, full: true)
      @accord = Ride.create!(name: 'Accord', seats: 4, full: true)
    end 
    it "lists the type of each ride" do
      visit '/rides'
      expect(page).to have_content(@camry.name)
      expect(page).to have_content(@gt40.name)
      expect(page).to have_content(@accord.name)
    end
  

end 
