require "rails_helper"

RSpec.describe 'new passenger page' do 
  it "has form to create a new passenger" do
    @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    visit "/rides/#{@camry.id}/passengers"

    click_on 'Create Passenger'
    
    fill_in 'Name', with: 'Bethany'
    fill_in 'Age', with: 39
    choose(option: 'True')
    
    click_button ('Create Passenger')
    expect(current_path).to eq("/rides/#{@camry.id}/passengers")
    expect(page).to have_content('Bethany')
    
  end
end 
