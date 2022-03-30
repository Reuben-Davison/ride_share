require "rails_helper"

RSpec.describe 'passenger show page ' do 
  it "lists the attributes of a passenger" do

    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true )
    passenger2= camry.passengers.create!(name: "Becky", age: 37, single: true )
    visit "/passengers/#{passenger1.id}"
    
    expect(page).to have_content(passenger1.name)
    expect(page).to have_content(passenger1.age)
    expect(page).to have_content(passenger1.single)
    
    expect(page).to_not have_content(passenger2.name)
    expect(page).to_not have_content(passenger2.age)
  end
  
  it "has a link to update passenger " do
    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true )
    visit "/passengers/#{passenger1.id}"
    click_on ("Update Passenger")
    expect(current_path).to eq "/passengers/#{passenger1.id}/edit"
  end
  
  
  it "has a link to delete the passengers" do
    Passenger.destroy_all
    Ride.destroy_all
    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true )
    passenger2= camry.passengers.create!(name: "Becky", age: 37, single: true )

    visit "/passengers/#{passenger1.id}"
    click_on "DELETE FOREVER"
    expect(current_path).to eq('/passengers')
    expect(page).to_not have_content('Tim')
    expect(page).to have_content('Becky')
  end

end 
