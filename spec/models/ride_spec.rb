require 'rails_helper'

RSpec.describe Ride do 
  it {should have_many :passengers}
  it {should validate_presence_of(:type)}
  it {should validate_presence_of(:seats)}
  it {should validate_presence_of(:full)}
end 
