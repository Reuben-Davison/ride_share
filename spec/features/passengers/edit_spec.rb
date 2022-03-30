require "rails_helper"

RSpec.describe 'passenger edit page ' do 
  it "has a form which edits the ride" do
    @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    @passenger1= @camry.passengers.create!(name: "Tim", age: 19, single: true )

    visit "/passengers/#{@passenger1.id}"
    click_on 'Update Passenger'
    expect(current_path).to eq ("/passengers/#{@passenger1.id}/edit")
    fill_in 'Name', with: 'Shawna'
    fill_in 'Age', with: 77
    choose(option: 'True')
    
    click_button ('Update Passenger')
    
    expect(current_path).to eq("/passengers/#{@passenger1.id}")
    expect(page).to have_content('Shawna')
    expect(page).to_not have_content('Tim')
    
    
  end

end
