# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Passenger.destroy.all 
Ride.destroy.all
@camry = Ride.create!(name: 'Camry', seats: 4, full: true)
@gt40 = Ride.create!(name: 'GT40', seats: 1, full: true)
@accord = Ride.create!(name: 'Accord', seats: 4, full: true)

passenger1= @camry.passengers.create!(name: "Tim", age: 19, single: true )
passenger2= @camry.passengers.create!(name: "Becky", age: 37, single: true )
passenger3= @camry.passengers.create!(name: "Rod", age: 30, single: true )

passenger4= @accord.passengers.create!(name: "Joe", age: 21, single: true )
passenger5= @accord.passengers.create!(name: "Adam", age: 24, single: true )

passenger6= @gt40.passengers.create!(name: "Rick", age: 45, single: true )

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
