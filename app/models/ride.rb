class Ride < ApplicationRecord
  has_many :passengers
  validates :name, presence: true
  validates :seats, presence: true
  validates :full, :inclusion => { :in => [true, false]}
end 
