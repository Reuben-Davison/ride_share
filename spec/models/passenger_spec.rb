require 'rails_helper'

RSpec.describe Passenger do 
  it {should belong_to :ride}
end 
