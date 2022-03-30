require "rails_helper"

RSpec.describe 'new ride page' do 
  it "has a link to a new page from rides index page " do
    visit '/rides'
    
    click_on "New Ride"
    expect(current_path).to eq ('/rides/new')
  end
  
  it "has form to create a new ride" do
    visit '/rides/new'
    
    fill_in 'Name', with: 'Impreza'
    fill_in 'Seats', with: 3
    choose(option: 'True')
    
    click_button ('Create Ride')
    expect(current_path).to eq('/rides')
    expect(page).to have_content('Impreza')
    
  end
end 
