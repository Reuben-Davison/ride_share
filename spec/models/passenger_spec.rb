require 'rails_helper'

RSpec.describe Passenger do
   
  describe 'relationships' do
    it {should belong_to (:ride)}
  end 
  
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:single)}
  end 
end 
