require 'rails_helper'

RSpec.describe Passenger do
   
  describe 'relationships' do
    it {should belong_to (:ride)}
  end 
  
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should allow_values(true, false).for (:single)}
  end 
  
  
  describe 'instance methods' do
    before :each do
      Passenger.destroy_all
      Ride.destroy_all
      @camry = Ride.create!(name: 'Camry', seats: 4, full: true)
      @passenger3= @camry.passengers.create!(name: "Rod", age: 30, single: true )
      @passenger4= @camry.passengers.create!(name: "Ricky", age: 19, single: false )
      @passenger5= @camry.passengers.create!(name: "Speedy", age: 37, single: true )
      @passenger6= @camry.passengers.create!(name: "Susan", age: 30, single: false )
    end 
    it "only pass on the true booleans" do
      expect(Passenger.only_true).to eq([@passenger3, @passenger5])
    end
  end
end 
