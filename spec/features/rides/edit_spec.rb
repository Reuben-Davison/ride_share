require "rails_helper"

RSpec.describe 'ride edit page ' do 
  it "has a form which edits the ride" do
    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    visit "/rides/#{camry.id}"

    click_on 'Update Ride'
    expect(current_path).to eq ("/rides/#{camry.id}/edit")
    
    fill_in 'Name', with: 'Tundra'
    fill_in 'Seats', with: 3
    choose(option: 'True')
    click_button ('Update Ride')
    expect(current_path).to eq("/rides/#{camry.id}")
    expect(page).to have_content('Tundra')
    expect(page).to_not have_content('Camry')
    
    
  end

end
