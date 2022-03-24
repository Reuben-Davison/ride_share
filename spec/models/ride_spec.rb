require 'rails_helper'

RSpec.describe Ride do 
  it{should have_many :passengers}
end 
