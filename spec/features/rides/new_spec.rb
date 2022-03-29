require "rails_helper"

RSpec.describe 'new ride page' do 
#   As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
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
