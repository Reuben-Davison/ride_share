require "rails_helper"

RSpec.describe 'passenger index ' do 
  it "lists all the passengers" do
#     As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

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

end 
