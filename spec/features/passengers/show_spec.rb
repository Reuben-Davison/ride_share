require "rails_helper"

RSpec.describe 'passenger show page ' do 
  it "lists the attributes of a passenger" do

    camry = Ride.create!(name: 'Camry', seats: 4, full: true)
    passenger1= camry.passengers.create!(name: "Tim", age: 19, single: true )
    passenger2= camry.passengers.create!(name: "Becky", age: 37, single: true )

    visit "/passengers/#{passenger1.id}"
    save_and_open_page
    
    expect(page).to have_content(passenger1.name)
    expect(page).to have_content(passenger1.age)
    expect(page).to have_content(passenger1.single)
    
    expect(page).to_not have_content(passenger2.name)
    expect(page).to_not have_content(passenger2.age)
  end

end 
