require "rails_helper"

RSpec.describe 'rides show page ' do 
  it "lists the attributes of a ride" do

    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    
    
    visit "/rides/#{camry.id}"
    
    expect(page).to have_content(camry.name)
    expect(page).to have_content(camry.seats)
    expect(page).to have_content(camry.full)
  end
  
  it "shows the count of passengers" do
    camry = Ride.create!(name: 'Camry', seats: 4, full: true)

    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true, created_at: "2022-03-27 17:16:19" )
    passenger2= camry.passengers.create!(name: "Becky", age: 37, single: true )
    passenger3= camry.passengers.create!(name: "Rod", age: 30, single: true )

    visit "/rides/#{camry.id}"
    save_and_open_page
    expect(page).to have_content("Number of passengers: #{camry.passengers.count}")
  end

end 
