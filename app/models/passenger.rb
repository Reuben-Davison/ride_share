
class Passenger < ApplicationRecord
  belongs_to :ride
  validates :name, presence: true
  validates :age, presence: true
  validates :single, inclusion: [true, false]
  
  def self.only_true
    where(single: true)
  end
end 
