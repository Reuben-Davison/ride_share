require "rails_helper"

RSpec.describe 'rides show page ' do 
  it "lists the attributes of a ride" do

    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    
    visit "/rides/#{camry.id}"
    
    expect(page).to have_content(camry.name)
    expect(page).to have_content(camry.seats)
    expect(page).to have_content(camry.full)
  end

end 
