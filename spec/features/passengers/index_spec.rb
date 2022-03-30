require "rails_helper"

RSpec.describe 'passenger index ' do 
  it "lists all the passengers" do

    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true )
    passenger2= camry.passengers.create!(name: "Becky", age: 37, single: true )
    passenger3= camry.passengers.create!(name: "Rod", age: 30, single: true )
    visit '/passengers'
    
    expect(page).to have_content(passenger1.name)
    expect(page).to have_content(passenger2.name)
    expect(page).to have_content(passenger3.name)
    
    expect(page).to have_content(passenger1.age)
    expect(page).to have_content(passenger2.age)
    expect(page).to have_content(passenger3.age)
    
    expect(page).to have_content(passenger1.single)
    expect(page).to have_content(passenger2.single)
    expect(page).to have_content(passenger3.single)
  end
  
  it "only returns true booleans" do
    Passenger.destroy_all
    Ride.destroy_all
    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true )
    passenger2= camry.passengers.create!(name: "Becky", age: 37, single: true )
    passenger3= camry.passengers.create!(name: "Rod", age: 30, single: true )
    passenger4= camry.passengers.create!(name: "Ricky", age: 19, single: false )
    passenger5= camry.passengers.create!(name: "Speedy", age: 37, single: true )
    passenger6= camry.passengers.create!(name: "Susan", age: 30, single: false )
    
    visit '/passengers'
    
    expect(page).to have_content("Tim")
    expect(page).to have_content("Rod")
    expect(page).to have_content("Speedy")
    expect(page).to_not have_content("Susan")
    
  end


end 
