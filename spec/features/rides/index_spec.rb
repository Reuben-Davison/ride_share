require "rails_helper"
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
RSpec.describe 'rides index' do 
  it "lists the type of each ride" do
    camry = Ride.create!(name: 'Camry', seats: 4, full: false)
    gt40 = Ride.create!(name: 'GT40', seats: 1, full: true)
    accord = Ride.create!(name: 'Accord', seats: 4, full: false)
    
    visit '/rides'
    
    expect(page).to have_content(camry.name)
    expect(page).to have_content(gt40.name)
    expect(page).to have_content(accord.name)
  end

end 
