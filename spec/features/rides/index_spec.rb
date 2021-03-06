require "rails_helper"

RSpec.describe 'rides index ' do 
   
    before :each do
      Passenger.destroy_all
      Ride.destroy_all
      @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      sleep(1)
      @gt40 = Ride.create!(name: 'GT40', seats: 1, full: true)
      sleep(1)
      @accord = Ride.create!(name: 'Accord', seats: 4, full: true)
    end 
    
    it "lists the type of each ride" do
      visit '/rides'
      expect(page).to have_content(@camry.name)
      expect(page).to have_content(@gt40.name)
      expect(page).to have_content(@accord.name)
    end
    
    it "list when that record was created" do
      visit '/rides'
      expect(page).to have_content(@camry.created_at)
      expect(page).to have_content(@gt40.created_at)
      expect(page).to have_content(@accord.created_at)
      expect(@accord.name).to appear_before(@camry.name)
    end
    
    it "has link to edit rides info" do
      visit '/rides'
      
      click_on 'Edit Camry'
      expect(current_path).to eq("/rides/#{@camry.id}/edit")
    
      visit '/rides'
      click_on 'Edit Accord'
      expect(current_path).to eq("/rides/#{@accord.id}/edit")
      
    end
    
    it "has a link to delete ride next to each ride" do
      visit '/rides'
      save_and_open_page
      click_on 'DELETE Camry'
      expect(page).to_not have_content("Camry")
      
      click_on 'DELETE Accord'
      expect(page).to_not have_content("Accord")
      expect(page).to have_content("GT40")
      
    end

  

end 
