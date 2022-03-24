
class Passenger < ApplicationRecord
  belongs_to :ride
  validates :name, presence: true
  validates :age, presence: true
  validates :single, presence: true
end 
