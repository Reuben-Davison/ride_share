require 'rails_helper'

RSpec.describe Ride do 
  
  describe 'relationships' do
    it {should have_many :passengers}
  end 
  
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:seats)}
    it {should allow_values(true, false).for (:full)}
  end 
end 
